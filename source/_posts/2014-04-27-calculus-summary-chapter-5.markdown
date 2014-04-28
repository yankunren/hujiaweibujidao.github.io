---
layout: post
title: "CS 5-Definite Integral"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---
###<center>第五部分 定积分及其应用</center>

####第一节 定积分的概念
引例，定积分的概念，定积分的几何意义，定积分的基本性质

为什么会有定积分？定积分最开始是为了解决平面内不规则图形的面积或者不规则物体的体积而提出的实际问题。但是，这个问题直到17世纪牛顿和莱布尼茨发现了微分和积分之间的内在联系之后，提出了计算定积分的基本方法。需要注意的是，定积分并不是直接就建立在不定积分之上的，不是有了不定积分才有了定积分，两者是不同的概念，但是又有内在联系！这个联系就是牛顿-莱布尼茨公式！

不定积分是微分的逆运算，它是函数f(x)的原函数，是由无穷多个函数组成的函数族；而定积分是一个确定的数值，是一种特殊的和的极限(定积分常常使用**分割-近似代替-求和-取极限**的方式来解释)，该数值与积分变量使用的字母无关，即$$\int_{a}^{b} f(x)dx = \int_{a}^{b} f(t)dt $$。

如果函数f(x)在区间(a,b)上连续或者在[a,b]上有界且只有有限个间断点，则函数f(x)在[a,b]上可积。

定积分的几何意义自然就是曲线与坐标轴和代表积分区间的直线围成的曲边梯形的面积。这个面积可正可负，定积分是这些面积的代数和(即有加有减)，如下便有$$\int_{a}^{b}=S1-S2+S3$$。

![image][12]

定积分的性质：$$\int_{a}^{b}f(x)dx=-\int_{b}^{a}f(x)dx, ( a>b )$$

定积分中值定理：函数f(x)在区间[a,b]上连续，则在[a,b]上至少有一点满则$$\int_{a}^{b}f(x)dx=f(\varepsilon)(b-a), a \le \varepsilon \le b$$，这个中值定理(又叫中值公式)和微分中的拉格朗日中值定理的结构很相似，但是几何意义完全不同了，**拉格朗日中值定理指的是微分也就是斜率相等，而定积分中值定理的几何意义指的其实就是面积相等！**如果用物体运动来解释的话，那就是$$f(\varepsilon)$$其实就是物体在a到b的时间段内的平均速度，平均速度乘以运动时间就是总位移了。

![image][13]

####第二节 微积分的基本定理
变速直线运动中位置函数与速度函数之间的联系，积分上限函数及其导数，牛顿一莱布尼兹公式

如果我们用物体的运动来解释定积分的话，那么定积分$$\int_{a}^{b}vdt$$表示的就是物体从时刻a到时刻b内运动的位移。

积分上限函数，这个函数很重要，而且来源有些巧妙，正是这个函数引出了后面的牛顿-莱布尼茨公式。

假设x是区间[a,b]上的任意一点，那么对于区间[a,x]上的定积分$$\int_{a}^{x}f(x)dx$$，因为定积分与积分变量的字母无关，即$$\int_{a}^{x}f(x)dx=\int_{a}^{x}f(t)dt$$，如果积分上限x在区间[a,b]上任意变动的话，那么对于任意一个x，定积分都有一个值对应，所以它在区间[a,b]上定义了一个函数！假设这个函数记为$$\Phi(x)=\int_{a}^{x}f(t)dt, (a \le x \le b)$$，该函数不仅是连续的，而且可导，导数就是f(x)。由此联想下原函数的定义，我们发现一个结论，**一个连续函数f(x)的原函数是存在的，而且这个原函数之一就是它对应的积分上限函数**！这就表明了积分学中的定积分和原函数之间的联系！

在上面的基础之上，便有了牛顿-莱布尼茨公式！它就更加巧妙地找到了定积分的计算和原函数之间的联系，即$$\int_{a}^{b}f(x)dx=F(b)-F(a)$$，**这个公式的意义就是一个连续函数在区间[a,b]上的定积分等于它的任一原函数在该区间上的增量！**

####第三节 定积分的换元法和分部积分法
定积分的换元法，定积分的分部积分法

求定积分方法其实和求不定积分的方法差不多，找到了原函数然后使用牛顿-莱布尼茨公式即可。

####第四节 反常积分
无穷限的反常积分，无界函数的反常积分

反常积分有两类：
一类是指函数是无穷限的，也就是积分区间是从[$$-\infty$$,b]或者从[a,$$+\infty$$]或者从[$$-\infty$$,$$+\infty$$]，即区间包含了无穷，这一类要考虑函数f(x)在无穷限时极限是否存在，如果存在则根据牛顿-莱布尼茨公式即可求解，如果不存在那么反常积分发散；
一类是指函数是无界的，也就是函数f(x)在a的领域内是无界的，也就是趋近$$\pm\infty$$，此时a称为瑕点(无界间断点)，如果极限$$\lim_{t \to a^{+}}\int_{t}^{b}f(x)dx,(t>a)$$存在则根据牛顿-莱布尼茨公式即可求解，否则它就是发散的。

####第五节 定积分的应用
定积分的元素法，定积分的几何应用，定积分的物理应用

定积分的应用自然是和定积分概念引入时一样，主要是为了计算面积和体积。元素法是定积分计算的老办法，也就是四部曲(**分割-近似代替-求和-取极限**)。

面积的计算包括直角坐标和极坐标下两种情况，定积分还可以用来计算旋转体的体积

![image][14]
![image][22]

定积分还可以用来求平面曲线的弧长，例子略过。

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
  
  