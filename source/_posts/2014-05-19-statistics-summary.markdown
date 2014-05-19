---
layout: post
title: "SS-Statistics Summary"
date: 2014-05-19 18:00
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>**第零部分 碎碎念**</center>
本文是对概率和数理统计中的重要内容的一个小总结，不会侧重很多众所周知的细节，所以有啥疑问还是需要Google或者Wikipedia。关于本文中出现的术语参照参考书籍中的定义，部分可能与大学教材中不同，请自行对应起来理解。小弟才疏学浅，若有错误请留言，欢迎指正。

主要参考书籍：

1.[《爱上统计学》](http://book.douban.com/subject/2985995/)

2.[《深入浅出统计学》](http://book.douban.com/subject/7056708/)

3.[《统计思维：程序员数学之概率统计》](http://book.douban.com/subject/24381562/)



####<center>**第一部分 概率**</center>
1.事件：对立事件(complementary event)，互斥事件(exclusive event)，相交事件(intersecting event)，相关事件(dependent event)，独立事件(independent event)，可以使用韦恩图(Venn Diagram)方便分析事件之间的关系。

如果事件A和B会相互影响，那么它们是相关事件，否则是独立事件。
事件A和B独立：$P(A|B)=P(A) \quad P(A \cap B)=P(A)P(B)$

2.概率：条件概率(Conditional Probability)，全概率(Total Probability)，贝叶斯定理(Bayes' Theorem)

条件概率：$P(A|B)=\frac{P(A \cap B)}{P(B)}$

全概率：$P(B)=P(B|A)P(A)+P(B|A')P(A')$

贝叶斯定理(将条件概率和全概率整合到一起)：$P(A|B)=\frac{P(A \cap B)}{P(B|A)P(A)+P(B|A')P(A')}$

3.期望(Expectation)与方差(Variance)

$E(x)=\Sigma xP(X=x) \quad Var(x)=E(x-\mu)^{2}=\Sigma (x-\mu)^2P(X=x)=E(x^{2})-(E(x))^{2}$

线性变换之后的期望与方差：

$E(ax+b)=aE(x)+b \quad Var(ax+b)=a^{2}Var(x)$
$E(ax+by)=aE(x)+bE(y) \quad Var(ax+by)=a^{2}Var(x)+b^{2}Var(y)$

**思考：为什么加上b方差并没有发生变化呢？因为在变量中增加常数b只是将概率分布移动了一下，分布的形状并没有发生改变，所以b并没有在方差中起到作用。**

相互独立事件X和Y：

$E(X+Y)=E(X)+E(Y) \quad Var(X+Y)=Var(X)+Var(Y)$
$E(X-Y)=E(X)-E(Y) \quad Var(X-Y)=Var(X)+Var(Y)$

**思考：为什么$Var(X-Y)=Var(X)+Var(Y)$？可以随便拿数据验证之。**
**记住，一个随机变量减去另一个随机变量得到的概率分布的方差是两个随机变量的方差之和，方差只会增加！**

下面两个图示演示了其结果

![image](/images/math/varxplusy.png)

![image](/images/math/varxminusy.png)

相互独立的随机变量与独立观测值之间的区别：

![image](/images/math/independentobservation.png)

####<center>**第二部分 分布**</center>

1.概率质量函数PMF(Probability Mass Function)：数据集中数据值到它的概率的映射函数。直方图是各个值出现的频数，如果将频数除以样本总数，得到概率，归一化之后的直方图就是PMF。

![image](/images/math/pmf.png)

2.累积分布函数CDF(Cumulative Distribution Function)：数据集中数据值到它在分布中概率的累积值的映射函数。例如，
CDF(0) = 0; CDF(1) = 0.2; CDF(2) = 0.6; CDF(3) = 0.8; CDF(4) = 0.8; CDF(5) = 1，它的CDF图为一个阶跃函数：

![image](/images/math/cdf.png)

3.指数分布(exponential distribution)：一种连续分布。举例来说，**观察一系列事件之间的间隔时间，若事件在每个时间点发生的概率相同，那么间隔时间的分布就近似指数分布**。指数分布的CDF如下：

$$
CDF(x)=1-e^{-\lambda x}
$$

参数$\lambda$决定了指数分布的形状，通常，指数分布的均值是$\frac{1}{\lambda}$，中位数是$\frac{log(2)}{\lambda}$。下图为$\lambda=2$的指数分布图：

![image](/images/math/edcdf.png)

如果判断一个分布是否是指数分布呢？一种办法是画出取对数之后的互补累积分布函数(CCDF=Complementary CDF=1-CDF(x))，CCDF是一条斜率为$-\lambda$的直线，原因如下：

$$
y=CCDF(x)=1-CDF(x)=e^{-\lambda x} \quad => \quad log(y)=-\lambda x
$$

4.正态分布(Normal Distribution)：又叫高斯分布，是最常用的分布。对于正态分布的CDF还没有一种准确的表达，最常用的一种形式是以误差函数(error function)来表示，它是一个特殊的函数，表示为erf(x)：

$$
CDF(x)=\frac{1}{2}[1+erf(\frac{x-\mu}{\sigma \sqrt{2}})] \quad erf(x)=\frac{2}{\sqrt{\pi}}\int_{0}^{x}e^{-r^{2}}dt
$$

其中，参数$\mu$和$\sigma$分别决定了正态分布的均值和标准差。下图为$\mu=2.0$和$\sigma=0.5$的正态分布的CDF图：

![image](/images/math/ndcdf.png)

根据大数定理，当我们处理大样本数据集(超过30个数据)，并且重复地从总体中抽取样本时，得到的数值分布就接近正态分布曲线。正态分布以均值为中心完全对称。

关于正态分布有一个重要的结论，对任何数值分布来说(不论它的均值和标准差)，只要数值是正态分布，那么几乎100%的数值都分布在均值的-3到3个标准差之间。下面是正态曲线下数值的分布情况：

![image](/images/math/nd.png)

从中可以看出，在均值与1个标准差之间大概有34%的数值分布，在1个标准差和2个标准差之间大概有13%的数值分布，在2个标准差和3个标准差之间大概有2.1%的数值分布。

[对数正态分布](http://wikipedia.org/wiki/Log-normal_distribution)：如果一组数据取对数之后服从正态分布，那么我们就称其服从对数正态分布。对数正态分布的 CDF 跟正态分布一样, 只是用 logx 代替原来的 x:

$$
CDF_{lognormal}(x) = CDF_{normal}(log x)
$$

对数正态分布的均值与标准差不再是是$\mu$和$\sigma$了。可以证明,成人体重的分布是近似对数正态的。


####<center>**第三部分 描述性统计量**</center>

1.描述数据的集中趋势：均值(mean)，中位数(median)，众数(mode)，加权平均数

百分位点(percentile points)：中位数(Q2)就是50百分位点，Q1为25百分位点(lower quartile)，Q3为75百分位点(upper quartile)，经常使用Q3-Q1=IQR(interquartile range，四分差或四分位数)来检查分布是否对称。

[如果要计算一组数中的某个百分位数，一般比较好的排序方法是选择排序；当然，如果是计算该组数的特殊的百分位数，例如中位数，有其他更好地方法能够在线性时间内得到，之后我对做一些相关问题的研究，暂且说明一下]

2.描述数据的变异性：极差(range)，标准差(standard deviation,简称s或者SD)，方差(deviation)

标准差的计算公式：
$$
s=\sqrt{\frac{\Sigma(X-\bar{X})^2}{n-1}}
$$

**s是总体标准差的无偏估计，如果根号内部分母改成了n则是有偏估计**，详细证明参见：[http://en.wikipedia.org/wiki/Bias_of_an_estimator](http://en.wikipedia.org/wiki/Bias_of_an_estimator)

标准差和方差的异同：**它们都是用来反映数据集中数据的变异性或者离散度的度量，但是标准差以原有的计算单位存在，然而方差以平方单位存在，前者在实际中更加具有意义**。例如，某高校的男生的平均身高是170cm，标准差是5cm，那么说明该校男生的身高与均值的差异大概就是5cm，换成方差来解释的话就不好陈述了。

使用有偏估计其实也可，但是最好使用无偏估计，我记得Coursera Machine Learning课中Andrew Ng曾经提到过，实际编码中其实还是使用有偏估计，因为它们在样本数据很大的时候其实结果没多大影响。

3.数据集的图形化显示：直方图，饼图，线图，柱形图，条形图，茎叶图等

数据分布的差异性描述：平均值，变异性，峰度(kurtosis)，偏度(skewness)

峰值可能有多个，比如双峰或者多峰等。偏度有一个计算公式，由Pearson发明的，他同时也是相关系数的发明者，偏度虽有正负之分，但是绝对值越大说明图形越偏。

$$
SK=\frac{3(\bar{X}-M)}{s},\quad M=Median,\bar{X}=Mean,s=SD
$$

4.相关系数(correlation coefficient)是两个变量之间**线性关系**的数值型指标，取值范围是[-1,1]，大于0表示正相关，小于0表示负相关，可以用散点图来直接查看相关性。根据某些不成文的规则，一般高于0.6表示强相关，低于0.4表示弱相关，中间部分表示中度相关。

[**Pearson相关系数考察的变量的属性是连续的，例如年龄，体重等，如果是离散型变量那么应该使用点二列相关系数**]

注意两点：(1)**相关系数反映的是只是线性关系！如果两个变量的相关系数为0，只能说明它们没有线性关系存在，但是可能存在其他的非线性关系！**
(2)**相关性和因果关系无关！**例如，冰淇淋的消费量和犯罪率是正相关的，但是两者不存在任何因果关系！

相关系数的计算：

$$
r_{XY}=\frac{n\Sigma{XY}-\Sigma{X}\Sigma{Y}}{\sqrt{[n\Sigma{X^2}-(\Sigma{X})^2][n\Sigma{Y^2}-(\Sigma{Y})^2]}}
$$

决定系数：相关系数的平方，它表述一个变量的方差可以被另一个变量的方差来解释的百分比。


####<center>**第四部分 假设检验**</center>

1.假设：一般假设就是一个“猜想”，它表述问题的一般陈述。假设检验是用于样本，然后才将结论一般化推广到总体中。

2.零假设(null hypothesis=$H_{0}$，或叫原假设)：它一般表示“正在研究的两个变量无关或者没有差异”这样的命题。例如，三年级学生的记忆力考试成绩与四年级学生记忆力考试成绩之间没有差异。

**(1)零假设是研究的起点，因为在没有信息的情况下，零假设就被看作是可以接受的真实状态。在这种假设下，我们认为观测到的效应是由偶然因素造成的。**
**(2)零假设也是研究的基准，也就是说在零假设成立的情况下，计算统计量，然后进行假设检验。这就类似反证法的思想。**

3.研究假设(research hypothesis=alternate hypothesis，或叫备择假设)：与零假设相对立的，认为变量之间有关系的假设。

研究假设分为有方向和无方向两种研究假设。无方向研究假设命题例子：三年级学生的记忆力考试成绩与四年级学生记忆力考试成绩之间有差异。有方向研究假设命题例子：三年级学生的记忆力考试成绩低于四年级学生记忆力考试成绩。

讨论有无方向的另一种形式是讨论单尾检验(one-tailed test)和双尾检验(two-tailed test)。

零假设与研究假设的区别：
(1)零假设表示两个变量没有差异或者没有关系，研究假设表示它们有关系或者有差异；
(2)零假设对应的是总体，而研究假设对应的是样本。我们是从总体中取出一部分样本进行检验，将得到的结论推广到总体中。
(3)因为总体不能直接检验(不现实，不经济或者不可能)，所以零假设只能间接检验，研究假设则可以直接检验。



<!-- footnots -->

