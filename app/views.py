from django.shortcuts import render, redirect
import hashlib
import time
from django.http import HttpRequest, HttpResponse, HttpResponseRedirect, JsonResponse
from app.models import app_goods , UserModes , app_Carts , Order , OrderGoods
import random



# Create your views here.
# 主页
def index(request):
    try:
        token = request.session.get('token')
        username = UserModes.objects.all().get(token=token)
        username = username
        good = app_goods.objects.all()
        data = {
            'goods': good,
            'username': username.username,
        }
        return render(request, 'index.html', context=data)

    except:
        good = app_goods.objects.all()
        data = {
            'goods': good,
        }

        return render(request, 'index.html', context=data)

# 注册
def regist(request):
    if request.method == 'GET': # 获取注册页面
        return render(request, 'regist.html')
    elif request.method == 'POST':  # 注册操作
        print(request.POST)
        user = UserModes()
        user.username = request.POST.get('username')
        user.password = generate_password(request.POST.get('password'))
        user.email = request.POST.get('email')

        user.token = generate_token()
        request.session['token'] = user.token

        # response = redirect('mt:index')
        # response.set_cookie('username', user.username, max_age=60 * 30)

        user.save()

    return redirect('mt:index')

# 密码加密
def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()

# token加密
def generate_token():
    md5 = hashlib.md5()
    tempstr = str(time.time()) + str(random.random())
    md5.update(tempstr.encode('utf-8'))
    return md5.hexdigest()

# 登录
def login(request):
    if request.method == 'GET':  # 获取登录页面
        return render(request, 'login.html')
    elif request.method == 'POST':  # 登录操作
        print('sssssdd=======')
        # 一定要检查，数据能从客户端传输到服务端
        # print(request.POST)

        # 和数据库中的数据对比，假如一致: 成功;   否则: 失败;
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password)

        try:
            users = UserModes.objects.get(username=username)
            print(users)

            # .filter(password=password)
            if users.password == generate_password(password):  # 成功
                users.token = generate_token()
                users.save()
                request.session['token'] = users.token
                # 重定向到首页
                response = redirect('mt:index')
                # 状态保持 【设置cookie】
                response.set_cookie('username', username, max_age= 60*60)
                return response
            else:  # 失败(用户名或密码错误)
                print('sfsdfasgfdg')
                return render(request, 'login.html', context={'err': '用户名或密码错误'})
        except:
            return render(request, 'login.html', context={'err': '账号不存在'})

def checkemail(request):
    email = request.GET.get('username')
    users = UserModes.objects.filter(email=email)
    if users.exists():  # 占用
        return JsonResponse({'msg': '账号被占用！', 'status':0})
    else:   # 可用
        return JsonResponse({'msg': '账号可以使用!', 'status':1})


# 购物车
def balance(request):
    token = request.session.get('token')
    if token:
        user = UserModes.objects.all().get(token=token)
        carts = app_Carts.objects.filter(user=user).exclude(number=0)
        print(type(carts))
        data = {
            "carts": carts,
        }


        return render(request,'balance.html',context=data)
    else:
        return redirect('mt:login')

# 详情
def nike(request,id):
    goods = app_goods.objects.get(pk=id)
    token = request.session.get('token')
    if token:
        user = UserModes.objects.all().get(token=token)
        carts = app_Carts.objects.filter(user=user)
        data = {
            'carts': carts,
            'goods':goods
        }

        return render(request,'nike.html',context=data)
    else:
        return redirect('mt:login')



# 注销
def logout(request):
    request.session.flush()
    return redirect('mt:index')

#添加购物车
def addcart(request):
    # 有token，就知道是谁
    token = request.session.get('token')
    print(token)
    print('添加购物车')

    if token:   # 加操作(有登录)
        user = UserModes.objects.get(token=token)
        print(type(user))
        # print('token')
        goodsid = request.GET.get('goodsid')
        goods = app_goods.objects.get(pk=goodsid)
        # 判断该商品是否存在
        print(user.username,user.email,user.id,goods.id)
        cartss = app_Carts.objects.filter(user=user).filter(goods=goods)
        # carts = Carts.objects.filter(user=user)
        print('==========')
        if cartss.exists():  # 存在，修改numbner
            print('修改成')
            carts = cartss.first()
            carts.number = carts.number + 1
            carts.save()
        else:   # 添加一条新的记录
            print('添加成功')
            carts = app_Carts()
            carts.user = user
            carts.goods = goods
            print(goods)
            carts.number = 1
            carts.save()

        return JsonResponse({'msg' : '添加购物车成功!','status': 1, 'number': carts.number})
    else:       # 跳转到登录(未登录)
        return JsonResponse({'msg':'请登录后操作!','status': 0})

# 减删商品
def subcart(request):
    token = request.session.get('token')
    user = UserModes.objects.get(token=token)

    goodsid = request.GET.get('goodsid')
    goods = app_goods.objects.get(pk=goodsid)

    cart = app_Carts.objects.filter(user=user).filter(goods=goods).first()
    cart.number = cart.number - 1
    cart.save()

    responseData = {
        'msg': '商品删减成功',
        'status': 1,
        'number': cart.number,
    }

    return JsonResponse(responseData)

#单号
def generate_identifire():
    tempstr = str(int(time.time())) + str(random.random())
    return tempstr


#下单
def generateorder(request):
    token = request.session.get('token')
    print('进入下单')
    user = UserModes.objects.get(token=token)

    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifire()
    order.save()

    # 订单商品
    carts = app_Carts.objects.filter(user=user).filter(isselect=True).exclude(number=0)
    # 添加到订单中
    for cart in carts:
        print('循环')
        orderGoods = OrderGoods()
        print('订单商品')
        orderGoods.order = order
        print('绑定订单')
        a = cart.goods
        print(type(a))
        orderGoods.goods = a
        print('绑定商品')
        orderGoods.number = cart.number

        orderGoods.save()

        # 从购物车中删除
        cart.delete()

    data = {
        'msg': '下单成功',
        'status': 1,
        'identifier': order.identifier
    }

    return JsonResponse(data)


def orderdetail(request,identifier):
    order = Order.objects.get(identifier=identifier)

    return render(request, 'orderdetail.html', context={'order': order})


def orderlist(request, status):
    orders = Order.objects.filter(status=status)

    return render(request, 'orderlist.html', context={'orders': orders})


# def delete(request,id):
#     print('进了')
#     goods = OrderGoods.objects.all().get(pk=id)
#     print('sdfdf')
#     goods.delete()
#     render(request, 'orderdetail.html')
# #     goods = app_goods.objects.get(pk=id)