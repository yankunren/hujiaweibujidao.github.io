---
layout: post
title: "SS 3-Multiple Random Variables and its Distribution"
date: 2014-05-19 20:40
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第三部分 分布之多维随机变量及其分布</center>

很多情况下我们遇到的都是多维的随机变量，比如，对一个地区的儿童进行抽样统计，观察他们的身高H和体重W，样本空间S就是该地区的儿童，身高H和体重W都是定义在S上的随机变量，这里向量(H,W)就构成了二维随机向量(或者二维随机变量)，前面两节讨论的分布都是一维随机变量的分布。二维随机变量(X,Y)的性质不仅和X及Y的性质有关，还和它们的相关性有关，也就是前面提到的相关系数！

1.二维随机变量(X,Y)的分布函数(或者叫联合分布函数)

$$F(x,y)=P(X \le x \cap Y \le y)=P(X \le x, Y \le y)$$

如果将二维随机变量看作是平面上随机点的坐标的话，那么分布函数F(x,y)在点(x,y)处的函数值就是以点(x,y)为顶点而位于该点左下方的无穷矩形域内的概率。

![image](http://hujiaweibujidao.github.io/images/math/mul_1.png)

分布函数的性质：

![image](http://hujiaweibujidao.github.io/images/math/mul_2.png)

如果(X,Y)只有有限对可取的值那么就是二维离散型随机变量(X,Y)，它的分布律(或者随机变量X和Y的联合分布律)：

$$P(X=x_{i},Y=y_{j})=p_{ij},i,j=1,2,..., \quad (\Sigma_{i=0}^{\infty}\Sigma_{j=0}^{\infty}p_{ij}=1)$$

则有：$$F(x,y)=P(X \le x, Y \le y)=\Sigma_{x \le x_{i}}\Sigma_{y \le y_{j}}p_{ij}$$

如果(X,Y)的值是由非负函数f(x,y)确定的，那么就是二维连续型随机变量(X,Y)，它的概率密度函数(或者随机变量X和Y的联合概率密度函数)：

$$F(x,y)=\int_{-\infty}^{x_{i}}\int_{-\infty}^{y_{j}}f(u,v)dudv$$

二维连续性随机变量的性质：

![image](http://hujiaweibujidao.github.io/images/math/mul_3.png)

2.边缘分布

边缘分布函数，边缘分布律，边缘概率密度

**边缘分布其实就是指，对于一个多维随机变量来说，它具有一个联合分布律或者联合概率密度，但是如果我们只考虑它其中的某一个随机变量的话，那么这个随机变量的分布律或者概率密度就是边缘分布律或者边缘概率密度了。**

二维连续型随机变量(X,Y)对X的边缘概率密度实际上就是对y进行积分$$f_{X}(x)=\int_{-\infty}^{\infty}f(x,y)dy$$，同理，对Y的边缘概率密度实际上就是对x进行积分$$f_{Y}(y)=\int_{-\infty}^{\infty}f(x,y)dx$$。

![image](http://hujiaweibujidao.github.io/images/math/cond_1.png)
![image](http://hujiaweibujidao.github.io/images/math/cond_2.png)

为什么叫边缘分布呢? 其实是因为一般边缘分布的数值写在联合分布律的表格边缘而已。

![image](http://hujiaweibujidao.github.io/images/math/cond_3.png)

下面我们看下二维正态分布，这是一个很重要的多维随机变量分布，我们从中可以得到一些重要的结论。

**二维正态分布的两个边缘分布都是一维正态分布，给以这两个一维正态分布不同的参数会得到不同的二维正态分布，所以，已知关于X和Y的边缘分布，并不能确定X和Y的联合分布。**

![image](http://hujiaweibujidao.github.io/images/math/cond_4.png)
![image](http://hujiaweibujidao.github.io/images/math/cond_5.png)

上面的参数$\rho$是随机变量X和Y的相关系数，后面还会详细介绍。

3.条件分布

**因为是多维随机变量，那么自然可以假定其中某一个随机变量为某个固定的值，在这种情况下我们再去看其他随机变量的分布那就是条件分布了。**

二维离散型随机变量的条件分布律

$$ P(X=x_{i} \| Y=y_{j}) = \frac{P(X=x_{i},Y=y_{j})}{P(Y=y_{j})} $$

![image](http://hujiaweibujidao.github.io/images/math/cond_6.png)

二维连续型随机变量的条件概率密度

$$ P(X=x_{i} \| Y=y_{j}) = \int_{-\infty}^{x}\frac{f(x,y)}{f_{Y}(y))}dx $$

![image](http://hujiaweibujidao.github.io/images/math/cond_8.png)
![image](http://hujiaweibujidao.github.io/images/math/cond_9.png)

举例说明连续型条件概率密度的计算

![image](http://hujiaweibujidao.github.io/images/math/cond_10.png)

4.相互独立的随机变量

前面我们提到随机变量之间可能存在相关性，那自然也有不存在相关性的随机变量，即相互独立的随机变量。很显然，如果随机变量(X,Y)的联合分布等于边缘分布的乘积那么就说明随机变量X和Y是相互独立的。

对于连续型随机变量(X,Y)来说，X和Y是相互独立的的条件是$$f(x,y)=f_{X}(x)f_{Y}(y)$$。

对于离散型随机变量(X,Y)来说，X和Y是相互独立的的条件是对于所有可能的$$(x_{i},y_{j})$$对，都有$$P(X=x_{i},Y=y_{j})=P(X=x_{i})P(Y=y_{j})$$。

![image](http://hujiaweibujidao.github.io/images/math/ind_2.png)

如果从期望和方差的角度来看独立性的话，那么就有$$E(XY)=E(X)E(Y), D(X+Y)=D(X)+D(Y)$$，也就是随机变量XY的期望是X和Y的期望的乘积，随机变量(X+Y)的方差是X和Y的方差之和。如果X和Y是相互独立的，那么它们的协方差Cov(X,Y)=0。

$$E(XY)=\int_{-\infty}^{\infty}xyf(x)f(y)dxdy=\int_{-\infty}^{\infty}xyf_{X}(x)f_{Y}(y)dxdy=\int_{-\infty}^{\infty}xf_{X}(x)dx\int_{-\infty}^{\infty}yf_{Y}(y)dy=E(X)E(Y)$$

$$D(X+Y)=D(X)+D(Y)$$

![image](http://hujiaweibujidao.github.io/images/math/ind_4.png)

对于前面的二维正态随机变量，随机变量X和Y是相互独立的前提条件是它们的相关系数$\rho=0$。

![image](http://hujiaweibujidao.github.io/images/math/ind_3.png)

二维随机变量中的独立性可以很容易地推广到n维随机变量上。

![image](http://hujiaweibujidao.github.io/images/math/ind_1.png)

5.随机变量函数的分布

有些时候我们需要处理的随机变量是几个随机变量形成的函数，这个时候它的分布是怎样的呢？
这类函数比较多，比如求和，乘积，商，最大值或者最小值，这里只说明其中最重要的一个和函数的分布。

从中我们得到一个结论：有限个相互独立的正态随机变量的线性组合仍然是服从正态分布。

![image](http://hujiaweibujidao.github.io/images/math/fun_1.png)



