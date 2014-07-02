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

下面给幅图你就能够明白了，实际上很多时候我们解决一个问题都是找一个我们已知的能够解决的问题B，然后将这个我们不会的新问题A规约到这个已知的问题B，然后中间经过一些输入输出的转换，我们就能够解决新问题A了。

![image](http://hujiaweibujidao.github.io/images/algos/reduction1.png)

• Induction (or, mathematical induction) is used to show that a statement is true for a large class of objects (often the natural numbers). We do this by first showing it to be true for a base case (such as the number 1) and then showing that it “carries over” from one object to the next (if it’s true for n –1, then it’s true for n).

Induction(推导)是一个数学意义上的推导，类似数学归纳法，主要是用来证明某个命题是正确的。首先我们证明对于基础情况(例如数字1)是正确的，然后证明该命题会传递下去都是正确的(假设当n-1时是正确的，然后证明当n时也是正确的即可)

• Recursion is what happens when a function calls itself. Here we need to make sure the function works correctly for a (nonrecursive) base case and that it combines results from the recursive calls into a valid solution.

Recursion(递归)经常发生于一个函数调用自身的情况。递归函数说起来简单，但是实现不太容易，我们要确保对于基础情况(不递归的情况)能够正常工作，此外，对于递归情况需要将递归调用的结果组合起来得到一个有效的结果。

它们有很多相似点，比如它们都专注于得到目标解的某一步，我们只需要仔细思考这一步，剩下的就能够自动完成了。如果我们更加仔细地去理解它们，我们会发现，**Induction(推导)和Recursion(递归)其实彼此相互对应，也就是说一个Induction能够写出一个相应的Recursion，而一个Recursion也正好对应着一个Induction，也可以换个方式理解，Induction是从n-1到n的推导，而Recursion是从n到n-1的递归。此外，它们其实都是某种Reduction，即Induction和Recursion的本质就是对问题进行规约！为了能够对问题使用Induction或者说Recursion，Reduction一般是将一个问题变成另一个只是规模减小了的相同问题。**

你也许会觉得奇怪，不对啊，刚才不是说Reduction是将一个问题规约成另一个问题吗？现在怎么又说成是将一个问题变成另一个只是规模减小了的相同问题了？其实，Reduction是有两种的，上面的两种都是Reduction！还记得前面的递归树吗？那其实就是将规模较大的问题转换成几个规模较小的问题，而且问题的形式并没有改变。你可以理解这种情况下Reduction是降维的含义，类似机器学习中的Dimension Reduction，对高维数据进行降维了，问题保持不变。

These are two major variations of reductions: reducing to a different problem and reducing to a shrunken version of the same. 

下面再看幅图理解Induction和Recursion之间的关系

![image](http://hujiaweibujidao.github.io/images/algos/Inductionrecursion.png)

[关于它们三个的关系的原文阐述：Induction and recursion are, in a sense, mirror images of one another, and both can be seen as examples of reduction. To use induction (or recursion), the reduction must (generally) be between instances of the same problem of different sizes. ]

[看了原书你会觉得，作者介绍算法的方式很特别，作者有提到他的灵感来自哪里：In fact, much of the material was inspired by Udi Manber’s wonderful paper `“Using induction to design algorithms”` from 1988 and his book from the following year, `Introduction to Algorithms: A Creative Approach`.]

也许你还感觉很晕，慢慢地看了后面的例子你就明白了。在介绍例子之前呢，先看下递归和迭代的异同，这个很重要，在后面介绍动态规划算法时我们还会反复提到它们的异同。

有了Induction和Recursion，我们很容易就可以将一个inductive idea采用递归Recursion的方式实现，根据我们的编程经验，任何一个递归方式的实现都可以改成非递归方式(即迭代方式)实现，而且后者要好些，为什么呢？


