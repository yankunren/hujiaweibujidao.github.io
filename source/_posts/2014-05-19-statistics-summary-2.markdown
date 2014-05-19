---
layout: post
title: "SS 2-Distribution"
date: 2014-05-19 20:00
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第二部分 分布</center>

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
$P \{ X=0 \} =p, P \{ X=1 \} =q, (q=1-p)$


![image](http://hujiaweibujidao.github.io/images/math/disc_01.png)

(2)二项分布

二项分布的分布律为 $P \{ X=k \} = $$n \choose k$$ p^{k}q^{1-k}$，因为$P\{X=k\}$刚好是$(p+q)^{n}$的二项式系数，所以这个分布就叫二项分布。二项分布是从n重伯努利试验中得到的分布，伯努利试验是指相互独立的试验，每次试验的结果要么成功要么失败(或者说某个事件要么发生要么不发生)。

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

4.连续性随机变量及其概念密度

连续型随机变量，概率密度及它的性质

函数f(x)是概率密度函数，函数F(x)是分布函数，两者都是连续函数。

![image](http://hujiaweibujidao.github.io/images/math/cont0.png)
![image](http://hujiaweibujidao.github.io/images/math/cont1.png)

关于连续型随机变量X对于任意一个指定实数值k的概率都是0，即$p{X=k}=0$的解释

![image](http://hujiaweibujidao.github.io/images/math/cont2.png)

(1)均匀分布(uniform distribution)

连续型随机变量X在区间(a,b)均匀分布

![image](http://hujiaweibujidao.github.io/images/math/cont_uniform.png)

(2)指数分布(exponential distribution)

指数分布有一个参数$\theta$，它的期望就是$\theta$，方差是$\theta^{2}$，而且它具有**无记忆性**。

![image](http://hujiaweibujidao.github.io/images/math/cont_exp1.png)
![image](http://hujiaweibujidao.github.io/images/math/cont_exp2.png)

《统计思维》对指数分布的解释：举例来说，**观察一系列事件之间的间隔时间，若事件在每个时间点发生的概率相同，那么间隔时间的分布就近似指数分布**(也就是前面的无记忆性)。

指数分布的CDF如下，此时$\lambda=\frac{1}{\theta}$

$$
CDF(x)=1-e^{-\lambda x}
$$

参数$\lambda$决定了指数分布的形状，通常，指数分布的均值是$\frac{1}{\lambda}$，中位数是$\frac{log(2)}{\lambda}$。下图为$\lambda=2$的指数分布图：

![image](http://hujiaweibujidao.github.io/images/math/edcdf.png)

如何判断一个分布是否是指数分布呢？一种办法是画出取对数之后的互补累积分布函数(CCDF=Complementary CDF=1-CDF(x))，CCDF是一条斜率为$-\lambda$的直线，原因如下：

$$
y=CCDF(x)=1-CDF(x)=e^{-\lambda x} \quad => \quad log(y)=-\lambda x
$$

(3)正态分布(normal distribution)

正态分布，又叫高斯分布，是最常用的分布。

![image](http://hujiaweibujidao.github.io/images/math/cont_normal1.png)
![image](http://hujiaweibujidao.github.io/images/math/cont_normal2.png)

关于标准正态分布，即参数为$\mu=0, \sigma=1$的正态分布，它的分布函数值已经制作成表格，可以方便进行查看，其他非标准正态分布可以通过一个线性变换转换成标准正态分布。

![image](http://hujiaweibujidao.github.io/images/math/cont_normal4.png)

在证明其概率密度总和为1时利用了一个重要的积分$\int_{-\infty}^{\infty} e^{\frac{t^{2}}{2}} dt = \sqrt{2 \pi}$，它的证明可以转换成二重积分然后通过极坐标计算出来。完整详细的证明可以参考下面：

![image](http://hujiaweibujidao.github.io/images/math/inte1.png)
![image](http://hujiaweibujidao.github.io/images/math/inte2.png)

《统计思维》对正态分布的解释：对于正态分布的CDF还没有一种准确的表达，最常用的一种形式是以误差函数(error function)来表示，它是一个特殊的函数，表示为erf(x)，在Matlab中内置了函数`erf`，对它的说明为erf函数是对参数为$\mu=0, \sigma=\frac{1}{2}$的正态分布的二重积分，有兴趣可以去计算一下，得到的结果如下：

$$
CDF(x)=\frac{1}{2}[1+erf(\frac{x-\mu}{\sigma \sqrt{2}})] \quad erf(x)=\frac{2}{\sqrt{\pi}}\int_{0}^{x}e^{-t^{2}}dt
$$

其中，参数$\mu$和$\sigma$分别决定了正态分布的均值和标准差。下图为$\mu=2.0$和$\sigma=0.5$的正态分布的CDF图：

![image](http://hujiaweibujidao.github.io/images/math/ndcdf.png)

根据大数定理，当我们处理大样本数据集(超过30个数据)，并且重复地从总体中抽取样本时，得到的数值分布就接近正态分布曲线。正态分布以均值为中心完全对称。

关于正态分布有一个重要的结论，对任何数值分布来说(不论它的均值和标准差)，只要数值是正态分布，那么几乎100%的数值都分布在均值的-3到3个标准差之间。下面是正态曲线下数值的分布情况：

<!--
![image](http://hujiaweibujidao.github.io/images/math/nd.png)
-->

![image](http://hujiaweibujidao.github.io/images/math/cont_normal3.png)

从中可以看出，**在距离均值1个标准差之间大概有34%的数值分布，在1个标准差和2个标准差之间大概有13%的数值分布，在2个标准差和3个标准差之间大概有2.1%的数值分布。**

通过这个图我么可以得到一个经典的**3$\sigma$法则**，又叫**68-95-99法则**

**在$(\mu - \sigma, \mu + \sigma)$之间大概有68.26%的数据分布，在$(\mu - 2\sigma, \mu + 2\sigma)$之间大概有95.44%的数据分布，在$(\mu - 3\sigma, \mu + 3\sigma)$之间大概有99.74%的数据分布。**

[对数正态分布 on wiki](http://wikipedia.org/wiki/Log-normal_distribution)：如果一组数据取对数之后服从正态分布，那么我们就称其服从对数正态分布。对数正态分布的 CDF 跟正态分布一样, 只是用 logx 代替原来的 x:

$$
CDF_{lognormal}(x) = CDF_{normal}(log x)
$$

对数正态分布的均值与标准差不再是是$\mu$和$\sigma$了。可以证明，成人体重的分布是近似对数正态的。

