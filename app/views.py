from django.shortcuts import render, redirect
from django.http import HttpRequest, HttpResponse, HttpResponseRedirect, JsonResponse
from app.models import Usermode,goods,imgs
import random



# Create your views here.
def index(request):
    # username = request.COOKIES.get('username')
    #
    # return render(request,'index.html',context={'username':username})
    username = request.COOKIES.get('username')
    return render(request,'index.html',context={'username':username})

def regist(request):
    if request.method == 'GET': # 获取注册页面
        return render(request, 'regist.html')
    elif request.method == 'POST':  # 注册操作
        user = Usermode()
        user.username = request.POST.get('username')
        user.password = request.POST.get('password')
        user.email = request.POST.get('email')
        user.save()

        response = redirect('mt:index')
        response.set_cookie('username',user.username,max_age=60*30)


    return response



def login(request):
    if request.method == 'GET':  # 获取登录页面
        return render(request, 'login.html')
    elif request.method == 'POST':  # 登录操作
        # 一定要检查，数据能从客户端传输到服务端
        # print(request.POST)

        # 和数据库中的数据对比，假如一致: 成功;   否则: 失败;
        username = request.POST.get('username')
        password = request.POST.get('password')

        users = Usermode.objects.filter(username=username).filter(password=password)
        if users.count():  # 成功
            # 重定向到首页
            response = redirect('mt:index')
            # 状态保持 【设置cookie】
            response.set_cookie('username', username, max_age= 60*30)
            return response
        else:  # 失败(用户名或密码错误)
            return render(request, 'login.html', context={'err': '用户名或密码错误'})

def checkemail(request):
    email = request.GET.get('username')
    users = Usermode.objects.filter(email=email)
    if users.exists():  # 占用
        return JsonResponse({'msg': '账号被占用！', 'status':0})
    else:   # 可用
        return JsonResponse({'msg': '账号可以使用!', 'status':1})



def balance(request):
    return render(request,'balance.html')


def nike(request):
    return render(request,'nike.html')


def logout(request):
    response = redirect('mt:index')
    response.delete_cookie('username')
    return response