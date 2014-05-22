---
layout: post
title: "LAS 5-Orthogonal Matrix"
date: 2014-04-29 15:03
comments: true
categories: math
published: false
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/5/22</center>**

### <center>正交矩阵</center>

1.正交矩阵

什么是正交？

两个向量的内积如果是零，那么就说这两个向量是正交的，在三维空间中，正交的两个向量相互垂直。如果相互正交的向量长度均为 1，那么他们又叫做标准正交基。

那什么是正交矩阵呢？

[正交矩阵 on wiki](http://zh.wikipedia.org/wiki/%E6%AD%A3%E4%BA%A4%E7%9F%A9%E9%98%B5)的介绍是：在矩阵论中，实数正交矩阵是方块矩阵Q，它的转置矩阵是它的逆矩阵：$Q^T Q = Q Q^T = I$

注意上面提到的`实数`二字，正交矩阵中的元素都是实数，包含复数并且同样满足正交性质的矩阵是酉矩阵，也就是推广到复数域之后的“正交矩阵”。

简单地理解就是指列向量相互正交的矩阵，但是还需要满足列向量是正交规范化的。

**实数方块矩阵是正交的，当且仅当它的列形成了带有普通欧几里得点积的欧几里得空间$R^{n}$的**正交规范基**，它为真当且仅当它的行形成$R^{n}$的正交基。假设带有正交（非正交规范）列的矩阵M叫正交矩阵可能是诱人的，但是这种矩阵没有特殊价值而没有特殊名字；它们只是$M^{T}M$ = D，D是对角矩阵。**

**正交矩阵最重要的性质之一是它的变换可以保证一个向量的长度不变，包括 Euclidean lenght ，matrix norm 和 Frobenius norm。**[最后一个是矩阵的F范数]

下面考虑一个向量v，v的长度的平方是$v^{T}v$。如果作用在向量v上的线性变换Q保持了向量长度，即

$${ v}^T{ v} = (Q{ v})^T(Q{ v}) = { v}^T Q^T Q { v}$$

能够做到保持向量长度不变的线性变换也就是旋转、反射和它们的组合，所以**旋转、反射和它们的组合都产生正交矩阵。反过来，正交矩阵也蕴涵了正交变换(旋转变换或者反射变换)。**但是，**线性代数包括了在既不是有限维的也不是同样维度的空间之间的正交变换，它们没有等价的正交矩阵。**

一些小正交矩阵的例子和可能的解释。[来源自wiki](http://zh.wikipedia.org/wiki/%E6%AD%A3%E4%BA%A4%E7%9F%A9%E9%98%B5#.E4.BE.8B.E5.AD.90)

$$A=\left[ \begin{array}{cc} a11 & a12 \\ a21 & a22 \end{array} \right]$$

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
\end{bmatrix}$旋转(这其实就是一个Givens旋转)  $\begin{bmatrix}
\cos \theta & \sin \theta \\
\sin \theta & -\cos \theta \\
\end{bmatrix}$ 反射

我们思考一下，反射的逆矩阵是什么？反射的逆过程其实就是它自己对不对？也就是说反射的逆矩阵等于反射本身！所以就有了**反射矩阵、反射矩阵的逆矩阵以及它的转置矩阵三者相同！**

高维度下的正交矩阵比较复杂，但是可以通过基本模块例如置换、反射和旋转来构建高维的正交矩阵，例如下面要介绍的Householder变换和Givens旋转。

(置换矩阵就是单位矩阵的某些行和列交换后得到的矩阵)

![image](http://hujiaweibujidao.github.io/images/math/zhengjiao2.png)

既然正交矩阵这么有用，有时候我们就会想要把一个矩阵正交化，那怎么正交化呢？线代书中介绍了典型的[Gram-Schmidt正交化](http://zh.wikipedia.org/wiki/Gram-Schmidt%E6%AD%A3%E4%BA%A4%E5%8C%96)，但是实际应用中这种方法会因为误差的累积使得最后的正交性很差，所以经常使用的是下面的Givens旋转和Householder变换。

2.Givens旋转

Givens旋转又称为平面旋转变换，它能够消去给定向量的某一个分量（使其为0），这点不同于Householder变换消去向量中的多个分量，在处理有很多零元素的稀疏向量或者稀疏矩阵的时候Givens旋转就更加有效。

喻文健老师的《数值分析与算法》对此介绍地很详细，内容如下：

先看下2x2的Givens旋转的推导过程：

![image](http://hujiaweibujidao.github.io/images/math/givens1.png)

将其推广到n维向量的情况：

![image](http://hujiaweibujidao.github.io/images/math/givens_2.png)
![image](http://hujiaweibujidao.github.io/images/math/givens3.png)

举例说明Givens旋转的处理过程：

![image](http://hujiaweibujidao.github.io/images/math/givens4.png)

**Givens 旋转在数值线性代数中主要的用途是在向量或矩阵中介入零。例如，这种效果可用于计算矩阵的 QR分解。超过Householder变换的一个好处是它们可以轻易的并行化，另一个好处是对于非常稀疏的矩阵计算量更小。**

关于旋转矩阵的内容：

**wiki: 旋转矩阵是在乘以一个向量的时候有改变向量的方向但不改变大小的效果的矩阵。旋转矩阵不包括点反演，它可以把右手坐标系改变成左手坐标系或反之。所有旋转加上反演形成了正交矩阵的集合。旋转可分为主动旋转与被动旋转。主动旋转是指将向量逆时针围绕旋转轴所做出的旋转。被动旋转是对坐标轴本身进行的逆时针旋转，它相当于主动旋转的逆操作。**

旋转矩阵的性质：

**一个矩阵是旋转矩阵，当且仅当它是正交矩阵并且它的行列式是单位一。正交矩阵的行列式是 ±1(根据$U U^{T}=E$，且$det(U)=det(U^{T})$易得)，如果行列式是 −1，则它包含了一个反射而不是真旋转矩阵。**

[`正交矩阵的行列式如果是−1，则它包含了一个反射！如果是1，则它包含了一个旋转！`不知道正确与否，若读者明白请留言告知，谢谢]

**旋转矩阵是正交矩阵，如果它的列向量形成 ${R}^{n}$ 的一个正交基，就是说在任何两个列向量之间的标量积是零(正交性)而每个列向量的大小是单位一(单位向量)。一定要记住旋转矩阵一定是正交矩阵，所以也就有它的转置矩阵等于它的逆矩阵，并且它的行列式为1！**

![image](http://hujiaweibujidao.github.io/images/math/xuanzhuanjuzhen.png)

3.Householder反射

Householder变换是一个初等反射变换，用Householder矩阵左乘一个向量或者矩阵，即实现Householder变换。下图为Householder变换的图示，向量x在矩阵H的作用下得到的向量Hx和原向量x刚好是镜像反射关系。

![image](http://hujiaweibujidao.github.io/images/math/HouseholderReflection.png)

一个nxn的Householder矩阵$H$具有如下的形式：

$$
H=I-\frac{2}{v^{T}v} vv^{T}
$$

其中，矩阵$I$是一个(nxn)单位阵(对角线元素都是1)，而$v$是一个包含n个元素的列向量

$$v=c+||c||_{2}e$$

向量$c$和$e$是是包含n个元素的列向量，分别对应要变换的矩阵的某一列和单位阵的某一列，$||c||_{2}$是向量$c$的二范数 

$$||c||_{2}=\sqrt{c_{1}^2+c_{2}^2+c_{3}^2+\cdots+c_{n}^2}$$

矩阵$H$是正交对称阵，所以$H=H^{T}=H^{-1}$。**Househoulder变换实现向量在线性空间中的“镜面反射”，即$Hx$是向量$x$相对于法向量为$v$的超平面的镜像，也就是$Hx$和$x$关于平面$S$镜像对称。采用Householder变换可以将向量$x$中除某一个分量之外的其他分量变成0，这是一种消元操作。**注意一类小技巧，不需要显式构造$H$便可以计算$Hx$，如下所示，只需计算向量$x$和$v^{T}$的内积，不用计算矩阵和向量的乘法，下面等式最右边的$\frac{v^{T}x}{v^{T}v}$实际上是一个标量！

$$
Hx=(I-\frac{2}{v^{T}v} vv^{T})x=x-2\frac{v^{T}x}{v^{T}v} v
$$

将(nxn)矩阵$A$分解为正交阵$Q$和上三角阵$R$的过程需要$n-1$步。下面看下详细的处理流程：[下面的步骤其实就是QR分解的核心，QR分解的内容请看下节]

(1)向量$c$是矩阵$A$的第一列，向量$e$是长度为n的列向量，如果$c$的第一个元素是正数的话$e$的第一个元素是1，否则是-1(**这么做其实是为了防止大数吃小数现象，也就是减小误差**)。得到$c$和$e$之后，便可以计算出$v$，然后得到矩阵$H_{1}$，如下所示：

$$
c=
\left[
\begin{array}{c}
a_{11}\\
a_{12}\\
\cdots\\
a_{nn}  
\end{array}
\right]\quad
e=
\left[
\begin{array}{c}
\pm 1\\
0\\
\cdots\\
0  
\end{array}
\right]
$$

将$H_{1}$作用于$A$，此时$Q_{1}=H_{1},R_{1}=H_{1}A$。其中$Q_{1}$是正交阵，$R_{1}$的第一列第一个元素以下的元素都是0。$R_{1}$大致如下所示：

$$
\left(
\begin{array}{cccc}
R_{11}^{(1)}  & R_{12}^{(1)}   & \cdots & R_{1n}^{(1)}   \\
0  & R_{22}^{(1)}   & \cdots & R_{2n}^{(1)}   \\
0  & R_{32}^{(1)}   & \cdots & R_{3n}^{(1)}   \\
0  & R_{42}^{(1)}   & \cdots & R_{4n}^{(1)}   \\
\end{array}
\right)
$$

(2)这步中向量$c$是矩阵$R_{1}$的第二列，并且第一个元素设置为0，向量$e$是长度为n的列向量，不过第二个元素是$\pm 1$，如果$c$的第二个元素是正数的话$e$的第二个元素是1，否则是-1。得到$c$和$e$之后，便可以得到矩阵$H_{2}$，如下所示：

$$
c=
\left[
\begin{array}{c}
0\\
R_{12}^{(1)}\\
\cdots\\
R_{n2}^{(1)}  
\end{array}
\right]\quad
e=
\left[
\begin{array}{c}
0\\
\pm 1\\
\cdots\\
0  
\end{array}
\right]
$$

将$H_{2}$作用于$R_{1}$，此时$Q_{2}=Q_{1}H_{2},R_{2}=H_{2}R_{1}$。其中$Q_{2}$是正交阵，$R_{2}$的第二列第二个元素以下的元素都是0。$R_{2}$大致如下所示：

$$
\left(
\begin{array}{cccc}
R_{11}^{(2)}  & R_{12}^{(2)}   & \cdots & R_{1n}^{(2)}   \\
0  & R_{22}^{(2)}   & \cdots & R_{2n}^{(2)}   \\
0  & 0   & \cdots & R_{3n}^{(2)}   \\
0  & 0   & \cdots & R_{4n}^{(2)}   \\
\end{array}
\right)
$$

(3)重复与上面类似的过程，直到第(n-1)步，得到$Q_{n-1}=Q_{n-2}H_{n-1}=H_{1}H_{2}\cdots H_{n}$，同时$R_{n-1}=H_{n-1}R_{n-2}=H_{n-1}H_{n-2}\cdots H_{2}H_{1}$，此时$R_{n-1}$是一个上三角阵，$Q_{n-1}$是一个正交阵，得到矩阵$A$的QR分解式为$A=Q_{n-1}R_{n-1}$。

喻文健老师的《数值分析与算法》对Householder反射的介绍也很详细，重要内容如下：

Householder反射正确性的证明：[注意其中的$$\omega= \frac{v}{||v||_{2}}$$]

![image](http://hujiaweibujidao.github.io/images/math/householder1.png)
![image](http://hujiaweibujidao.github.io/images/math/householder2.png)

下面有两个关于Householder的定理，其实也很重要，便于理解镜面的法向量

![image](http://hujiaweibujidao.github.io/images/math/householder3.png)

最后给出一个Householder反射变换的例子：

![image](http://hujiaweibujidao.github.io/images/math/householder4.png)

OK！至此正交矩阵就介绍完了，下节介绍矩阵的常用分解，也是非常重要的内容。




