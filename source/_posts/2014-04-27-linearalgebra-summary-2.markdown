---
layout: post
title: "Linear Algebra Summary 2"
date: 2014-04-29 14:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/4/27</center>**

### <center>矩阵</center>

1.什么是矩阵？

这个问题很多人进行过探讨，在网上也比较火，比如[孟岩的三篇《理解矩阵》](http://blog.csdn.net/myan/article/details/647511)，知乎上[如何直观理解矩阵和线代](http://www.zhihu.com/question/21082351)，还有其他人对矩阵的理解，例如[新理解矩阵1](http://spaces.ac.cn/index.php/archives/1765/)和[新理解矩阵2](http://spaces.ac.cn/index.php/archives/1768/)等等。

那，到底什么是矩阵呢？

**总结起来，我觉得，矩阵就是线性变换，作用在一个点上就是将这个点移动到该空间的另一个点，作用在向量上就是对这个向量进行放缩或者旋转或者反射等一系列的线性变换，作用在矩阵上那就是对矩阵中的每一个列向量进行线性变换之后然后进行叠加结果(这就是为什么矩阵的乘法有些奇妙的原因)。因为运动是相对的，你可以理解为坐标系没有变，被作用对象发生了变化，也可以理解为被作用对象没有变，变的是坐标系(也就是空间的基)。**

> 这里借用下小苏的图和解释。
矩阵$A=\left[ \begin{array}{cc} a11 & a12 \\ a21 & a22 \end{array} \right]$
事实上是由两个向量$[a11,a21]^T$和$[a12,a22]^T$（这里的向量都是列向量）组成，它描述了一个平面（仿射）坐标系。换句话说，这两个向量其实是这个坐标系的两个基，而运算$y=Ax$则是告诉我们，在$A$这个坐标系下的$x$向量，在$I$坐标系下是怎样的。这里的$I$坐标系就是我们最常用的直角坐标系，也就是说，任何向量（包括矩阵里边的向量），只要它前面没有矩阵作用于它，那么它都是在直角坐标系下度量出来的。下图所用的
矩阵$A=\left[ \begin{array}{cc} 3 & 2 \\ 1 & 3 \end{array} \right]$
这构成了一个仿射坐标系，在这个坐标系下，有一个向量$x=[2,2]^T$，它在直角坐标系下测得的坐标为$[10,8]^T$，现在我们不难发现，直接用矩阵乘法来计算，有
$Ax=[3∗2+2∗2,1∗2+3∗2]^T=[10,8]^T$
小苏对此展开讨论了[它和矩阵乘法之间的联系](http://spaces.ac.cn/index.php/archives/1768/)

![image](http://hujiaweibujidao.github.io/images/math/xianxinbianhua.png)

[wiki](http://zh.wikipedia.org/wiki/%E7%9F%A9%E9%98%B5)上关于矩阵和线性变换关系的解释，其中提到了从n维空间到m维空间的任何线性变换都对应于一个矩阵，其中也提到了相似矩阵其实是相同的线性变换在不同的坐标基下的不同表示而已。

![image](http://hujiaweibujidao.github.io/images/math/xianxingbianhuan.png)

2.线性变换

好吧，那什么是线性变换呢？

wiki中对线性变换的解释，这些变换其实主要包括缩放、旋转、反射等。

![image](http://hujiaweibujidao.github.io/images/math/xianxinbianhua2.png)

(1)反射变换

$
A=\left[ \begin{array}{cc} -1 & 0 \\ 0 & 1 \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{cc} x'=-x \\y'=y \end{array} \right.
$

水平反射，x变成对应的相反数，y不变。

什么是反射？[wiki](http://zh.wikipedia.org/wiki/%E5%8F%8D%E5%B0%84_(%E6%95%B0%E5%AD%A6))上的解释是：**反射是把一个物体变换成它的镜像的映射。要反射一个平面图形，需要“镜子”是一条直线（反射轴），对于三维空间中的反射就要使用平面作为镜子。**

**最常用的反射变换就是[Householder变换](http://zh.wikipedia.org/wiki/%E8%B1%AA%E6%96%AF%E9%9C%8D%E5%B0%94%E5%BE%B7%E5%8F%98%E6%8D%A2)了，这一变换将一个向量变换为由一个超平面反射的镜像，是一种线性变换。豪斯霍尔德变换可以将向量的某些元素置零，同时保持该向量的范数不变。Householder变换在矩阵的QR分解中非常重要！**关于Householder的内部原理以及代码实现请参考我写的另一份总结[《Numerical Methods Using Matlab》](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)第三章 矩阵特征值和奇异值分解

下图为Householder变换的图示：
![image](http://hujiaweibujidao.github.io/images/math/HouseholderReflection.png)

(2)放缩变换

$
A=\left[ \begin{array}{cc} \frac{3}{2} & 0 \\ 0 & \frac{3}{2} \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{c} x'=\frac{3}{2}x \\ y'=\frac{3}{2}y \end{array} \right.
$

放缩反射，x和y都变成原来的$\frac{3}{2}$倍。

(3)旋转变换

$
A=\left[ \begin{array}{cc} \cos(\frac{\pi}{6}) & -\sin(\frac{\pi}{6}) \\ \sin(\frac{\pi}{6}) & \cos(\frac{\pi}{6}) \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{c} x'=\frac{\sqrt{3}}{2}x-\frac{1}{2}y \\ y'=\frac{1}{2}x+\frac{\sqrt{3}}{2}y \end{array} \right.
$

旋转反射，[一般性的证明请看这张图](http://hujiaweibujidao.github.io/images/math/xuanzhuanbianhuan1.png)，[wiki](http://zh.wikipedia.org/wiki/%E6%97%8B%E8%BD%AC)中对二维空间旋转的解释。

![image](http://hujiaweibujidao.github.io/images/math/xuanzhuanbianhuan2.png)

**旋转矩阵是在乘以一个向量的时候有改变向量的方向但不改变大小的效果的矩阵。旋转矩阵不包括点反演，它可以把右手坐标系改变成左手坐标系或反之。所有旋转加上反演形成了正交矩阵的集合。旋转可分为主动旋转与被动旋转。主动旋转是指将向量逆时针围绕旋转轴所做出的旋转。被动旋转是对坐标轴本身进行的逆时针旋转，它相当于主动旋转的逆操作。**

旋转矩阵的性质：
**一个矩阵是旋转矩阵，当且仅当它是正交矩阵并且它的行列式是单位一。正交矩阵的行列式是 ±1；如果行列式是 −1，则它包含了一个反射而不是真旋转矩阵。**


**旋转矩阵是正交矩阵，如果它的列向量形成 ${R}^{n}$ 的一个正交基，就是说在任何两个列向量之间的标量积是零(正交性)而每个列向量的大小是单位一(单位向量)。**

![image](http://hujiaweibujidao.github.io/images/math/xuanzhuanjuzhen.png)

旋转矩阵中有一类非常实用的，那就是[Givens旋转](http://zh.wikipedia.org/wiki/%E5%90%89%E6%96%87%E6%96%AF%E6%97%8B%E8%BD%AC)。**Givens 旋转在数值线性代数中主要的用途是在向量或矩阵中介入零。例如，这种效果可用于计算矩阵的 QR分解。超过Householder变换的一个好处是它们可以轻易的并行化，另一个好处是对于非常稀疏的矩阵计算量更小。**

Given旋转矩阵的表达：

![image](http://hujiaweibujidao.github.io/images/math/givens.png)

Given旋转矩阵的稳定计算：

![image](http://hujiaweibujidao.github.io/images/math/givens2.png)

3.逆矩阵和伴随矩阵

理解了矩阵就是线性变换之后，那么就很容易明白逆矩阵就是将被作用对象从变换后的位置变换回来！

那，伴随矩阵又是什么呢？

[wiki](http://zh.wikipedia.org/wiki/%E4%BC%B4%E9%9A%8F%E7%9F%A9%E9%98%B5)在线性代数中，一个方形矩阵的伴随矩阵$A^{*}$是一个类似于逆矩阵$A^{-1}$的概念。如果矩阵可逆，那么它的逆矩阵和它的伴随矩阵之间只差一个系数($A^{-1}=\frac{A^{*}}{det(A)}$)。也就是说，**伴随矩阵其实是变换回来之后还进行了一次放缩，放缩的大小与矩阵的行列式值有关**。

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen.png)

举例说明伴随矩阵的计算，伴随矩阵其实就是原矩阵的代数余子式矩阵的转置！

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen2.png)

伴随矩阵的性质

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen3.png)

还需要注意的是，**逆矩阵是对于方阵来说的，只有方阵还有逆矩阵的概念，那要不是方阵呢？那么就是广义的逆矩阵**！广义逆矩阵在最小二乘法中有重要的应用。关于逆矩阵的求解以及代码实现请参考我写的另一份总结[《Numerical Methods Using Matlab》](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)第一章 线性方程组求解，最小二乘问题请参考第四章 曲线拟合和多项式插值。

矩阵的一个重要用途是解线性方程组。线性方程组中未知量的系数可以排成一个矩阵，加上常数项，则称为增广矩阵。另一个重要用途是表示线性变换，即是诸如f(x)  = 4x之类的线性函数的推广。设定基底后，某个向量v可以表示为m×1的矩阵,而线性变换f可以表示为行数为m的矩阵A，使得经过变换后得到的向量f(v)可以表示成Av的形式。矩阵的特征值和特征向量可以揭示线性变换的深层特性。


**旋转矩阵是正交矩阵，如果它的列向量形成 ${R}^{n}$ 的一个正交基，就是说在任何两个列向量之间的标量积是零(正交性)而每个列向量的大小是单位一(单位向量)。**

![image](http://hujiaweibujidao.github.io/images/math/xuanzhuanjuzhen.png)

旋转矩阵中有一类非常实用的，那就是[Givens旋转](http://zh.wikipedia.org/wiki/%E5%90%89%E6%96%87%E6%96%AF%E6%97%8B%E8%BD%AC)。**Givens 旋转在数值线性代数中主要的用途是在向量或矩阵中介入零。例如，这种效果可用于计算矩阵的 QR分解。超过Householder变换的一个好处是它们可以轻易的并行化，另一个好处是对于非常稀疏的矩阵计算量更小。**

Given旋转矩阵的表达：

![image](http://hujiaweibujidao.github.io/images/math/givens.png)

Given旋转矩阵的稳定计算：

![image](http://hujiaweibujidao.github.io/images/math/givens2.png)

3.逆矩阵和伴随矩阵

理解了矩阵就是线性变换之后，那么就很容易明白逆矩阵就是将被作用对象从变换后的位置变换回来！

那，伴随矩阵又是什么呢？

[wiki](http://zh.wikipedia.org/wiki/%E4%BC%B4%E9%9A%8F%E7%9F%A9%E9%98%B5)在线性代数中，一个方形矩阵的伴随矩阵$A^{*}$是一个类似于逆矩阵$A^{-1}$的概念。如果矩阵可逆，那么它的逆矩阵和它的伴随矩阵之间只差一个系数($A^{-1}=\frac{A^{*}}{det(A)}$)。也就是说，**伴随矩阵其实是变换回来之后还进行了一次放缩，放缩的大小与矩阵的行列式值有关**。

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen.png)

举例说明伴随矩阵的计算，伴随矩阵其实就是原矩阵的代数余子式矩阵的转置！

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen2.png)

伴随矩阵的性质

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen3.png)

还需要注意的是，**逆矩阵是对于方阵来说的，只有方阵还有逆矩阵的概念，那要不是方阵呢？那么就是广义的逆矩阵**！广义逆矩阵在最小二乘法中有重要的应用。关于逆矩阵的求解以及代码实现请参考我写的另一份总结[《Numerical Methods Using Matlab》](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)第一章 线性方程组求解，最小二乘问题请参考第四章 曲线拟合和多项式插值。

矩阵的一个重要用途是解线性方程组。线性方程组中未知量的系数可以排成一个矩阵，加上常数项，则称为增广矩阵。另一个重要用途是表示线性变换，即是诸如f(x)  = 4x之类的线性函数的推广。设定基底后，某个向量v可以表示为m×1的矩阵,而线性变换f可以表示为行数为m的矩阵A，使得经过变换后得到的向量f(v)可以表示成Av的形式。矩阵的特征值和特征向量可以揭示线性变换的深层特性。


