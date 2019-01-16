import requests
from lxml import etree
import os

class Spider(object):
    def start_request(self):
        response = requests.get("https:")
        html = etree.HTML(response.text)
        Bigtit_list = html.xpath('//div[@class = "book-mid-info"]/h4/a/text()')
        Bigsrc_list = html.xpath('//div[@class="book-mid-info"]/h4/a/@href')
        for Bigtit, Bigsrc in zip(Bigtit_list,Bigsrc_list):
            if os.path.exists(Bigtit) == False:
                os.mkdir(Bigtit)
            self.file_data(Bigtit, Bigsrc)

    def file_data(self, Bigtit,Bigsrc):
        response = requests.get("http:" + Bigsrc)
        html = etree.HTML(response.text)
        Listit_list = html.xpath('//ul[@class="cf"]/li/a/text()')
        Litsrc_list = html.xpath('//ul[@class="cf"]/li/a/@href')
        for Listit,Listsrc in zip(Listit_list,Litsrc_list):
            print(Listit,Listsrc,Bigtit)



spider = Spider()
spider.start_request()





