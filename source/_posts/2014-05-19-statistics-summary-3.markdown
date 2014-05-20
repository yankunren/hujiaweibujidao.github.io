---
layout: post
title: "SS 2-Covariance and Correlation"
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

协方差的性质：Cov(X,Y)=Cov(Y,X)， Cov(X,X)=D(X)，Cov(aX,bY)=abCov(X,Y)

$$Cov(X_{1}+X_{2},Y)=Cov(X_{1},Y)+Cov(X_{2},Y)$$

如果X和Y是相互独立的，那么Cov(X,Y)=0。

为什么D(X+Y)=E(XY)-E(X)E(Y)?

$
D(X+Y)=E[(X+Y)^{2}]-[E(X+Y)]^{2}=E[X^{2}+Y^{2}-2XY]-[E(X)+E(Y)]^{2} \\ =E[X^{2}]-[E(X)]^{2}+E[Y^{2}]-[E(Y)]^{2}+2E(XY)-2E(X)E(Y) \\ =D(X)+D(Y)+2E(XY)-2E(X)E(Y)
$

又因为 **(X+Y)=D(X)+D(Y)+2Cov(X,Y)**
所以 **D(X+Y)=E(XY)-E(X)E(Y)**

2.相关系数(correlation coefficient)是两个变量之间**线性关系**的数值型指标，取值范围是[-1,1]，大于0表示正相关，小于0表示负相关，可以用散点图来直接查看相关性。**根据某些不成文的规则，一般高于0.6表示强相关，低于0.4表示弱相关，中间部分表示中度相关。**

[**Pearson相关系数考察的变量的属性是连续的，例如年龄，体重等，如果是离散型变量那么应该使用点二列相关系数**]

注意两点：

(1)**相关系数反映的是只是线性关系！如果两个变量的相关系数为0，只能说明它们没有线性关系存在，但是可能存在其他的非线性关系！**

(2)**相关性和因果关系无关！**例如，冰淇淋的消费量和犯罪率是正相关的，但是两者不存在任何因果关系！

相关系数的计算：

$$
r_{XY}=\frac{n\Sigma{XY}-\Sigma{X}\Sigma{Y}}{\sqrt{[n\Sigma{X^2}-(\Sigma{X})^2][n\Sigma{Y^2}-(\Sigma{Y})^2]}}
$$

决定系数：相关系数的平方，它表述一个变量的方差可以被另一个变量的方差来解释的百分比。


