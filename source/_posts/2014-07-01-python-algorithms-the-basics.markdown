---
layout: post
title: "Python Algorithms - C2 The basics"
date: 2014-07-01 10:20
comments: true
categories: algorithm
published: true
---

**<center>Python算法设计篇(2)</center>**
**<center>逸夫图书馆, 2014/7/1</center>**

### <center>Chapter 2: The basics</center>

> Tracey: I didn’t know you were out there.    
Zoe: Sort of the point. Stealth—you may have heard of it.      
Tracey: I don’t think they covered that in basic.      
  —— From “The Message,” episode 14 of Firefly

本节主要介绍了算法渐近运行时间的表示法和Python中树和图的实现方式。

#### 1.计算模型

Alan Turing的图灵机模型： **A Turing machine is a simple (abstract) device that can read from, write to, and move along an infinitely long strip of paper. ** The actual behavior of the machines varies. Each is a so-called finite state machine: it has a finite set of states (some of which indicate that it has finished), and every symbol it reads potentially triggers reading and/or writing and switching to a different state. You can think of this machinery as a set of rules. (“If I am in state 4 and see an X, I move one step to the left, write a Y, and switch to state 9.”) 

RAM模型(random-access machine)：标准的单核计算机，它大致有下面三个性质

• We don’t have access to any form of concurrent execution; the machine simply executes one instruction after the other.

计算机不能并发执行而只是按照指令顺序依次执行指令。

• Standard, basic operations (such as arithmetic, comparisons, and memory access) all take constant (although possibly different) amounts of time. There are no more complicated basic operations (such as sorting).

基本的操作都是常数时间完成的，没有其他的复杂操作。

• One computer word (the size of a value that we can work with in constant time) is not unlimited but is big enough to address all the memory locations used to represent our problem, plus an extra percentage for our variables.

计算机的字长足够大以使得它能够访问所有的内存地址。

算法的本质： **An algorithm is a procedure, consisting of a finite set of steps (possibly including loops and conditionals) that solves a given problem in finite time. **

the notion of running time complexity (as described in the next section) is based on knowing how big a problem instance is, and that size is simply the amount of memory needed to encode it.  

[算法的运行时间是基于问题的大小，这个大小是指问题的输入占用的内存空间大小]

#### 2.算法渐近运行时间

