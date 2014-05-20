---
layout: post
title: "SS 1-Probability"
date: 2014-05-19 19:00
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第一部分 概率</center>
1.事件：对立事件(complementary event)，互斥事件(exclusive event)，相交事件(intersecting event)，相关事件(dependent event)，独立事件(independent event)，可以使用韦恩图(Venn Diagram)方便分析事件之间的关系。

如果事件A和B会相互影响，那么它们是相关事件，否则是独立事件。
事件A和B独立：$P(A|B)=P(A) \quad P(A \cap B)=P(A)P(B)$

2.概率：条件概率(Conditional Probability)，全概率(Total Probability)，贝叶斯定理(Bayes' Theorem)

条件概率：$ P(A | B) = \frac{P(A \cap B)}{P(B)} $

全概率：$ P(B) = P(B|A) P(A)+P(B|A') P(A') $

贝叶斯定理(将条件概率和全概率整合到一起)：
$P(A|B)=\frac{P(A \cap B)}{P(B|A)P(A)+P(B|A')P(A')}$

3.期望(Expectation)与方差(Variance)

$E(x)=\Sigma xP(X=x)=\mu \quad Var(x)=E(x-\mu)^{2}=\Sigma (x-\mu)^2P(X=x)=E(x^{2})-(E(x))^{2}$

[注：上面的期望的等式是对于离散型随机变量x，如果是连续型随机变量x，那么$E=\int_{-\infty}^{\infty} xf(x)dx$，同理，方差就是$D=\int_{-\infty}^{\infty} (x-E)^{2}f(x)dx$，期望描述的是数据的集中趋势，方差描述的数据的偏移程度]

线性变换之后的期望与方差：

$E(ax+b)=aE(x)+b \quad Var(ax+b)=a^{2}Var(x)$
$E(ax+by)=aE(x)+bE(y) \quad Var(ax+by)=a^{2}Var(x)+b^{2}Var(y)$

**思考：为什么加上b，方差并没有发生变化呢？**

**因为在变量中增加常数b只是将概率分布移动了一下，分布的形状并没有发生改变，所以b并没有在方差中起到作用。**

相互独立事件X和Y：

$E(X+Y)=E(X)+E(Y) \quad Var(X+Y)=Var(X)+Var(Y)$
$E(X-Y)=E(X)-E(Y) \quad Var(X-Y)=Var(X)+Var(Y)$

**思考：为什么$Var(X-Y)=Var(X)+Var(Y)$？可以随便拿数据验证之。**

**记住，一个随机变量减去另一个随机变量得到的概率分布的方差是两个随机变量的方差之和，方差只会增加！**

下面两个图示演示了其结果

![image](http://hujiaweibujidao.github.io/images/math/varxplusy.png)

![image](http://hujiaweibujidao.github.io/images/math/varxminusy.png)

相互独立的随机变量与独立观测值之间的区别：

![image](http://hujiaweibujidao.github.io/images/math/independentobservation.png)

