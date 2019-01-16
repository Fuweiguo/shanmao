                          #                                英雄id    皮肤id
# "https://ossweb-img.qq.com/images/lol/web201310/skin/big  103      000   .jpg"

#1.获取所有英雄的ID
#2.拼接所有皮肤的url（链接地址）
#3.保存图片






import requests  #第三方扩展包，需要安装 pip install requests
import re   #正则模块
import json  #json类型


start_url = "https://ossweb-img.qq.com/images/lol/web201310/skin/big"

#1.获取所有英雄的ID
#找英雄的ID     Network --> 一般在XHR        一个一个找
url = "https://lol.qq.com/biz/hero/champion.js"
r = requests.get(url).text  #利用requests来获取url的数据
# print(r)


# 并且提取出来的数据时字符串类型的数据
ret = re.search('"keys":(.*?),"data"',r)

#获取英雄id
id_list = ret.group(1)    # id_list他是一个字符串  JSON类型的字符串  ‘{“name”:"python"}’

# print(type(id_list))  #打印数据类型

id_dict = json.loads(id_list)  #1导入json模块  2把JSON类型字符串转换成一个字典
# print(id_dict)
# print(type(id_dict))

for i,j in id_dict.items():
    # print(i,j)
    id = i
    name = j

    #2.拼接所有皮肤的url（链接地址）
    # 假设每个英雄有10个皮肤
    for k in range(10):
        # '%03d' % k    001  002  003  004
        result_url = start_url + id + '%03d' % k + '.jpg'
        print(result_url)

        #3.保存图片
        # 200表示成功状态码/404无效  成功才能获取保存，
        #               获取链接地        状态码
        if requests.get(result_url).status_code == 200:
            #             请求链接地址
            img = requests.get(result_url)

            print('正在抓取%s英雄的%d号皮肤.jpg' % (name, k))
                # 二进制数据类型
            with open('LOLimg/%s%d.jpg' % (name,k), 'wb') as f:
                # img.content就是写入图片数据类型
                f.write(img.content)


