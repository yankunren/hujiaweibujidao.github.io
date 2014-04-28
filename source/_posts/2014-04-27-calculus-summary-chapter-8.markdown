---
layout: post
title: "CS 8-Multivariable Differential Calculus"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---
### <center>第八部分 多元函数微分法及其应用</center>

####第一节 多元函数的基本概念
平面点集、n维空间，多元函数的概念，二元函数的极限，二元函数的连续

将前面的一元函数的知识扩展下就知道了。

二元函数的极限称为二重极限，二重极限的存在是指$$P(x,y)$$以任何方式趋近$$P_{0}(x_{0},y_{0})$$(有别于在一元函数中只有从左边或者从右边趋近两种方式)，如果不同方式趋近时的极限值不同的话，说明二重极限不存在！

####第二节 偏导数
偏导数的定义及其计算方法，二元函数偏导数的几何意义，高阶偏导数

在多元微分学中，自变量多了，所以导数变成偏导数了。对于二元函数偏导数的几何意义如下，也是斜率，但是要看如何过该点确定曲面的切线以及切线是对哪个轴的斜率！

![image][43]

高阶偏导数和前面的高阶导数类似，但是因为自变量多了，也就多了个混合偏导数，对于连续函数$$z=f(x,y)$$，在其连续区域内，两个二阶混合偏导数相等！

![image][44]

####第三节 全微分
全微分的定义，可微、偏导数及连续之间的关系，全微分在近似计算中的应用

在多元微分学中对于某一个变量的微分叫做偏微分，对全部变量的微分就扩展成了全微分的概念，同样，多元函数微分学中微分的意义也是希望使用自变量的线性函数来近似代替函数的全增量$$\vartriangle z$$。

![image][45]

全微分同样可以用于近似计算。

####第四节 多元复合函数和隐函数的求导法则
多元复合函数的求导法则，隐函数求导法则

多元复合函数的求导可以使用“链式法则”，即**“分段相乘，分叉相加，单路全导，叉路偏导”**！

![image][46]

对应上面两种情况下的“链式图”如下，第一种情况，z到x和y是分叉，分叉相加，z到x到t是分段，分段相乘，x到t是单路，单路全导；第二种情况，z到u和v是分叉，分叉相加，z到u到x是分段，分段相乘，u到t是叉路，叉路偏导！

![image][47]

隐函数求导是很重要的一部分，因为在实际应用中，很多时候得到的都是一个隐函数，并没有具体的函数表达式，对于它的求导有下面三个存在定理。

![image][48]
![image][49]
![image][50]
![image][51]
![image][52]

