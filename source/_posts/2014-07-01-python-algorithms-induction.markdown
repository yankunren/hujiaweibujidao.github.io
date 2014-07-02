---
layout: post
title: "Python Algorithms - C4 Induction and Recursion and Reduction"
date: 2014-07-01 10:40
comments: true
categories: algorithm
published: true
---

**<center>Python算法设计篇(4)</center>**
**<center>逸夫图书馆, 2014/7/1</center>**

### <center>Chapter 4: Induction and Recursion and Reduction</center>

> You must never think of the whole street at once, understand? You must only concentrate on the next step, the next breath, the next stroke of the broom, and the next, and the next. Nothing else.
  ——Beppo Roadsweeper, in Momo by Michael Ende

**注：本节中我给定下面三个重要词汇的中文翻译分别是是：Induction(推导)、Recursion(递归)和Reduction(规约)**

本节主要介绍算法设计的三个核心知识：Induction(推导)、Recursion(递归)和Reduction(规约)，这是原书的重点和难点部分

正如标题所示，本节主要介绍下面的三部分内容：

• Reduction means transforming one problem to another. We normally reduce an unknown problem to one we know how to solve. The reduction may involve transforming both the input (so it works with the new problem) and the output (so it’s valid for the original problem).

Reduction(规约)意味着对问题进行转换，例如将一个未知的问题转换成我们能够解决的问题，转换的过程可能涉及到对问题的输入输出的转换。[问题规约在证明一个问题是否是NP完全问题时经常用到，如果我们能够将一个问题规约成一个我们已知的NP完全问题的话，那么这个问题就业是NP完全问题]

• Induction (or, mathematical induction) is used to show that a statement is true for a large class of objects (often the natural numbers). We do this by first showing it to be true for a base case (such as the number 1) and then showing that it “carries over” from one object to the next (if it’s true for n –1, then it’s true for n).

Induction(推导)是一个数学意义上的推导，类似数学归纳法，主要是用来证明某个命题是正确的。首先我们证明对于基础情况(例如数字1)是正确的，然后证明该命题会传递下去都是正确的(假设当n-1时是正确的，然后证明当n时也是正确的即可)

• Recursion is what happens when a function calls itself. Here we need to make sure the function works correctly for a (nonrecursive) base case and that it combines results from the recursive calls into a valid solution.

Recursion(递归)经常发生于一个函数调用自身的情况。递归函数说起来简单，但是实现不太容易，我们要确保对于基础情况(不递归的情况)能够正常工作，此外，对于递归情况需要将递归调用的结果组合起来得到一个有效的结果。


