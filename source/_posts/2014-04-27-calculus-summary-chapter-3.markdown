---
layout: post
title: "CS 3-Differential Mean Value Theorems"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---

**<center>微积分总结 Summary of Calculus</center>**
**<center>逸夫图书馆, 2014/4/26</center>**

### <center>第三部分 微分中值定理与导数的应用 </center>

####第一节 微分中值定理
罗尔中值定理，拉格朗日中值定理，泰勒中值定理，柯西中值定理

罗尔中值定理就是说对于在区间$$(a,b)$$上的连续可导函数f(x)，若左右端点的函数值相等，那么区间内至少有一个点满足它的导数为0，即$$f'(\varepsilon)=0, \varepsilon \in (a,b)$$；

拉格朗日中值定理就是说对于在区间$$(a,b)$$上的连续可导函数f(x)，区间内至少有一个点满足$$f'(\varepsilon)=\frac{f(a)-f(b)}{a-b}, \varepsilon \in (a,b)$$，该定理就没有罗尔中值定理的条件那么严格了，所以后者是前者的一个特殊情况。拉格朗日中值定理的几何意义如下，曲线在C点处的切线平行于弦AB；

![image][10]

柯西中值定理就扩展到区间$$(a,b)$$上的两个连续可导函数f(x)和F(x)，区间内至少有一个点满足$$\frac{f'(\varepsilon)}{F'(\varepsilon)}=\frac{f(a)-f(b)}{F(a)-F(b)}, \varepsilon \in (a,b)$$。

当$$F(x)=x$$时，$$F(a)=a,F(b)=b$$，即有$$f(a)-f(b)=f'(\varepsilon)(a-b), \varepsilon \in (a,b)$$，这个式子是不是就是拉格朗日中值定理的内容？

泰勒中值定理略过，和后面泰勒展开式差不多。

####第二节 洛必达法则
0/0型未定式，∞/∞型未定式，其他类型未定式

洛必达法则很重要，因为很多时候我们总是会遇到各种不同特殊形式的未定式，它们的极限可以试试使用洛必达法则来求。

条件略过，简言之就是$$\lim_{x \to x_{0}} \frac{f(x)}{g(x)}=\lim_{x \to x_{0}} \frac{f'(x)}{g'(x)}$$，也就是说我们可以先对分子分母求导然后求极限。

####第三节 函数单调增减性及曲线的凸凹性
函数的单调性，曲线的凹凸性及拐点

驻点：函数f(x)一阶导数为0的点，根据它的正负可以判断函数的单调性，大于0为单调递增；
拐点：函数f(x)二阶导数为0的点，根据它的正负可以判断函数的凹凸性，大于0为凹的；

####第四节 函数的极值与最大值、最小值
极值的定义，极值存在的条件，最大值、最小值

极值存在的条件就是判断该点和该点两边的一阶导数的正负情况。

####第五节 函数图形的描绘
要根据函数的极值和最值以及渐近线来近似绘图

![image][11]



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
  
  