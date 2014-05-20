---
layout: post
title: "SS 2-Covariance and Correlation coefficient"
date: 2014-05-19 19:30
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第二部分 协方差和相关关系</center>

1.协方差

随机变量X和Y的协方差Cov(X,Y)=E[X-E(X)]E[Y-E(Y)]=E(XY)-E(X)E(Y)。

为什么D(X+Y)=E(XY)-E(X)E(Y)?

$
D(X+Y)=E[(X+Y)^{2}]-[E(X+Y)]^{2}=E[X^{2}+Y^{2}-2XY]-[E(X)+E(Y)]^{2} \\ =E[X^{2}]-[E(X)]^{2}+E[Y^{2}]-[E(Y)]^{2}+2E(XY)-2E(X)E(Y) \\ =D(X)+D(Y)+2E(XY)-2E(X)E(Y)
$

因为 **(X+Y)=D(X)+D(Y)+2Cov(X,Y)**
所以 **D(X+Y)=E(XY)-E(X)E(Y)**

协方差的性质：(基本上根据上式都可以简单证明得到)

Cov(X,Y)=Cov(Y,X)， Cov(X,X)=D(X)，Cov(aX,bY)=abCov(X,Y)

$$Cov(X_{1}+X_{2},Y)=Cov(X_{1},Y)+Cov(X_{2},Y)$$

如果X和Y是相互独立的，那么Cov(X,Y)=0。

2.相关系数(correlation coefficient)是两个变量之间**线性关系**的数值型指标，取值范围是[-1,1]，大于0表示正相关，小于0表示负相关，可以用散点图来直接查看相关性。**根据某些不成文的规则，一般高于0.6表示强相关，低于0.4表示弱相关，中间部分表示中度相关。**

[**一般说的相关系数是Pearson相关系数，它考察的变量的属性是连续的，例如年龄，体重等，如果是离散型变量那么应该使用点二列相关系数**]

相关系数的计算：

一种表示方式是：[这是从协方差和方差的角度来看的]

$$
\rho_{XY}=\frac{Cov(X,Y)}{\sqrt{D(X)}\sqrt{D(Y)}}
$$

还有一种常见的表示方式是：[这是从数据本身来看的]

$$
r_{XY}=\frac{n\Sigma{XY}-\Sigma{X}\Sigma{Y}}{\sqrt{[n\Sigma{X^2}-(\Sigma{X})^2][n\Sigma{Y^2}-(\Sigma{Y})^2]}}
$$

其实，很容易看出两者是等价的，因为$E(X)=\frac{\Sigma X}{n}, D(X)=\frac{\Sigma X^{2}}{n} - \frac{\Sigma X}{n^{2}}$，然后将第二个等式右边上下除以$n^{2}$即可得到第一个等式的右边。

计算的例子：

![image](http://hujiaweibujidao.github.io/images/math/cor_1.png)

得到的结果为0.692，算是一个强相关

$$
r_{XY}=\frac{10 \times 247-54 \times 43}{\sqrt{[10 \times 320-(54)^2][10 \times 201-(43)^2]}} = 0.692
$$

为什么说相关系数反映的只是随机变量之间的线性关系呢？

我们总是用关于X的线性函数a+bX去近似Y，也就是拟合，如何判断拟合的好坏呢？一般都是用均方误差，也就是误差值的平方的均值！然后用均方误差对a和b分别求导即可得到使得均方误差达到最小的拟合参数a和b。很有意思的一个结论就是，均值点(E(X),E(Y))一定在拟合直线a+bX上。

![image](http://hujiaweibujidao.github.io/images/math/cor_2.png)

最后得到的结果是:$$min E[[Y-(a+bX)]^{2}]=(1-\rho_{XY}^{2})D(Y)$$，从中可以得到很多性质：

![image](http://hujiaweibujidao.github.io/images/math/cor_3.png)

均方误差e和相关系数$\rho$之间的关系：

![image](http://hujiaweibujidao.github.io/images/math/cor_4.png)

注意两点：

(1)**相关系数反映的是只是线性关系！如果两个变量的相关系数为0，只能说明它们没有线性关系存在，但是可能存在其他的非线性关系！不相关和相互独立是不一样的，不相关只是就线性关系来说，相互独立是就一般关系而言。**

![image](http://hujiaweibujidao.github.io/images/math/cor_5.png)

但是，有时候相关性和独立性是等价的，比如下面的二维正态分布，这是很重要的多维随机变量分布(不明白可以看下节对多维随机变量分布的介绍)，随机变量X和Y相互独立的条件是$\rho=0$，而$\rho$正好等于$$\rho_{XY}$$，且随机变量X和Y不相关的条件就是$$\rho_{XY}=0$$，所以此时相关性和独立性是等价的。[之后我会写一篇文章介绍相关系数到底是如何影响二维正态分布的数据的分布的]

![image](http://hujiaweibujidao.github.io/images/math/cor_6.png)
![image](http://hujiaweibujidao.github.io/images/math/cor_7.png)

(2)**相关性和因果关系无关！**例如，冰淇淋的消费量和犯罪率是正相关的(可以参考《爱上统计学》)，但是两者不存在任何因果关系！

决定系数：相关系数的平方，它表述一个变量的方差可以被另一个变量的方差来解释的百分比。(参考《爱上统计学》)

3.协方差矩阵

协方差矩阵是非常重要的内容，经典算法PCA的基础就是协方差矩阵。引入它之前，先要看下原点矩和中心距的概念

![image](http://hujiaweibujidao.github.io/images/math/corm_1.png)

协方差矩阵其实就是n维随机变量的二阶混合中心距组成的矩阵

![image](http://hujiaweibujidao.github.io/images/math/corm_2.png)

还是回到我们最重要的那个二维正态随机变量，看下如何将它的概率密度转换成协方差矩阵的表示形式，继而将其推广至n维正态随机变量。

![image](http://hujiaweibujidao.github.io/images/math/corm_5.png)
![image](http://hujiaweibujidao.github.io/images/math/corm_4.png)

n维正态随机变量的性质

![image](http://hujiaweibujidao.github.io/images/math/corm_3.png)









