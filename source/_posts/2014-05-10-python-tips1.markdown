---
layout: post
title: "Python Tips 1"
date: 2014-05-10 13:00
comments: true
categories: python
published: true
---

1.使用PyCharm中，在一个Project中新建一个Directory和新建一个Package之后，IDE都会创建对应的目录，并添加默认的`__init__.py`文件，但是，两者还是不一样的。
如果在它们的目录下各新建一个python脚本测试输出`os.getcwd()`，如果是在Directory中得到的是Project的根目录'/Users/hujiawei/PycharmProjects/leetcodeoj'；如果是在Package中得到的是Package的根目录，如'/Users/hujiawei/PycharmProjects/leetcodeoj/pypackage'。

2.如果要在代码中添加中文注释的话，最好在文档开头加上下面的编码声明语句。关于Python中的字符串编码可见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386819196283586a37629844456ca7e5a7faa9b94ee8000)

```
# coding=utf-8 
或者
# -*- coding: utf-8 -*-
```

3.关于Python中的变量，摘自[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820042500060e2921830a4adf94fb31bcea8d6f5c000)

在Python中，变量名类似`__xxx__`的，也就是以双下划线开头，并且以双下划线结尾的，是特殊变量，特殊变量是可以直接访问的，不是private变量，所以，不能用`__name__`、`__score__`这样的变量名。

有些时候，你会看到以一个下划线开头的实例变量名(**两个下划线开头的也一样算，其实任何以下划线开头的都算**)，比如`_name`，这样的实例变量外部是可以访问的，但是，按照约定俗成的规定，当你看到这样的变量时，意思就是，**“虽然我可以被访问，但是，请把我视为私有变量，不要随意访问”**。

双下划线开头的实例变量是不是一定不能从外部访问呢？其实也不是。不能直接访问`__name`是因为Python解释器对外把`__name`变量改成了`_Student__name`，所以，仍然可以通过`_Student__name`来访问`__name`变量。但是强烈建议你不要这么干，因为不同版本的Python解释器可能会把`__name`改成不同的变量名。

总的来说就是，Python本身没有任何机制阻止你干坏事，一切全靠自觉。

下面我写了两个python脚本，大家可以对照看下哪些能够访问，哪些不能，不能的情况下如何操作变得可以访问(注释后面的`yes`和`no`表示能不能被访问)。

文件`APythonTestA.py`

```python 
# coding=utf-8

class ListNode:
    __class_field20 = 'node class field 2-0'
    __class_field22__ = 'node class field 2-2'

    def __init__(self, x):
        self.val = x
        self.next = None
        self.__class_inner_field20 = 'node class inner field 2-0'
        self.__class_inner_field22__ = 'node class inner field 2-2'

__class_field20 = 'node class field 2-0'
__class_field22__ = 'node class field 2-2'

_class_field10 = 'node class field 1-0'
_class_field12__ = 'node class field 1-2'
```

文件`APythonTestB.py`

```python 
# coding=utf-8
__author__ = 'hujiawei'
__doc__ = 'for python test 2'

import APythonTestA

if __name__ == '__main__':
    print(dir(APythonTestA.ListNode))
    #['_ListNode__class_field20', '__class_field22__', '__doc__', '__init__', '__module__']
    node = APythonTestA.ListNode(4)
    # print(node.__class_field20) #no
    print(node._ListNode__class_field20) #yes
    print(node.__class_field22__) #yes
    # print(node.__class_inner_field20) #no
    print(node._ListNode__class_inner_field20) #yes
    print(node.__class_inner_field22__) #yes

    print(dir(APythonTestA))
    #['ListNode', '__builtins__', '__class_field20', '__class_field22__', '__doc__', '__file__', '__name__', '__package__', '_class_field10', '_class_field12__']
    print(APythonTestA.__class_field20) #yes
    print(APythonTestA.__class_field22__) #yes
    print(APythonTestA._class_field10) #yes
    print(APythonTestA._class_field12__) #yes
```

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

5.关于Python的函数式编程，参见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386819866394c3f9efcd1a454b2a8c57933e976445c0000)，讲解得很好

高阶函数(使用函数作为参数或者返回一个函数的函数称为高阶函数)，匿名函数(lambda)，装饰器(decorator)和偏函数

用来测试一个函数花费的运行时间的装饰器，当然你也可以使用其他的方式，比如`Timer`来得到运行时间。下面代码来自[伯乐在线-python高级编程技巧](http://blog.jobbole.com/61171/)

```
def timethis(func):
    '''
    Decorator that reports the execution time.
    '''
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(func.__name__, end-start)
        return result
    return wrapper

@timethis
def countdown(n):
    while n > 0:
        n -= 1
```


6.关于Python的高级特性，参见[廖雪峰的python教程](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868196169906eb9ca5864384546bf3405ae6a172b3e000)

切片，迭代，列表生成式，生成器

使用生成器得到当前目录及其子目录中的所有文件的代码，下面代码来自[伯乐在线-python高级编程技巧](http://blog.jobbole.com/61171/)

```
import os
def tree(top):
    #path,folder list,file list
    for path, names, fnames in os.walk(top):
        for fname in fnames:
            yield os.path.join(path, fname)

for name in tree(os.getcwd()):
    print name
```
**除非特殊的原因，应该经常在代码中使用生成器表达式。但除非是面对非常大的列表，否则是不会看出明显区别的。**另一个使用生成器的代码示例：

```
num = [1, 4, -5, 10, -7, 2, 3, -1]
 
def square_generator(optional_parameter):
    return (x ** 2 for x in num if x > optional_parameter)
 
print square_generator(0)
# <generator object <genexpr> at 0x004E6418>
 
# Option I
for k in square_generator(0):
    print k
# 1, 16, 100, 4, 9
 
# Option II
g = list(square_generator(0))
print g
# [1, 16, 100, 4, 9]
```

7.使用`glob`模块可以用通配符的方式搜索某个目录下的特定文件，返回结果是一个list

```
import glob
flist=glob.glob('*.jpeg')
```

8.使用`os.getcwd()`可以得到当前目录，如果想切换到其他目录，可以使用`os.chdir('str/to/path')`，如果想执行Shell脚本，可以使用`os.system('mkdir newfolder')`。

对于日常文件和目录的管理, `shutil`模块提供了更便捷、更高层次的接口

```
import shutil
shutil.copyfile('data.db', 'archive.db')
shutil.move('/build/executables', 'installdir')
```