主要介绍了大O符号、大$\Omega$符号以及大$\Theta$符号，这部分内容网上很多资料，此处略过，可以参考[wikipedia_大O符号](http://en.wikipedia.org/wiki/Big_O_notation)

算法导论介绍到，对于三个符号可以做如下理解：$O$ = $\le$，$\Omega$ = $\ge$， $\Theta$ = $=$

运行时间的三种特殊的情况：最优情况，最差情况，平均情况

几种常见的运行时间以及算法实例 [wiki中的时间复杂度](http://zh.wikipedia.org/zh-cn/时间复杂度)

![image](http://hujiaweibujidao.github.io/images/algos/complexity.png)

#### 3.算法性能评估的经验

(1)Tip 1: If possible, don’t worry about it.

如果可以那就暴力求解吧

(2)Tip 2: For timing things, use timeit.

使用`timeit`模块对运行时间进行分析，在前面的[数据结构篇中第三部分数据结构](http://hujiaweibujidao.github.io/blog/2014/05/08/python-algorithms-datastructures/)的list中已经介绍过了timeit模块，在使用的时候需要注意前面的运行不会影响后面的重复的运行(例如，测试排序算法运行时间，如果将前面已经排好序的序列传递给后面的重复运行是不可以的)

```python
#timeit模块简单使用实例
timeit.timeit("x = sum(range(10))")
```

(3)Tip 3: To find bottlenecks, use a profiler.

使用`cProfile`模块来获取更多的关于运行情况的内容，从而可以发现问题的瓶颈，如果系统没有`cProfile`模块，可以使用`profile`模块代替，更多内容可以查看[Python standard library-Python Profilers](https://docs.python.org/2/library/profile.html)

```python
#cProfile模块简单使用实例
import cProfile
import re
cProfile.run('re.compile("foo|bar")')

#运行结果：

         194 function calls (189 primitive calls) in 0.000 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 re.py:188(compile)
        1    0.000    0.000    0.000    0.000 re.py:226(_compile)
        1    0.000    0.000    0.000    0.000 sre_compile.py:178(_compile_charset)
        1    0.000    0.000    0.000    0.000 sre_compile.py:207(_optimize_charset)
        4    0.000    0.000    0.000    0.000 sre_compile.py:24(_identityfunction)
      3/1    0.000    0.000    0.000    0.000 sre_compile.py:32(_compile)
        1    0.000    0.000    0.000    0.000 sre_compile.py:359(_compile_info)
        2    0.000    0.000    0.000    0.000 sre_compile.py:472(isstring)
        1    0.000    0.000    0.000    0.000 sre_compile.py:478(_code)
        1    0.000    0.000    0.000    0.000 sre_compile.py:493(compile)
        5    0.000    0.000    0.000    0.000 sre_parse.py:126(__len__)
       12    0.000    0.000    0.000    0.000 sre_parse.py:130(__getitem__)
        7    0.000    0.000    0.000    0.000 sre_parse.py:138(append)
      3/1    0.000    0.000    0.000    0.000 sre_parse.py:140(getwidth)
        1    0.000    0.000    0.000    0.000 sre_parse.py:178(__init__)
       10    0.000    0.000    0.000    0.000 sre_parse.py:182(__next)
        2    0.000    0.000    0.000    0.000 sre_parse.py:195(match)
        8    0.000    0.000    0.000    0.000 sre_parse.py:201(get)
        1    0.000    0.000    0.000    0.000 sre_parse.py:301(_parse_sub)
        2    0.000    0.000    0.000    0.000 sre_parse.py:379(_parse)
        1    0.000    0.000    0.000    0.000 sre_parse.py:67(__init__)
        1    0.000    0.000    0.000    0.000 sre_parse.py:675(parse)
        3    0.000    0.000    0.000    0.000 sre_parse.py:90(__init__)
        1    0.000    0.000    0.000    0.000 {_sre.compile}
       15    0.000    0.000    0.000    0.000 {isinstance}
    38/37    0.000    0.000    0.000    0.000 {len}
        2    0.000    0.000    0.000    0.000 {max}
       48    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
        8    0.000    0.000    0.000    0.000 {min}
        6    0.000    0.000    0.000    0.000 {ord}
```

(4)Tip 4: Plot your results.

画出算法性能结果图，如下图所示，可以使用的模块有`matplotlib`

![image](http://hujiaweibujidao.github.io/images/algos/plotresult.png)

(5)Tip 5: Be careful when drawing conclusions based on timing comparisons.

在对基于运行时间的比较而要下结论时需要小心

First, any differences you observe may be because of random variations.

首先，你观察到的差异可能是由于输入中的随机变化而引起的

Second, there are issues when comparing averages. 

其次，比较算法的平均情况下的运行时间是存在问题的[这个我未理解，以下是作者的解释]

At the very least, you should stick to comparing averages of actual timings. A common practice to get more meaningful numbers when performing timing experiments is to normalize the running time of each program, dividing it by the running time of some standard, simple algorithm. This can indeed be useful but can in some cases make your results less than meaningful. See the paper “How not to lie with statistics: The correct way to summarize benchmark results” by Fleming and Wallace for a few pointers. For some other perspectives, you could read Bast and Weber’s “Don’t compare averages,” or the more recent paper by Citron et al., “The harmonic or geometric mean: does it really matter?”

Third, your conclusions may not generalize. 

最后，你下的结论不要太过于宽泛

(6)Tip 6: Be careful when drawing conclusions about asymptotics from experiments.

在对从实验中得到关于渐近时间的信息下结论时需要小心，实验只是对于理论的一个支撑，可以通过实验来推翻一个渐近时间结果的假设，但是反过来一般不行 [以下是作者的解释]

If you want to say something conclusively about the asymptotic behavior of an algorithm, you need to analyze it, as described earlier in this chapter. Experiments can give you hints, but they are by their nature finite, and asymptotics deal with what happens for arbitrarily large data sizes. On the other hand, unless you’re working in theoretical computer science, the purpose of asymptotic analysis is to say something about the behavior of the algorithm when implemented and run on actual problem instances, meaning that experiments should be relevant.

4.在Python中实现树和图

> **[Black Box: dict和set]**   
Python中很多地方都使用了hash策略，在前面的[Python数据结构篇中的搜索部分](http://hujiaweibujidao.github.io/blog/2014/05/07/python-algorithms-search/)已经介绍了hash的内容。Python提供了`hash`函数，例如`hash("Hello, world!")`得到`-943387004357456228` (结果不一定相同)。      
Python中的dict和set都使用了hash机制，所以平均情况下它们获取元素都是常数时间的。

(1)图的表示：最常用的两种表示方式是邻接表和邻接矩阵 [假设要表示的图如下]

![image](http://hujiaweibujidao.github.io/images/algos/graphrep.png)

邻接表 Adjacency Lists：因为历史原因，邻接表都是指链表list，但实际上也可以是其他的，例如在python中也可以是set或者dict，不同的表示方式有各自的优缺点，它们判断节点的连接关系和节点的度的方式甚至两个操作的性能都不太一样。

① adjacency lists 表示形式

```python
# A Straightforward Adjacency Set Representation
a, b, c, d, e, f, g, h = range(8)
N = [
    [b, c, d, e, f],    # a
    [c, e],             # b
    [d],                # c
    [e],                # d
    [f],                # e
    [c, g, h],          # f
    [f, h],             # g
    [f, g]              # h
]

b in N[a] # Neighborhood membership -> True
len(N[f]) # Degree -> 3
```

② adjacency sets 表示形式

```python
# A Straightforward Adjacency Set Representation
a, b, c, d, e, f, g, h = range(8)
N = [
    {b, c, d, e, f},    # a
    {c, e},             # b
    {d},                # c
    {e},                # d
    {f},                # e
    {c, g, h},          # f
    {f, h},             # g
    {f, g}              # h
]

b in N[a] # Neighborhood membership -> True
len(N[f]) # Degree -> 3
```

基本上和adjacency lists表示形式一样对吧？但是，
