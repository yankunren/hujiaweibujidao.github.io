---
layout: post
title: "LAS 2-Matrix"
date: 2014-04-29 14:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/4/28</center>**

### <center>矩阵</center>

1.什么是矩阵？

这个问题很多人进行过探讨，在网上也比较火，比如[孟岩的三篇《理解矩阵》](http://blog.csdn.net/myan/article/details/647511)，知乎上[如何直观理解矩阵和线代](http://www.zhihu.com/question/21082351)，还有其他人对矩阵的理解，例如[新理解矩阵1](http://spaces.ac.cn/index.php/archives/1765/)和[新理解矩阵2](http://spaces.ac.cn/index.php/archives/1768/)等等。

那，到底什么是矩阵呢？

**总结起来，我觉得，矩阵就是线性变换，作用在一个点上就是将这个点移动到该空间的另一个点，作用在向量上就是对这个向量进行放缩或者旋转或者反射等一系列的线性变换，作用在矩阵上那就是对矩阵中的每一个列向量进行线性变换之后然后进行叠加结果(这就是为什么矩阵的乘法有些奇妙的原因)。因为运动是相对的，你可以理解为坐标系没有变，被作用对象发生了变化，也可以理解为被作用对象没有变，变的是坐标系(也就是空间的基)。**

> 这里借用下小苏的图和解释。
矩阵$$A=\left[ \begin{array}{cc} a11 & a12 \\ a21 & a22 \end{array} \right]$$
事实上是由两个向量$[a11,a21]^T$和$[a12,a22]^T$（这里的向量都是列向量）组成，它描述了一个平面（仿射）坐标系。换句话说，这两个向量其实是这个坐标系的两个基，而运算$y=Ax$则是告诉我们，在$A$这个坐标系下的$x$向量，在$I$坐标系下是怎样的。这里的$I$坐标系就是我们最常用的直角坐标系，也就是说，任何向量（包括矩阵里边的向量），只要它前面没有矩阵作用于它，那么它都是在直角坐标系下度量出来的。下图所用的矩阵$$A=\left[ \begin{array}{cc} 3 & 2 \\ 1 & 3 \end{array} \right]$$
构成了一个仿射坐标系，在这个坐标系下，有一个向量$x=[2,2]^T$，它在直角坐标系下测得的坐标为$[10,8]^T$，现在我们不难发现，直接用矩阵乘法来计算，有
$Ax=[3∗2+2∗2,1∗2+3∗2]^T=[10,8]^T$
小苏对此展开讨论了[它和矩阵乘法之间的联系](http://spaces.ac.cn/index.php/archives/1768/)

![image](http://hujiaweibujidao.github.io/images/math/xianxinbianhua.png)

[wiki](http://zh.wikipedia.org/wiki/%E7%9F%A9%E9%98%B5)上关于矩阵和线性变换关系的解释，其中提到了从n维空间到m维空间的任何线性变换都对应于一个矩阵，其中也提到了相似矩阵其实是相同的线性变换在不同的坐标基下的不同表示而已。

![image](http://hujiaweibujidao.github.io/images/math/xianxingbianhuan.png)

2.线性变换

好吧，矩阵是线性变换，那什么是线性变换呢？

wiki中对线性变换的解释，这些变换其实主要包括缩放、旋转、反射等，注意不包括平移，线性变换需要满足下面两个条件：

$$f(\alpha v)=\alpha v \quad f(u+v)=f(u)+f(v)$$

![image](http://hujiaweibujidao.github.io/images/math/xianxinbianhua2.png)

(1)放缩变换

$$
A=\left[ \begin{array}{cc} \frac{3}{2} & 0 \\ 0 & \frac{3}{2} \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{c} x'=\frac{3}{2}x \\ y'=\frac{3}{2}y \end{array} \right.
$$

放缩反射，x和y都变成原来的$\frac{3}{2}$倍。

(2)反射变换

$$
A=\left[ \begin{array}{cc} -1 & 0 \\ 0 & 1 \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{cc} x'=-x \\ y'=y \end{array} \right.
$$

水平反射，x变成对应的相反数，y不变。

什么是反射？

[反射 on wiki](http://zh.wikipedia.org/wiki/%E5%8F%8D%E5%B0%84_(%E6%95%B0%E5%AD%A6))上的解释是：**反射是把一个物体变换成它的镜像的映射。对于二维空间中的反射，需要使用一条直线（反射轴）作为“镜子”，对于三维空间中的反射就要使用平面作为镜子。**

**最常用的反射变换就是[Householder变换 on wiki](http://zh.wikipedia.org/wiki/%E8%B1%AA%E6%96%AF%E9%9C%8D%E5%B0%94%E5%BE%B7%E5%8F%98%E6%8D%A2)了，这一变换将一个向量变换为由一个超平面反射的镜像，是一种线性变换。Householder变换可以将向量的某些元素置零，同时保持该向量的范数不变。**关于Householder的内部原理以及代码实现请请参考后面的[矩阵分解总结](http://hujiaweibujidao.github.io/blog/2014/04/29/linearalgebra-summary-6/)部分，或者参考我写的另一份总结[《Numerical Methods Using Matlab》第三章 矩阵特征值和奇异值分解](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)

(3)旋转变换

$$
A=\left[ \begin{array}{cc} \cos(\frac{\pi}{6}) & -\sin(\frac{\pi}{6}) \\ \sin(\frac{\pi}{6}) & \cos(\frac{\pi}{6}) \end{array} \right] \quad
\rightarrow \left\{ \begin{array}{c} x'=\frac{\sqrt{3}}{2}x-\frac{1}{2}y \\ y'=\frac{1}{2}x+\frac{\sqrt{3}}{2}y \end{array} \right.
$$

旋转变换，[一般性的证明请看这张图](http://hujiaweibujidao.github.io/images/math/xuanzhuanbianhuan.png)，[wiki](http://zh.wikipedia.org/wiki/%E6%97%8B%E8%BD%AC)中对二维空间旋转的解释。

![image](http://hujiaweibujidao.github.io/images/math/xuanzhuanbianhuan2.png)

最常用的旋转矩阵就是[Givens旋转](http://zh.wikipedia.org/wiki/%E5%90%89%E6%96%87%E6%96%AF%E6%97%8B%E8%BD%AC)。Givens 旋转在数值线性代数中主要的用途是在向量或矩阵中介入零。**关于Givens旋转的内部原理以及代码实现请请参考后面的[矩阵分解总结](http://hujiaweibujidao.github.io/blog/2014/04/29/linearalgebra-summary-6/)部分。**

3.逆矩阵和伴随矩阵

理解了矩阵就是线性变换之后，那么就很容易明白逆矩阵就是将被作用对象从变换后的位置变换回来！

那伴随矩阵又是什么呢？

[wiki](http://zh.wikipedia.org/wiki/%E4%BC%B4%E9%9A%8F%E7%9F%A9%E9%98%B5)在线性代数中，一个方形矩阵的伴随矩阵A*是一个类似于逆矩阵$A^{-1}$的概念。如果矩阵可逆，那么它的逆矩阵和它的伴随矩阵之间只差一个系数($$A^{-1}=\frac{A^{*}}{det(A)}$$)。也就是说，**伴随矩阵其实是变换回来之后还进行了一次放缩，放缩的大小与矩阵的行列式值有关**。

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen.png)

举例说明伴随矩阵的计算，伴随矩阵其实就是原矩阵的代数余子式矩阵的转置！

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen2.png)

伴随矩阵的一些性质

![image](http://hujiaweibujidao.github.io/images/math/bansuijuzhen3.png)

还需要注意的是，**逆矩阵是对于方阵来说的，只有方阵还有逆矩阵的概念，那要不是方阵呢？那么就是广义的逆矩阵**！广义逆矩阵在最小二乘法中有重要的应用。关于逆矩阵的求解以及代码实现请参考我写的另一份总结[《Numerical Methods Using Matlab》](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)第一章 线性方程组求解，最小二乘问题请参考第四章 曲线拟合和多项式插值。

关于矩阵逆矩阵的求解可以看后面的[矩阵分解](http://hujiaweibujidao.github.io/blog/2014/04/29/linearalgebra-summary-6/)部分。

4.秩

什么是矩阵的秩？

[wiki中的解释](http://zh.wikipedia.org/wiki/%E7%A7%A9_(%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0))在线性代数中，一个矩阵A的列秩是A的线性独立的纵列的极大数目。类似地，行秩是A的线性独立的横行的极大数目。矩阵的列秩和行秩总是相等的，因此它们可以简单地称作矩阵A的秩。通常表示为r(A)，rk(A)或rank A。m × n矩阵的秩最大为m和n中的较小者，表示为 min(m,n)。有尽可能大的秩的矩阵被称为有满秩；类似的，否则矩阵是秩不足（或称为“欠秩”）的。

**矩阵的行秩与列秩相等，是线性代数基本定理的重要组成部分. 其基本证明思路是，矩阵可以看作线性映射的变换矩阵，列秩为像空间的维度，行秩为非零原像空间的维度，因此列秩与行秩相等，即像空间的维度与非零原像空间的维度相等（这里的非零原像空间是指约去了零空间后的商空间：原像空间）。这从矩阵的奇异值分解就可以看出来。**[证明可以参见wiki](http://zh.wikipedia.org/wiki/%E7%A7%A9_(%E7%BA%BF%E6%80%A7%E4%BB%A3%E6%95%B0))

黄老师的总结中还给出了**初等变换不改变矩阵的行秩和列秩**的证明，此外还有，以下四个表述是等价的：

• A 为满秩矩阵. 
• A 为可逆矩阵. 
• A 为非奇异矩阵.
• |A| $\ne$ 0.

说了这么多，那到底矩阵的秩对于矩阵表示的这个线性变换来说意味着什么？

**我的理解是，矩阵的秩其实就是至少需要几个基向量就能完全表示该线性变换。**

<!--
矩阵的一个重要用途是解线性方程组。线性方程组中未知量的系数可以排成一个矩阵，加上常数项，则称为增广矩阵。另一个重要用途是表示线性变换，即是诸如f(x)  = 4x之类的线性函数的推广。设定基底后，某个向量v可以表示为m×1的矩阵,而线性变换f可以表示为行数为m的矩阵A，使得经过变换后得到的向量f(v)可以表示成Av的形式。矩阵的特征值和特征向量可以揭示线性变换的深层特性。
-->

好吧，其实还有转置矩阵对不对？[转置on wiki](http://zh.wikipedia.org/wiki/%E8%BD%89%E7%BD%AE)是从m×n矩阵的向量空间到所有n×m矩阵的向量空间的线性映射。这个我还不太理解，读者若明白了请留言告知，谢谢！

OK，矩阵的理解就到这里吧，下节介绍矩阵的特征值和特征向量，也可以直接看看后面关于其他矩阵的理解，例如相似矩阵和正交矩阵等等。







