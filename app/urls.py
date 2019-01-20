from django.conf.urls import url
from app import views

urlpatterns = [

    # 登录
    url(r'^login/$',views.login,name='login'),
    # 首页
    url(r'^$',views.index,name='index'),
    # 注册
    url(r'^regist/$',views.regist,name='regist'),

    #验证
    url(r'^checkemail/$',views.checkemail,name='checkemail'),
    # 购物车
    url(r'^balance/$',views.balance,name='balance'),
    # 商品详情
    url(r'^nike/(\d+)$',views.nike,name='nike'),
    #注销
    url(r'^logout/$',views.logout,name='logout'),

    #添加购物车
    url(r'^addcart/$',views.addcart,name='addcart'),
    #
    url(r'^subcart/$',views.subcart,name='subcart'),

    url(r'^generateorder/$', views.generateorder, name='generateorder'),  # 下单
    url(r'^orderlist/(\d+)/$', views.orderlist, name='orderlist'),
    url(r'^orderdetail/(.+)/$', views.orderdetail, name='orderdetail'),  # 订单详情

]

