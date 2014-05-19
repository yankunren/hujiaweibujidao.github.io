---
layout: post
title: "SS 2-Descriptive Statistics"
date: 2014-05-19 19:30
comments: true
categories: math
published: true
---

**<center>统计学那些事 Things of Statistics</center>**
**<center>逸夫图书馆, 2014/5/19</center>**

----------

####<center>第二部分 描述性统计量</center>

1.描述数据的集中趋势：均值(mean)，中位数(median)，众数(mode)，加权平均数

百分位点(percentile points)：中位数(Q2)就是50百分位点，Q1为25百分位点(lower quartile)，Q3为75百分位点(upper quartile)，**经常使用Q3-Q1=IQR(interquartile range，四分差或四分位数)来检查分布是否对称。**

<!--
[如果要计算一组数中的某个百分位数，一般比较好的排序方法是选择排序；当然，如果是计算该组数的特殊的百分位数，例如中位数，有其他更好地方法能够在线性时间内得到，之后我对做一些相关问题的研究，暂且说明一下]
-->

2.描述数据的变异性：极差(range)，标准差(standard deviation,简称s或者SD)，方差(deviation)

标准差的计算公式：
$$
s=\sqrt{\frac{\Sigma(X-\bar{X})^2}{n-1}}
$$

**s是总体标准差的无偏估计，如果根号内部分母改成了n则是有偏估计，详细证明参见：[http://en.wikipedia.org/wiki/Bias_of_an_estimator](http://en.wikipedia.org/wiki/Bias_of_an_estimator)，《爱上统计学》作者对此的解释是统计学家们通常比较保守，保守的含义是，如果我们不得不出错，我们出错也是因为过高地估计了标准差(因为除以n-1使得标准差大于实际值)。**

标准差和方差的异同：**它们都是用来反映数据集的数据的变异性或者离散度的度量，但是标准差以原有的计算单位存在，然而方差以平方单位存在，前者在实际中更加具有意义**。例如，某高校的男生的平均身高是170cm，标准差是5cm，那么说明该校男生的身高与平均身高的差异大概就是上下5cm，换成方差来解释的话就不好陈述了。

使用有偏估计其实也可以，但是最好使用无偏估计，我记得Coursera上Machine Learning课中Andrew Ng曾经提到过，实际编码中其实还是使用有偏估计，因为它们在样本数据很大的时候其实结果没多大影响。

3.数据集的图形化显示：直方图，饼图，线图，柱形图，条形图，茎叶图等

数据分布的差异性描述：平均值，变异性，峰度(kurtosis)，偏度(skewness)

峰值可能有多个，比如双峰或者多峰等。偏度有一个计算公式，由Pearson发明的，他同时也是相关系数的发明者，偏度虽有正负之分，但是绝对值越大说明图形越偏。

$$
SK=\frac{3(\bar{X}-M)}{s},\quad M=Median,\bar{X}=Mean,s=SD
$$

峰度图：

![image](http://hujiaweibujidao.github.io/images/math/kurtosis.png)

偏度图：

![image](http://hujiaweibujidao.github.io/images/math/skewness.png)

4.相关系数(correlation coefficient)是两个变量之间**线性关系**的数值型指标，取值范围是[-1,1]，大于0表示正相关，小于0表示负相关，可以用散点图来直接查看相关性。**根据某些不成文的规则，一般高于0.6表示强相关，低于0.4表示弱相关，中间部分表示中度相关。**

[**Pearson相关系数考察的变量的属性是连续的，例如年龄，体重等，如果是离散型变量那么应该使用点二列相关系数**]

注意两点：

(1)**相关系数反映的是只是线性关系！如果两个变量的相关系数为0，只能说明它们没有线性关系存在，但是可能存在其他的非线性关系！**

(2)**相关性和因果关系无关！**例如，冰淇淋的消费量和犯罪率是正相关的，但是两者不存在任何因果关系！

相关系数的计算：

$$
r_{XY}=\frac{n\Sigma{XY}-\Sigma{X}\Sigma{Y}}{\sqrt{[n\Sigma{X^2}-(\Sigma{X})^2][n\Sigma{Y^2}-(\Sigma{Y})^2]}}
$$

决定系数：相关系数的平方，它表述一个变量的方差可以被另一个变量的方差来解释的百分比。


