---
layout: page
title: "python"
date: 2014-05-18 19:45
comments: true
sharing: true
footer: true
---

![image](http://hujiaweibujidao.github.io/images/python-logo.png)

的确，正如偶像Bruce Eckel所说，"Life is short, you need Python"！

如果你正在考虑学Java还是Python的话，那就别想了，选Python吧，你的人生会有更多的时间做其他有意思的事情。

研究生之前我没学python是有原因的：首先，我怕蛇，很怕很怕，而这货的logo竟然就是蛇，我因故而避之；其次，我不喜欢脚本语言，我会shell，但是写的时候不是很爽，只是在处理些文件操作或者字符串操作的时候才会想起它，听说python脚本神马的，我便又避之。

但是，上了研究生发现用Python的人很多，而且这货简直被神化了，无所不能，吊炸天的Edx的后台竟然就是用的Python，于是花了一个下午刷了本《Head First Python》，感觉没啥特别，只是写起来轻便，甚至还能开发Android，让我大吃一惊。后来，又接着看了些Python书，发现真的如此，很多时候用Java写了几十行的代码用Python几行就搞定了，而且它同样拥有大量的第三方模块，于是我就这么走进了Python的世界。Python要入门很简单，毕竟我搞Java这么多年了，这俩太多的相似点了，入门之后写写数据结构，写写算法，熟悉一些高级特性，使用一些第三方模块之后差不多就入门了，现在，做任何事情，我首先想到的是用Python如何实现?！嘿嘿，"Life is short, go start Python"！

本人才疏学浅，学识大多浅尝辄止，故文章若有错误，不论是文字笔误还是理解有错，烦请您留言以告知，本人必定感激不尽！

Python分类下的系列文章，不断更新中

1.Python基础知识篇

[Python Basics](http://hujiaweibujidao.github.io/blog/2014/05/10/python-tips1/) 和 [Python Advances](http://hujiaweibujidao.github.io/blog/2014/05/16/python-tips2/)

前者是Python基础的简单总结，后者实际上是罗列了些关于Python高级特性的好文章

2.Python数据结构篇

数据结构篇主要是阅读[Problem Solving with Python](http://interactivepython.org/courselib/static/pythonds/index.html)时写下的阅读记录，当然，也结合了部分[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)中的内容，此外还有不少wikipedia上的内容，所以内容比较多，也有点杂乱，主要是介绍了如何使用Python实现常用的一些数据结构，例如堆栈、队列、二叉树等等，也有Python内置的数据结构性能的分析，同时还包括了搜索和排序(在算法设计篇中会有更加详细的介绍)的简单总结。每篇文章都有实现代码，内容都比较多，简单算法一般是大致介绍下思想及算法流程，复杂的算法会给出各种图示和代码实现详细介绍。

(1)[搜索](http://hujiaweibujidao.github.io/blog/2014/05/07/python-algorithms-search/) 简述顺序查找和二分查找，详述Hash查找(hash函数的设计以及如何避免冲突)

(2)[排序](http://hujiaweibujidao.github.io/blog/2014/05/07/python-algorithms-sort/)  简述各种排序算法的思想以及它的图示和实现

(3)[数据结构](http://hujiaweibujidao.github.io/blog/2014/05/08/python-algorithms-datastructures/)  简述Python内置数据结构的性能分析和实现常用的数据结构：栈、队列和二叉堆

(4)[树总结](http://hujiaweibujidao.github.io/blog/2014/05/08/python-algorithms-Trees/)  简述二叉树，详述二叉搜索树和AVL树的思想和实现

3.Python算法设计篇

**近期将会有重要变化，可以暂时不阅读该系列文章，待更新完毕再读应该会好些。**

算法设计篇主要是阅读[Python Algorithms: Mastering Basic Algorithms in the Python Language](http://link.springer.com/book/10.1007%2F978-1-4302-3238-4)之后写下的读书总结，原书大部分内容结合了经典书籍[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)，内容更加细致深入，主要是介绍了各种常用的算法设计思想，以及如何使用Python高效巧妙地实现这些算法，这里有别于前面的数据结构篇，部分算法例如排序就不会详细介绍它的实现细节，而是侧重于它内在的算法思想。这里中使用了一些与数据结构有关的第三方模块，因为这篇的重点是算法的思想以及实现，所以并没有去重新实现每个数据结构，但是在介绍算法的同时会分析Python内置数据结构以及第三方数据结构模块的优缺点，也就意味着该篇比前面都要难不少，除此之外，里面还有很多关于python开发的内容，精彩不容错过！

这里每篇文章都有实现代码，内容都比较多，但是并没有包括原书对应章节的所有内容，因为内容实在太多了，所以我只是选择经典的算法实例来介绍算法核心思想。本篇的顺序按照原书[Python Algorithms: Mastering Basic Algorithms in the Python Language](http://link.springer.com/book/10.1007%2F978-1-4302-3238-4)的章节来安排的(章节标题部分相同部分不同哟)，为了节省时间以及保持原著的原滋原味，部分内容直接摘自原著英文内容。 [友情提示：重点内容从第4节开始哟]

(1)[Python Algorithms - C1 Introduction](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-introduction/) 

本节主要是对书籍中的内容做些简单介绍，从旅行商问题开始引入介绍了算法的重要性。

(2)[Python Algorithms - C2 The basics](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-the-basics/) 

本节主要介绍了三个内容：算法渐近运行时间的表示方法、六条算法性能评估的经验以及Python中树和图的实现方式。

(3)[Python Algorithms - C3 Counting 101](http://hujiaweibujidao.github.io//blog/2014/07/01/python-algorithms-counting-101/) 

原书主要介绍了一些基础数学，例如排列组合以及递归循环等，但是本节只重点介绍计算算法的运行时间的三种方法

(4)[Python Algorithms - C4 Induction and Recursion and Reduction](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-induction/) 

本节主要介绍算法设计的三个核心知识：Induction(推导)、Recursion(递归)和Reduction(规约)，这是原书的重点和难点部分

(5)[Python Algorithms - C5 Traversal](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-traversal/) [还未完成]

(6)[Python Algorithms - C6 Divide and Combine and Conquer](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-divide-and-combine-and-conquer/) [还未完成]

(7)[Python Algorithms - C7 Greedy](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-greedy/) [还未完成]

(8)[Python Algorithms - C8 Dynamic Programming](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-dynamic-programming/) 

本节主要结合一些经典的动规问题介绍动态规划的备忘录法和迭代法这两种实现方式，并对这两种方式进行对比

(9)[Python Algorithms - C9 Graphs](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-graphs/) [还未完成]























