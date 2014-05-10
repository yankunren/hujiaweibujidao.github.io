---
layout: post
title: "Python Tips 1"
date: 2014-05-10 13:00
comments: true
categories: python
published: true
---

1.使用PyCharm中，在一个Project中新建一个Directory和新建一个Package之后，IDE都会创建对应的目录，并添加默认的`__init__.py`文件，但是，两者还是不一样的，如果在目录下新建一个python脚本测试输出`os.getcwd()`，如果是在Directory中得到的是Project的根目录`/Users/hujiawei/PycharmProjects/leetcodeoj`，如果是在Package中得到的是Package的根目录，如`/Users/hujiawei/PycharmProjects/leetcodeoj/pypackage`！

2.如果要在代码中添加中文注释的话，最好在文档开头加上`# coding=utf-8`或者`# -*- coding: utf-8 -*-`，关于Python中的字符串编码可见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386819196283586a37629844456ca7e5a7faa9b94ee8000)

3.关于Python中的变量，摘自[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820042500060e2921830a4adf94fb31bcea8d6f5c000)

在Python中，变量名类似`__xxx__`的，也就是以双下划线开头，并且以双下划线结尾的，是特殊变量，特殊变量是可以直接访问的，不是private变量，所以，不能用`__name__`、`__score__`这样的变量名。

有些时候，你会看到以一个下划线开头的实例变量名，比如`_name`，这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，当你看到这样的变量时，意思就是，`“虽然我可以被访问，但是，请把我视为私有变量，不要随意访问”`。

双下划线开头的实例变量是不是一定不能从外部访问呢？其实也不是。不能直接访问`__name`是因为Python解释器对外把`__name`变量改成了`_Student__name`，所以，仍然可以通过`_Student__name`来访问`__name`变量：

```
bart._Student__name
'Bart Simpson'
```

但是强烈建议你不要这么干，因为不同版本的Python解释器可能会把`__name`改成不同的变量名。

总的来说就是，Python本身没有任何机制阻止你干坏事，一切全靠自觉。

4.关于Python中函数的参数，摘自[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001374738449338c8a122a7f2e047899fc162f4a7205ea3000)

Python的函数具有非常灵活的参数形态，既可以实现简单的调用，又可以传入非常复杂的参数。
默认参数一定要用不可变对象，如果是可变对象，运行会有逻辑错误！

要注意定义可变参数和关键字参数的语法：

`*args`是可变参数，args接收的是一个tuple；

`**kw`是关键字参数，kw接收的是一个dict。

以及调用函数时如何传入可变参数和关键字参数的语法：

可变参数既可以直接传入：`func(1, 2, 3)`，又可以先组装list或tuple，再通过`*args`传入：`func(*(1, 2, 3))；`

关键字参数既可以直接传入：`func(a=1, b=2)`，又可以先组装dict，再通过`**kw`传入：`func(**{'a': 1, 'b': 2})`。

使用`*args`和`**kw`是Python的习惯写法，当然也可以用其他参数名，但最好使用习惯用法。

5.关于Python的函数式编程，参见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386819866394c3f9efcd1a454b2a8c57933e976445c0000)

高阶函数，匿名函数，装饰器和偏函数

6.关于Python的高级特性，参见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868196169906eb9ca5864384546bf3405ae6a172b3e000)

切片，迭代，列表生成式，生成器

7.使用`glob`模块可以用通配符的方式搜索某个目录下的特定文件，返回结果是一个list

```
import glob
flist=glob.glob('*.jpeg')
```

8.使用`os.getcwd()`可以得到当前目录，如果想切换到其他目录，可以使用`os.chdir('str/to/path')`，如果想执行Shell脚本，可以使用`os.system('mkdir newfolder')`。对于日常文件和目录的管理, `shutil`模块提供了更便捷、更高层次的接口

```
import shutil
shutil.copyfile('data.db', 'archive.db')
shutil.move('/build/executables', 'installdir')
```


