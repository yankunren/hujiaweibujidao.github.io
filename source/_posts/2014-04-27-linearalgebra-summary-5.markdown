---
layout: post
title: "LAS 5-Orthogonal Matrix"
date: 2014-04-29 15:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/4/27</center>**

### <center>正交矩阵</center>

1.正交矩阵

什么是正交？

两个向量的内积如果是零，那么就说这两个向量是正交的，在三维空间中，正交的两个向量相互垂直。如果相互正交的向量长度均为 1，那么他们又叫做标准正交基。

那什么是正交矩阵呢？

[正交矩阵 on wiki](http://zh.wikipedia.org/wiki/%E6%AD%A3%E4%BA%A4%E7%9F%A9%E9%98%B5)的介绍是：在矩阵论中，实数正交矩阵是方块矩阵Q，它的转置矩阵是它的逆矩阵：$Q^T Q = Q Q^T = I . \,\!$

注意上面提到的`实数`二字，正交矩阵中的元素都是实数，包含复数并且同样满足正交性质的矩阵是酉矩阵，也就是推广到复数域之后的“正交矩阵”。

简单地理解就是指列向量相互正交的矩阵，但是还需要满足列向量是正交规范化的。

**实数方块矩阵是正交的，当且仅当它的列形成了带有普通欧几里得点积的欧几里得空间$R^{n}$的**正交规范基**，它为真当且仅当它的行形成$R^{n}$的正交基。假设带有正交（非正交规范）列的矩阵M叫正交矩阵可能是诱人的，但是这种矩阵没有特殊价值而没有特殊名字；它们只是$M^{T}M$ = D，D是对角矩阵。**

**正交矩阵最重要的性质之一是它的变换可以保证一个向量的长度不变，包括 Euclidean lenght ，matrix norm 和 Frobenius norm。**[最后一个是矩阵的F范数]

下面考虑一个向量v，v的长度的平方是$v^{T}v$。如果作用在向量v上的线性变换Q保持了向量长度，即

$${ v}^T{ v} = (Q{ v})^T(Q{ v}) = { v}^T Q^T Q { v}$$

能够做到保持向量长度不变的线性变换也就是旋转、反射和它们的组合，所以**旋转、反射和它们的组合都产生正交矩阵。反过来，正交矩阵也蕴涵了正交变换(旋转变换或者反射变换)。**但是，**线性代数包括了在既不是有限维的也不是同样维度的空间之间的正交变换，它们没有等价的正交矩阵。**

一些小正交矩阵的例子和可能的解释。[来源自wiki](http://zh.wikipedia.org/wiki/%E6%AD%A3%E4%BA%A4%E7%9F%A9%E9%98%B5#.E4.BE.8B.E5.AD.90)

$\begin{bmatrix}
1 & 0 \\
0 & 1 \\
\end{bmatrix}$ 恒等变换。$\begin{bmatrix}
0.96 & -0.28 \\
0.28 & \;\;\,0.96 \\
\end{bmatrix}$ 旋转16.26°。

$\begin{bmatrix}
1 & 0 \\
0 & -1 \\
\end{bmatrix}$ 针对x轴反射。$\begin{bmatrix}
0 & 0 & 0 & 1 \\
0 & 0 & 1 & 0 \\
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0
\end{bmatrix}$ 置换坐标轴。

低维度下的正交阵。

![image](http://hujiaweibujidao.github.io/images/math/zhengjiao1.png)

对一个二维向量v，让它旋转$\theta$角度其实也可以看做是让它以$\frac{1}{2}\theta$角度进行反射，下面是二维情况下的旋转和反射矩阵：

$\begin{bmatrix}
\cos \theta & -\sin \theta \\
\sin \theta & \cos \theta \\
\end{bmatrix}$旋转  $\begin{bmatrix}
\cos \theta & \sin \theta \\
\sin \theta & -\cos \theta \\
\end{bmatrix}$ 反射

还有一个有意思的就是**反射矩阵、反射矩阵的逆矩阵以及它的转置矩阵三者相同！**

高维度下的正交矩阵比较复杂，但是可以通过基本模块例如置换、反射和旋转来构建高维的正交矩阵，例如下面要介绍的Householder变换和Givens旋转。

(置换矩阵就是单位矩阵的某些行和列交换后得到的矩阵)

![image](http://hujiaweibujidao.github.io/images/math/zhengjiao2.png)

2.Givens旋转




3.Householder变换