最后的雅可比式比较重要，在数值分析中有相应的应用，理解它和行列式之间的关系，详情可看[行列式 on wiki](http://zh.wikipedia.org/wiki/%E8%A1%8C%E5%88%97%E5%BC%8F)。[雅可比矩阵 on wiki](http://zh.wikipedia.org/wiki/%E9%9B%85%E5%8F%AF%E6%AF%94%E7%9F%A9%E9%98%B5)

####第五节 偏导数的几何应用
空间曲线的切线与法平面，曲面切平面与法线

空间曲线的切线需要得到该点的各个方向的偏导数，法平面是过该点并垂直于切线的平面。

![image][53]

曲面的切平面与法线略过。

####第六节 多元函数的极值及其最值
极值的定义，极值存在的条件，最大值与最小值，拉格朗日乘数法

条件极值问题转化成无条件极值问题，使用拉格朗日乘数法，这是一个非常重要的解决条件极值问题的方法，在机器学习的很多算法中使用这种方法，比如Fisher判别等等。

![image][54]
![image][55]

####补充节 方向导数和梯度

方向导数：很多时候我们想知道函数沿着某个方向的变化率，这个方向不一定是坐标轴方向。
![image][63]
![image][64]

梯度：梯度就是一个向量，表示曲线上某点沿着曲线的某个方向发生移动的向量。梯度的应用自然是梯度下降法，该方法可以让我们的优化问题的极值函数尽快地趋近问题的最优解。

这里还有等值线和等值面的概念，对于二元函数$$f(x,y)$$可以得到其对应的等值线$$f(x,y)=c$$，函数在某一点的梯度方向就是等值线在该点的法线方向。

还要理解梯度和方向导数之间的关系，如果梯度的方向与方向导数取得最大值的方向相同的话，那么该方向就是函数变化最快的方向。

![image][56]
![image][57]
![image][58]
![image][59]
![image][60]
![image][61]
![image][62]


  [1]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png
  [2]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png
  [3]: http://hujiaweibujidao.github.io/images/math/fun_limit.png
  [4]: http://hujiaweibujidao.github.io/images/math/funlimit_meaning.png
  [5]: http://hujiaweibujidao.github.io/images/math/sinxoverx.png
  [6]: http://hujiaweibujidao.github.io/images/math/deviration_meaning.png
  [7]: http://hujiaweibujidao.github.io/images/math/deviration.png
  [8]: http://hujiaweibujidao.github.io/images/math/weifen.png
  [9]: http://hujiaweibujidao.github.io/images/math/weifen_meaning.png
  [10]: http://hujiaweibujidao.github.io/images/math/langrant.png
  [11]: http://hujiaweibujidao.github.io/images/math/fun_figure.png
  [12]: http://hujiaweibujidao.github.io/images/math/dingjifen.png
  [13]: http://hujiaweibujidao.github.io/images/math/jifen_midvalue.png
  [14]: http://hujiaweibujidao.github.io/images/math/dingjifen_area.png
  [15]: http://hujiaweibujidao.github.io/images/math/infty_round.png
  [16]: http://hujiaweibujidao.github.io/images/math/tylor_serials.png
  [17]: http://hujiaweibujidao.github.io/images/math/miseries1.png
  [18]: http://hujiaweibujidao.github.io/images/math/miseries2.png
  [19]: http://hujiaweibujidao.github.io/images/math/ex.png
  [20]: http://hujiaweibujidao.github.io/images/math/common_series.png
  [21]: http://hujiaweibujidao.github.io/images/math/tiaohe_series.png
  [22]: http://hujiaweibujidao.github.io/images/math/xuanzhuanti.png
  [23]: http://hujiaweibujidao.github.io/images/math/fangxiangjiao1.png
  [24]: http://hujiaweibujidao.github.io/images/math/fangxiangjiao2.png
  [25]: http://hujiaweibujidao.github.io/images/math/touying1.png
  [26]: http://hujiaweibujidao.github.io/images/math/touying2.png
  [27]: http://hujiaweibujidao.github.io/images/math/shuliangji1.png
  [28]: http://hujiaweibujidao.github.io/images/math/shuliangji2.png
  [29]: http://hujiaweibujidao.github.io/images/math/line1.png
  [30]: http://hujiaweibujidao.github.io/images/math/line2.png
  [31]: http://hujiaweibujidao.github.io/images/math/lineangle.png
  [32]: http://hujiaweibujidao.github.io/images/math/linespaceangle.png
  [33]: http://hujiaweibujidao.github.io/images/math/space1.png
  [34]: http://hujiaweibujidao.github.io/images/math/space2.png
  [35]: http://hujiaweibujidao.github.io/images/math/spaceline1.png
  [36]: http://hujiaweibujidao.github.io/images/math/spaceline2.png
  [37]: http://hujiaweibujidao.github.io/images/math/spaceangle.png
  [38]: http://hujiaweibujidao.github.io/images/math/qumian.png
  [39]: http://hujiaweibujidao.github.io/images/math/xuanzhuanqumian.png
  [40]: http://hujiaweibujidao.github.io/images/math/zhumian.png
  [41]: http://hujiaweibujidao.github.io/images/math/space1.png
  [42]: http://hujiaweibujidao.github.io/images/math/space2.png
  [43]: http://hujiaweibujidao.github.io/images/math/piandaoshu.png
  [44]: http://hujiaweibujidao.github.io/images/math/gaojipiandaoshu.png
  [45]: http://hujiaweibujidao.github.io/images/math/quanweifen.png
  [46]: http://hujiaweibujidao.github.io/images/math/chainrule.png
  [47]: http://hujiaweibujidao.github.io/images/math/chainrulefig.png
  [48]: http://hujiaweibujidao.github.io/images/math/yinfun1.png
  [49]: http://hujiaweibujidao.github.io/images/math/yinfun2.png
  [50]: http://hujiaweibujidao.github.io/images/math/yinfun3.png
  [51]: http://hujiaweibujidao.github.io/images/math/yinfun4.png
  [52]: http://hujiaweibujidao.github.io/images/math/yinfun5.png
  [53]: http://hujiaweibujidao.github.io/images/math/spaceline_qiexian.png
  [54]: http://hujiaweibujidao.github.io/images/math/lagerang1.png
  [55]: http://hujiaweibujidao.github.io/images/math/lagerang2.png
  [56]: http://hujiaweibujidao.github.io/images/math/tidu1.png
  [57]: http://hujiaweibujidao.github.io/images/math/tidu2.png
  [58]: http://hujiaweibujidao.github.io/images/math/tidu3.png
  [59]: http://hujiaweibujidao.github.io/images/math/tidu4.png
  [60]: http://hujiaweibujidao.github.io/images/math/tidu5.png
  [61]: http://hujiaweibujidao.github.io/images/math/tidu6.png
  [62]: http://hujiaweibujidao.github.io/images/math/tidu7.png
  [63]: http://hujiaweibujidao.github.io/images/math/fangxiangdaoshu1.png
  [64]: http://hujiaweibujidao.github.io/images/math/fangxiangdaoshu2.png
  [65]: http://hujiaweibujidao.github.io/images/math/erchongjifen.png
  [66]: http://hujiaweibujidao.github.io/images/math/erchongjifen2.png
  [67]: http://hujiaweibujidao.github.io/images/math/erchongjifen3.png
  [68]: http://hujiaweibujidao.github.io/images/math/erchongjifen4.png
  [69]: http://hujiaweibujidao.github.io/images/math/chuzhi.png
  [70]: http://hujiaweibujidao.github.io/images/math/fenlibianliang1.png
  [71]: http://hujiaweibujidao.github.io/images/math/fenlibianliang2.png
  [72]: http://hujiaweibujidao.github.io/images/math/qici1.png
  [73]: http://hujiaweibujidao.github.io/images/math/qici2.png
  [74]: http://hujiaweibujidao.github.io/images/math/qici3.png
  [75]: http://hujiaweibujidao.github.io/images/math/xianxing1.png
  [76]: http://hujiaweibujidao.github.io/images/math/xianxing2.png
  [77]: http://hujiaweibujidao.github.io/images/math/xianxing3.png
  [78]: http://hujiaweibujidao.github.io/images/math/xianxing4.png
  [79]: http://hujiaweibujidao.github.io/images/math/bonuli1.png
  [80]: http://hujiaweibujidao.github.io/images/math/bonuli2.png
  [81]: http://hujiaweibujidao.github.io/images/math/bonuli3.png
  
  