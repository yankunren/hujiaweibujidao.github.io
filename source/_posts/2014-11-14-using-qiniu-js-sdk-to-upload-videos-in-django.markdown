---
layout: post
title: "using Qiniu JS SDK to upload Videos in Django"
date: 2014-11-14 22:48
comments: true
categories: python
---

最近做的项目中需要使用七牛云存储服务来存储网站(Django开发)中用户上传的视频，于是就有了下面一番折腾。

我想要的目标是可以上传视频，最好还能显示上传的进度

传送门: [七牛的Javascript SDK on Github](https://github.com/qiniupd/qiniu-js-sdk)

七牛提供了一个演示通过该SDK进行文件上传的网站：[http://jssdk.demo.qiniu.io](http://jssdk.demo.qiniu.io)

![image](http://hujiaweibujidao.github.io/images/qiniu1.png)

这个网站做得非常好，演示了文件上传并显示了上传的进度，正是我想要的效果，所以我后面把这个JS SDK嵌入到Django项目中，测试其功能

下面这段代码演示的是在纯Python项目中如何将文件上传到七牛服务器，若还没有安装七牛的话请先运行 `pip install qiniu`

```python
# coding=utf-8
import os

__author__ = 'hujiawei'
__doc__ = 'qiniu sdk video demo'

import StringIO
import sys
import qiniu.conf
import qiniu.rs
import qiniu.io

BUCKET_NAME = "YOUR_BUCKET_NAME"
qiniu.conf.ACCESS_KEY = "YOUR_ACCESS_KEY"
qiniu.conf.SECRET_KEY = "YOUR_SECRET_KEY"

policy = qiniu.rs.PutPolicy(BUCKET_NAME)
uptoken = policy.token()
print(uptoken)

# ############ 示例：上传视频 ###############
# extra = qiniu.io.PutExtra()
# item = os.path.join(os.getcwd(), 'hellokitty.m4v')
# ret, err = qiniu.io.put_file(uptoken, None, item, extra)
# if err is not None:
#     sys.stderr.write('error: %s ' % err)

#ok: hamster.swf


# ############ 示例：上传图片 ###############
extra = qiniu.io.PutExtra()
extra.mime_type = "image/jpeg"
# print os.getcwd() #/Users/hujiawei/PycharmProjects/qiniusimple
item = os.path.join(os.getcwd(), 'coder.jpg')
ret, err = qiniu.io.put_file(uptoken, None, item, extra)
if err is not None:
    sys.stderr.write('error: %s ' % err)

# extra = qiniu.io.PutExtra()
# # extra.mime_type = "image/jpeg" #image/png 七牛能够自动识别mime-type
# # print os.getcwd() #/Users/hujiawei/PycharmProjects/qiniusimple
# item = os.path.join(os.getcwd(), 'apple.png')
# ret, err = qiniu.io.put_file(uptoken, None, item, extra)

############# 示例：上传字符串内容 ###############
# extra = qiniu.io.PutExtra()
# extra.mime_type = "text/plain"
# key = "hellotxt"
# data = StringIO.StringIO("hello!") # data 可以是str或readable对象
# ret, err = qiniu.io.put(uptoken, key, data, extra)
# if err is not None:
#     sys.stderr.write('error: %s ' % err)
```

本来我以为要在Django中使用这个SDK会很难，因为看到该项目的Github介绍还要安装`Node.js`等工具，可是实践了发现其实不难，如果只是想简单地使用它那么可以就把它们当做一个js库就行了。

需要的可以下载 [A Django site using Qiniu JS SDK](http://hujiaweibujidao.github.io/files/qiniudemo.zip)

如果要正常运行，请先仔细阅读下面的内容：

1.修改`video/views.py`中的如下内容，具体填什么你懂得

```
BUCKET_NAME = "YOUR_BUCKET_NAME"
qiniu.conf.ACCESS_KEY = "YOUR_ACCESS_KEY"
qiniu.conf.SECRET_KEY = "YOUR_SECRET_KEY"
```

2.修改`static/js/main.js`中的内容，我设置了获取uptoken的请求URL为`/video/uptoken`，这样每次要上传一个文件的时候，这个URL就会被调用，它会返回一个JSON字符串，包含了`uptoken`的值，具体可见`video/views.py`中的`uptoken`方法；其次还设置了域名，你需要将它设置为你的七牛域名，例如`http://whyeduvideo.qiniudn.com/`

```
uptoken_url: '/video/uptoken',
domain: 'YOUR_DOMAIN_NAME',
```

其他的内容就不用修改了，直接运行项目，进入到`http://127.0.0.1:8000/video/`下就能看到

![image](http://hujiaweibujidao.github.io/images/qiniu2.png)







