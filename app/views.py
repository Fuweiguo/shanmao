from django.shortcuts import render, redirect
import hashlib
import time
from django.http import HttpRequest, HttpResponse, HttpResponseRedirect, JsonResponse
from app.models import app_goods,Carts,UserModes,imgs
import random



# Create your views here.
def index(request):
    username = request.COOKIES.get('username')
    good = app_goods.objects.all()
    data = {
        'goods': good,
        'username':username,
    }
    return render(request, 'index.html', context=data)

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


def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()

def generate_token():
    md5 = hashlib.md5()
    tempstr = str(time.time()) + str(random.random())
    md5.update(tempstr.encode('utf-8'))
    return md5.hexdigest()

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



def balance(request):


    carts = Carts.objects.all()

    return render(request,'balance.html')


def nike(request,id):
    goods = app_goods.objects.get(pk=id)
    carts = []
    data = {
        'carts': carts,
        'goods':goods
    }

    return render(request,'nike.html',context=data)


def logout(request):
    response = redirect('mt:index')
    response.delete_cookie('username')
    return response


def addcart(request):
    # 有token，就知道是谁
    token = request.session.get('token')
    print(token)
    print('添加购物车')

    if token:   # 加操作(有登录)
        user = UserModes.objects.get(token=token)
        print(user)
        print('token')
        goodsid = request.GET.get('goodsid')
        goods = app_goods.objects.get(pk=goodsid)

        # 第一次操作: 添加一条新记录
        # 后续操作: 只需要修改number

        # 判断该商品是否存在
        print(user.id,goods.id)
        carts = Carts.objects.filter(user=user).filter(goods=goods)
        print('==========')
        if carts.exists():  # 存在，修改numbner
            print('修改成')
            cart = carts.first()
            cart.number = cart.number + 1
            cart.save()
        else:   # 添加一条新的记录
            print('添加成功')
            cart = Carts()
            cart.user = user
            cart.goods = goods
            print(goods)
            cart.number = 1
            cart.save()

        return JsonResponse({'msg':'{}-添加购物车成功!'.format(goods.productlongname),'status': 1, 'number':cart.number})
    else:       # 跳转到登录(未登录)
        # 在ajax是不能使用重定向
        # ajax更多就是用于数据的传输(数据交互)

        # 问题: 没有登录，就需要跳转到登录页面；
        # 但在服务端重定向能不能用？   客户端
        # return redirect('axf:login')
        return JsonResponse({'msg':'请登录后操作!','status': 0})


def subcart(request):
    token = request.session.get('token')
    user = UserModes.objects.get(token=token)

    goodsid = request.GET.get('goodsid')
    goods = app_goods.objects.get(pk=goodsid)

    cart = Carts.objects.filter(user=user).filter(goods=goods).first()
    cart.number = cart.number - 1
    cart.save()

    responseData = {
        'msg': '{}-商品删减成功'.format(goods.productlongname),
        'status': 1,
        'number': cart.number
    }

    return JsonResponse(responseData)