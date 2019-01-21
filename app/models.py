from django.db import models

class UserModes(models.Model):
    username = models.CharField(max_length=100)
    email = models.CharField(max_length=40)
    password = models.CharField(max_length=40)
    # 令牌
    token = models.CharField(max_length=256)

class app_goods(models.Model):
    goodsname = models.CharField(max_length=100)  # 商品名
    name = models.CharField(max_length=100)
    price = models.CharField(max_length=10)  # 价格
    prices = models.CharField(max_length=10)  # 市场价

class app_Carts(models.Model):
    # 用户
    user = models.ForeignKey(UserModes)

    # 商品
    goods = models.ForeignKey(app_goods)

    # 额外信息 【手机: 版本、颜色、容量大小、数量...】
    # 商品数量
    number = models.IntegerField()
    # 是否选中
    isselect = models.BooleanField(default=True)


# 订单 模型类
# 一个用户 对应 多个订单
class Order(models.Model):
    # 用户
    user = models.ForeignKey(UserModes)
    # 状态
    # -2 退款
    # -1 过期
    # 0 未付款
    # 1 已付款，未发货
    # 2 已付款，已发货
    # 3 已签收，未评价
    # 4 已评价
    status = models.IntegerField(default=0)
    # 创建时间
    createtime = models.DateTimeField(auto_now_add=True)
    # 订单号
    identifier = models.CharField(max_length=256)


# 订单商品 模型类
# 一个订单 对应 多个商品
class OrderGoods(models.Model):
    # 订单
    order = models.ForeignKey(Order)
    # 商品
    goods = models.ForeignKey(app_goods)
    # 商品规格
    number = models.IntegerField()












