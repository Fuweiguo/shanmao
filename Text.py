#!/usr/bin/env python
# -*- coding: utf-8 -*-

import requests
from urllib.parse import urlencode

import os
from hashlib import md5


def get_page(offset):

    params = {
        'offset':offset,
        'format':'json',
        'keyword':'车模',
        'autoload':'true',
        'count':'20',
        'cur_tab':'1',
        'from':'gallery'
    }

    url = 'https://www.toutiao.com/search_content/?'+urlencode(params)

    response = requests.get(url)

    if response.status_code == 200:
        return response.json()


def get_images(json):

    data = json.get('data')

    if data:

        for item in data:

            image_list = item.get('image_list')

            title = item.get('title')

            if image_list:

                for image in image_list:

                    yield {
                        'image':image.get('url'),
                        'title':title
                    }


def save_image(item):

    if not os.path.exists(item.get('title')):
        os.mkdir(item.get('title'))

    local_image_url = item.get('image')

    response = requests.get('http:'+ local_image_url)

    if response.status_code == 200:
        # 这里就是下载路径
        file_path = '{0}/{1}.{2}'.format(item.get('title'),md5(response.content).hexdigest(),'jpg')

        if not os.path.exists(file_path):

            with open(file_path,'wb') as f:
                f.write(response.content)

def main(offset):

    json = get_page(offset)

    for item in get_images(json):

        print(item)

        save_image(item)

if __name__ == '__main__':
    main(5)








