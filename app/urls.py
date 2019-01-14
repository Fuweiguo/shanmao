from django.conf.urls import url
from app import views

urlpatterns = [
    # 首页
    url(r'^$',views.index,name='index'),
    # 注册
    url(r'^regist/$',views.regist,name='regist'),
    # 登录
    url(r'^login/$',views.login,name='login'),
    # 购物车
    url(r'^balance/$',views.balance,name='balance'),
    # 商品详情
    url(r'nike/$',views.nike,name='nike'),
    url(r'logout/$',views.logout,name='logout'),

]
