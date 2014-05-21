---
layout: post
title: "LAS 3-EigenVectors and Eigenvalues"
date: 2014-04-29 14:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/4/27</center>**

### <center>特征值和特征向量</center>

好，我们知道了矩阵就是线性变换，那么矩阵的特征值和特征向量是什么？

[wiki](http://zh.wikipedia.org/wiki/%E7%89%B9%E5%BE%81%E5%90%91%E9%87%8F)**在线性代数中，对于一个给定的线性变换，它的特征向量（本征向量或称正规正交向量）v经过这个线性变换之后，得到的新向量仍然与原来的v 保持在同一条直线上，但其长度也许会改变。一个特征向量的长度在该线性变换下缩放的比例称为其特征值（本征值）。如果特征值为正，则表示v 在经过线性变换的作用后方向也不变；如果特征值为负，说明方向会反转；如果特征值为0，则是表示缩回零点。但无论怎样，仍在同一条直线上。**

简而言之就是说，**对于一个确定的矩阵，如果它的特征向量存在，那么就有下面的现象，当这个矩阵(即这个线性变换)作用在这些特征向量中的任意一个上的时候，得到的向量和原来的特征向量在同一条直线上，只是长度发生了变化，长度的变化量的比例为该特征向量对应的特征值。从这里可以看出，这些特征向量是对这个矩阵的很好的描述！**

用《蒙娜丽莎》来理解下：

![image](http://hujiaweibujidao.github.io/images/math/monalisa.png)

根据wiki上对特征向量的定义，首先要明确的是**这个线性变换(也就是这个矩阵)是向量空间E到自身的一个线性变换，它可以是旋转、反射、拉伸、压缩或者这些变换的组合等等，本来呢，一个向量经过线性变换可以得到任何向量，但是，如果这个向量是这个线性变换的特征向量的话，经过线性变换得到的向量那就一定是和特征向量在同一条直线上！特征向量可能会有多个，特征值最大的特征向量称为主特征。所有具有相同的特征值$\lambda$的特征向量和零向量一起，组成了一个向量空间，称为线性变换的一个特征空间。** [TODO：特征空间我还不太理解]

![image](http://hujiaweibujidao.github.io/images/math/eigenvectors.png)

在一定条件下（如其矩阵形式为实对称矩阵的线性变换），一个变换可以由其特征值和特征向量完全表述。**一个特征空间是具有相同特征值的特征向量与一个同维数的零向量的集合**，可以证明该集合是一个线性子空间。

一般来说，2×2的非奇异矩阵如果有两个相异的特征值，就有两个线性无关的特征向量。**在这种情况下，对于特征向量，线性变换仅仅改变它们的长度，而不改变它们的方向（除了反转以外），而对于其它向量，长度和方向都可能被矩阵所改变。**如果特征值的模大于1，特征向量的长度将被拉伸，而如果特征值的模小于1，特征向量的长度就将被压缩。如果特征值小于0，特征向量将会被翻转。

重复了这么多次，我想你也已经认可了什么是特征向量了，下面看看例子。

先看个恒等变换和对角矩阵，注意其中对特征向量和特征空间的分析。
![image](http://hujiaweibujidao.github.io/images/math/eigenvectors1.png)

再看个实际的例子，错切变换，这里利用了矩阵行列式的知识来求解特征值。

![image](http://hujiaweibujidao.github.io/images/math/eigenvectors2.png)
![image](http://hujiaweibujidao.github.io/images/math/eigenvectors3.png)

特征值的代数重数和几何重数(后者我没有看懂，若读者明白，请留言告知，谢谢！)

![image](http://hujiaweibujidao.github.io/images/math/eigenvectors4.png)

特征值的计算，简单的矩阵可以使用解特征多项式的方法，但是一般情况下都是采用数值计算的方法，其中基于迭代技术的幂法可以用来计算矩阵的主特征值，反幂法类似，不过计算的是模最小的特征值，实际中常用的是QR分解。
![image](http://hujiaweibujidao.github.io/images/math/eigenvectors5.png)

到此，我觉得特征向量应该是清晰了，关于特征值和奇异值分解以及代码实现请参考我写的另一份总结[Numerical Methods Using Matlab 第三章 矩阵特征值和奇异值分解](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)。

矩阵特征值的应用特别广，例如因子分析，特征脸，[PageRank](http://hujiaweibujidao.github.io/blog/2014/05/12/algorithms-pagerank/)等等算法都是基于特征值分解，若有时间和精力，我后续会一一介绍(有链接的是已经完成的部分)。

还想看看其他的介绍？

这篇文章介绍的不错[What are eigenvectors and eigenvalues?](http://www.visiondummy.com/2014/03/eigenvalues-eigenvectors/)