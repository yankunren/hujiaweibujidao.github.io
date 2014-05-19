---
layout: post
title: "SS 3-Discrete Distribution"
date: 2014-05-19 20:00
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第三部分 分布之离散型随机变量分布</center>

1.概率质量函数PMF(Probability Mass Function)

数据集的数据值到它的概率的映射函数。直方图是各个值出现的频数，如果将频数除以样本总数，得到概率，归一化之后的直方图就是PMF。

![image](http://hujiaweibujidao.github.io/images/math/pmf.png)

2.累积分布函数CDF(Cumulative Distribution Function)

数据集的数据值到它在分布中概率的累积值的映射函数。PMF和CDF在国内的教材中并没有这样提过，但是在国外的很多统计书中都有，所以还是比较重要的，拿出来介绍下。

例如，CDF(0) = 0; CDF(1) = 0.2; CDF(2) = 0.6; CDF(3) = 0.8; CDF(4) = 0.8; CDF(5) = 1，它的CDF图为一个阶跃函数：

![image](http://hujiaweibujidao.github.io/images/math/cdf.png)

3.离散型随机变量及其分布律

分布律：离散型随机变量以概率1和一定的规律分布在一些离散值上

![image](http://hujiaweibujidao.github.io/images/math/disc0.png)

(1)0-1分布

随机变量X只有两个取值0和1样本空间只有两个取值也行)，所以叫做0-1分布，它的分布律为
$P(X=0)=p, P(X=1)=q, (q=1-p)$


![image](http://hujiaweibujidao.github.io/images/math/disc_01.png)

(2)二项分布

二项分布的分布律为 $P(X=k)= {n \choose k} p^{k}q^{1-k}$，因为 $P(X=k)$ 刚好是 $(p+q)^{n}$ 的二项式系数，所以这个分布就叫二项分布。二项分布是从n重伯努利试验中得到的分布，伯努利试验是指相互独立的试验，每次试验的结果要么成功要么失败(或者说某个事件要么发生要么不发生)。

![image](http://hujiaweibujidao.github.io/images/math/disc_binomial.png)
![image](http://hujiaweibujidao.github.io/images/math/disc_binomial2.png)

(3)泊松分布

泊松分布是一类很常用的分布，它的分布律有一个参数$\lambda$，参数$\lambda$的含义既是泊松分布的期望，又是它的方差，所以，只要参数$\lambda$或者期望或者方差确定了，泊松分布就确定了。

![image](http://hujiaweibujidao.github.io/images/math/disc_pos.png)
![image](http://hujiaweibujidao.github.io/images/math/disc_pos2.png)
![image](http://hujiaweibujidao.github.io/images/math/disc_pos3.png)

**泊松定理说明当n很大，p很小的时候，以n，p为参数的二项分布可以用参数$\lambda = np $的泊松分布进行近似！**记住这个定理其实也可以方便我们记住泊松分布的分布律。

应用举例，记住后面的结论：

**当$n \ge 20,p \le 0.05$时用泊松分布近似二项分布的概率值近似效果颇佳。**

![image](http://hujiaweibujidao.github.io/images/math/disc_pos4.png)

