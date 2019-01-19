from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=80)
    password = models.CharField(max_length=40)
    phone = models.CharField(max_length=20)

class goodslste(models.Model):
    goodsname = models.CharField(max_length=20)

class Usermode(models.Model):
    username = models.CharField(max_length=100)
    email = models.CharField(max_length=40)
    password = models.CharField(max_length=40)

class UserModes(models.Model):
    username = models.CharField(max_length=100)
    email = models.CharField(max_length=40)
    password = models.CharField(max_length=40)
    # 令牌
    token = models.CharField(max_length=256)

class goods(models.Model):
    goodsname = models.CharField(max_length=100)  # 商品名
    price = models.IntegerField  # 价格
    prices = models.IntegerField  # 市场价
    Sales = models.IntegerField  # 销量
    num = models.IntegerField  # 评价数

class Cakr(models.Model):
    goodsname = models.CharField(max_length=100)
    price = models.IntegerField
    num = models.IntegerField(1)


class imgs(models.Model):
    imgname = models.CharField(max_length=1000)

class Goodse(models.Model):
    img = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    price = models.IntegerField()
    num = models.IntegerField(default=100)


class Cart(models.Model):
    # 用户
    user = models.ForeignKey(Usermode)

#     商品
    good = models.ForeignKey(Goodse)

#  商品数量
    number = models.IntegerField()

#  是否选中
    isselect = models.BooleanField(default=True)



#===============================================================

class app_goods(models.Model):
    goodsname = models.CharField(max_length=100)  # 商品名
    name = models.CharField(max_length=100)
    price = models.CharField(max_length=10)  # 价格
    prices = models.CharField(max_length=10)  # 市场价

class Cartt(models.Model):
    img= models.CharField(max_length=100)
    name= models.CharField(max_length=100)
    price = models.CharField(max_length=10)
    num = models.IntegerField

class xiangqing(models.Model):
    goods = app_goods

class Carts(models.Model):
    # 用户
    user = models.ForeignKey(Usermode)

    # 商品
    goods = models.ForeignKey(app_goods)

    # 额外信息 【手机: 版本、颜色、容量大小、数量...】
    # 商品数量
    number = models.IntegerField()
    # 是否选中
    isselect = models.BooleanField(default=True)















