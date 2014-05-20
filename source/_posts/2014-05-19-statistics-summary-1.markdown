---
layout: post
title: "SS 1-Probability and Descriptive Statistics"
date: 2014-05-19 19:00
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第一部分 概率和统计量</center>
1.事件：对立事件(complementary event)，互斥事件(exclusive event)，相交事件(intersecting event)，相关事件(dependent event)，独立事件(independent event)，可以使用韦恩图(Venn Diagram)方便分析事件之间的关系。

如果事件A和B会相互影响，那么它们是相关事件，否则是独立事件。
事件A和B独立：$P(A|B)=P(A) \quad P(A \cap B)=P(A)P(B)$

2.概率：条件概率(Conditional Probability)，全概率(Total Probability)，贝叶斯定理(Bayes' Theorem)

条件概率：$ P(A \| B) = \frac{P(A \cap B)}{P(B)} $

全概率：$ P(B) = P(B \| A) P(A)+P(B \| A') P(A') $

贝叶斯定理(将条件概率和全概率整合到一起)：
$P(A|B)=\frac{P(A \cap B)}{P(B|A)P(A)+P(B|A')P(A')}$

3.描述数据的集中趋势：均值(mean)，中位数(median)，众数(mode)，加权平均数

百分位点(percentile points)：中位数(Q2)就是50百分位点，Q1为25百分位点(lower quartile)，Q3为75百分位点(upper quartile)，**经常使用Q3-Q1=IQR(interquartile range，四分差或四分位数)来检查分布是否对称。**

<!--
[如果要计算一组数中的某个百分位数，一般比较好的排序方法是选择排序；当然，如果是计算该组数的特殊的百分位数，例如中位数，有其他更好地方法能够在线性时间内得到，之后我对做一些相关问题的研究，暂且说明一下]
-->

4.描述数据的变异性：极差(range)，标准差(standard deviation,简称s或者SD)，方差(deviation)

标准差的计算公式：
$$
s=\sqrt{\frac{\Sigma(X-\bar{X})^2}{n-1}}
$$

**s是总体标准差的无偏估计，如果根号内部分母改成了n则是有偏估计，详细证明参见：[http://en.wikipedia.org/wiki/Bias_of_an_estimator](http://en.wikipedia.org/wiki/Bias_of_an_estimator)，《爱上统计学》作者对此的解释是统计学家们通常比较保守，保守的含义是，如果我们不得不出错，我们出错也是因为过高地估计了标准差(因为除以n-1使得标准差大于实际值)。**

如果想了解更加细致的内容可以看下这篇文章[Why divide the sample variance by N-1?](http://www.visiondummy.com/2014/03/divide-variance-n-1/)

标准差和方差的异同：**它们都是用来反映数据集的数据的变异性或者离散度的度量，但是标准差以原有的计算单位存在，然而方差以平方单位存在，前者在实际中更加具有意义**。例如，某高校的男生的平均身高是170cm，标准差是5cm，那么说明该校男生的身高与平均身高的差异大概就是上下5cm，换成方差来解释的话就不好陈述了。

使用有偏估计其实也可以，但是最好使用无偏估计，我记得Coursera上Machine Learning课中Andrew Ng曾经提到过，实际编码中其实还是使用有偏估计，因为它们在样本数据很大的时候其实结果没多大影响。

5.数据集的图形化显示：直方图，饼图，线图，柱形图，条形图，茎叶图等

数据分布的差异性描述：平均值，变异性，峰度(kurtosis)，偏度(skewness)

峰值可能有多个，比如双峰或者多峰等。偏度有一个计算公式，由Pearson发明的，他同时也是相关系数的发明者，偏度虽有正负之分，但是绝对值越大说明图形越偏。

$$
SK=\frac{3(\bar{X}-M)}{s},\quad M=Median,\bar{X}=Mean,s=SD
$$

峰度图：

![image](http://hujiaweibujidao.github.io/images/math/kurtosis.png)

偏度图：

![image](http://hujiaweibujidao.github.io/images/math/skewness.png)


6.两个最重要的统计量：期望(Expectation)与方差(Variance)

$E(x)=\Sigma xP(X=x)=\mu \quad Var(x)=E(x-\mu)^{2}=\Sigma (x-\mu)^2P(X=x)=E(x^{2})-(E(x))^{2}$

[注：上面的期望的等式是对于离散型随机变量x，如果是连续型随机变量x，那么$E=\int_{-\infty}^{\infty} xf(x)dx$，同理，方差就是$D=\int_{-\infty}^{\infty} (x-E)^{2}f(x)dx$，期望描述的是数据的集中趋势，方差描述的数据的偏移程度]

线性变换之后的期望与方差：

$E(ax+b)=aE(x)+b \quad Var(ax+b)=a^{2}Var(x)$
$E(ax+by)=aE(x)+bE(y) \quad Var(ax+by)=a^{2}Var(x)+b^{2}Var(y)$

**思考：为什么加上b，方差并没有发生变化呢？**

**因为在变量中增加常数b只是将概率分布移动了一下，分布的形状并没有发生改变，所以b并没有在方差中起到作用。**

相互独立事件X和Y(或者说是随机变量X和Y)：

$E(X+Y)=E(X)+E(Y) \quad Var(X+Y)=Var(X)+Var(Y)$
$E(X-Y)=E(X)-E(Y) \quad Var(X-Y)=Var(X)+Var(Y)$

**思考：为什么$Var(X-Y)=Var(X)+Var(Y)$？**

$Var(X-Y)=E[(X-Y)^{2}]-[E(X-Y)]^{2}=E(X^{2})+E(Y^{2})-2E(X)E(Y)+[E(X)-E(Y)]^{2}=E(X^{2})-[E(X)]^{2}+E(Y^{2})-[E(Y)]^{2}-2E(X)E(Y)+2E(X)E(Y)=Var(X)+Var(Y)$

**记住，一个随机变量减去另一个随机变量得到的概率分布的方差是两个随机变量的方差之和，方差只会增加！**

下面两个图示演示了其结果

![image](http://hujiaweibujidao.github.io/images/math/varxplusy.png)

![image](http://hujiaweibujidao.github.io/images/math/varxminusy.png)

相互独立的随机变量与独立观测值之间的区别：

![image](http://hujiaweibujidao.github.io/images/math/independentobservation.png)

