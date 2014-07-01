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

the notion of running time complexity (as described in the next section) is based on knowing how big a problem instance is, and that size is simply the amount of memory needed to encode it.   [算法的运行时间是基于问题的大小，这个大小是指问题的输入占用的内存空间大小]

#### 2.算法渐近运行时间

主要介绍了大O符号、大$\Omega$符号以及大$\Theta$符号，这部分内容网上很多资料，此处略过，可以参考[wikipedia_大O符号](http://en.wikipedia.org/wiki/Big_O_notation)

算法导论介绍到，对于三个符号可以做如下理解：$O$ = $\le$，$\Omega$ = $\ge$， $\Theta$ = $=$

运行时间的三种特殊的情况：最优情况，最差情况，平均情况

几种常见的运行时间以及算法实例 [wiki中的时间复杂度](http://zh.wikipedia.org/zh-cn/时间复杂度)

![image](http://hujiaweibujidao.github.io/images/algos/complexity.png)

#### 3.算法性能评估的经验

(1)

