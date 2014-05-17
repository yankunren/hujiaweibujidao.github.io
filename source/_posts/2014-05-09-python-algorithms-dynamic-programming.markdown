---
layout: post
title: "Python Algorithms - Dynamic Programming"
date: 2014-05-08 23:30
comments: true
categories: algorithm
published: true
---

参考内容：

1.[Python Algorithms: Mastering Basic Algorithms in the Python Language](http://link.springer.com/book/10.1007%2F978-1-4302-3238-4)

Chapter 8 Tangled Dependencies and Memoization

2.[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)

大家都知道，动态规划算法一般都有两种实现方式：

**1.直接自顶向下实现递归式，并将结果保存，这叫备忘录方法；**

**2.将递归式翻转，自底向上地迭代，将结果保存在某个数据结构中。**

编程有一个原则`DRY=Don’t Repeat Yourself`，就是说你的代码不要重复来重复去的，这个原则同样可以用于理解动态规划，动态规划除了满足最优子结构，它还存在子问题重叠问题，我们不能重复地去解决这些子问题，所以我们将子问题的解保存起来，类似缓存机制，之后遇到这个子问题时直接取出子问题的解。

举个简单的例子，斐波那契数列中的元素的计算，很简单，我们写下如下的代码：

```
def fib(i):
    if i<2: return 1
    return fib(i-1)+fib(i-2)
```

好，来测试下，运行`fib(10)`得到结果69，不错，速度也还行，换个大的数字，试试100，这时你会发现，这个程序执行不出结果了，为什么？递归太深了！要计算的子问题太多了！

所以，我们需要改进下，我们保存每次计算出来的子问题的解，用什么保存呢？用Python中的dict！那怎么实现保存子问题的解呢？用Python中的装饰器！如果不是很了解Python的装饰器，可以快速看下[这篇总结中关于装饰器的解释：Python Tips 1](http://hujiaweibujidao.github.io/blog/2014/05/10/python-tips1/)

修改刚才的程序，得到如下代码，定义一个函数`memo`返回我们需要的装饰器，这里用`cache`保存子问题的解，key是方法的参数，也就是数字`n`，值就是`fib(n)`返回的解。

```
from functools import wraps

def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        if args not in cache:
            cache[args]=func(*args)
        return cache[args]
    return wrap

@memo
def fib(i):
    if i<2: return 1
    return fib(i-1)+fib(i-2)
```
重新运行下`fib(100)`，你会发现这次很快就得到了结果`573147844013817084101`，这就是动态规划的威力，这种第一种带备忘录的递归方式。

**带备忘录的递归方式的优点就是易于理解，易于实现，代码简洁干净，运行速度也快，直接从需要求解的问题出发，而且只计算需要求解的子问题，没有多余的计算。但是，它也有自己的缺点，因为是递归形式，所以有限的栈深度是它的硬伤，有些问题难免会出现栈溢出了。**

于是，迭代版本的实现方式就诞生了！

**迭代实现方式有2个好处：1.运行速度快，因为没有用栈去实现，也避免了栈溢出的情况；2.迭代实现的话可以不使用dict来进行缓存，而是使用其他的特殊cache结构，例如多维数组等更为高效的数据结构。**

那怎么把递归版本转变成迭代版本呢？

**这就是递归实现和迭代实现的重要区别：递归实现不需要去考虑计算顺序，只要给出问题，然后自顶向下去解就行；而迭代实现需要考虑计算顺序，并且顺序很重要，算法在运行的过程中要保证当前要计算的问题中的子问题的解已经是求解好了的。**

斐波那契数列的迭代版本很简单，就是按顺序来计算就行了，不解释。

```
def fib_iter(n):
    if n<2: return 1
    a,b=1,1
    while n>=2:
        c=a+b
        a=b
        b=c
        n=n-1
    return c
```

斐波那契数列数列的变种问题经常出现在上楼梯的走法，每次只能走一个台阶或者两个台阶，广义上思考的话，也就是一个**决策问题**，到底当前这一步是选择它(走一步)还是不选择它(走两步)呢?

这种动态规划问题还有，例如求二项式系数`C(n,k)`，杨辉三角(求从源点到目标点有多少种走法)等等问题。

二项式系数`C(n,k)`表示从n个中选k个，假设我们现在考虑n个中的某一个，如果选择它的话，那么我们还需要从剩下的n-1个中选k-1个，即`C(n-1,k-1)`；如果不选择它的话，我们需要从剩下的n-1中选k个，即`C(n-1,k)`。所以，`C(n,k)=C(n-1,k-1)+C(n-1,k)`。

结合前面的装饰器，我们很快便可以实现求二项式系数的递归实现代码，其中的`memo`函数完全没变，只是在函数`cnk`前面添加了`@memo`而已，就这么简单！

```
from functools import wraps

def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        if args not in cache:
            cache[args]=func(*args)
        return cache[args]
    return wrap

@memo
def cnk(n,k):
    if k==0: return 1 #the order of `if` should not change!!!
    if n==0: return 0
    return cnk(n-1,k)+cnk(n-1,k-1)
```









