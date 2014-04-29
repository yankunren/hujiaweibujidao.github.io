---
layout: post
title: "CS 4-Indefinite Integral"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---

**<center>微积分总结 Summary of Calculus</center>**
**<center>逸夫图书馆, 2014/4/26</center>**

###<center>第四部分 不定积分</center>

####第一节 不定积分的概念与性质
原函数与不定积分的概念，基本积分表，不定积分的性质

连续函数一定有原函数，而且原函数肯定是无穷多个的，它们组成了一个原函数族，这就是不定积分的概念，函数f(x)的不定积分$$\int f(x)dx$$在几何上就表示$$f(x)$$积分曲线族。

积分基本上就是微分的逆运算，所以积分表只要参照常用函数的微分表即可。

####第二节 换元积分法
第一类换元积分法（凑微分法），第二类积分换元法，分部积分法

很多时候被积函数不都是常见的初等函数，遇到复杂的情况我们需要使用其他的方法来计算积分。假设我们要求不定积分$$\int g(x)dx$$

(1)如果我们有一个函数关系$$u=h(x), g=f(u)$$，也就是说，被积函数g(x)是关于u的函数，而u又是关于x的函数，为什么要这么复杂呢？因为g(x)直接积分比较难，但是可以将它看成$$g(x)=f(u)\cdot u'=f[h(x)] \cdot h'(x)$$，那么就有

$$\int g(x)dx= \int f[h(x)] \cdot h'(x)dx= \int f[h(x)]d(h(x))= [\int f(u)du]_{u=h(x)}=F(u)+C$$

这样我们就将对g(x)求积分变成了对$$u=h(x)$$求积分，这就是第一类换元积分法。例如，求$$\int \frac{1}{1+2x}dx$$，令$$u=1+2x$$即可。

(2)如果我们有一个函数关系$$x=h(t)$$，也就是说，第一类换元积分是找一个函数$$u=h(x)$$，利用du和dx的关系将dx替换掉，而第二类是直接找到x关于t的函数，这样$$dx=h'(t)dt$$就可以将dx替换掉了，那么$$\int g(x)dx = [\int g[h(t)]h'(t)dt]_{t=h^{-1}(x)} $$，这种换元积分法就是第二类换元积分法。例如，求$$\int \frac{xdx}{\sqrt{x-3}}$$，令$$t=\sqrt{x-3}$$，即$$x=t^{2}+3$$即可。

分部积分法，如果函数u=u(x)和函数v=v(x)具有连续导数，则有$$\int uv'dx = uv - \int u'vdx$$，通常还简写为$$\int udv = uv - \int vdu$$，这种方法自然常用求两个函数乘积的积分，例如，求$$\int xcosxdx$$。

####第四节 有理函数的积分
有理函数的积分，可化为有理函数的积分举例

有理函数是指两个多项式的商，即形如$$\frac {P(x)}{Q(x)}= \frac {a_{0}x^{n}+a_{1}x^{n-1}+a_{2}x^{n-2}+\dots+a_{n}}{b_{0}x^{m}+b_{1}x^{m-1}+b_{2}x^{m-2}+\dots+b_{m}}$$，若有$$m>n$$则为真分式，否则为假分式。利用多项式的除法，总可以将一个假分式分解成一个多项式和一个真分式的和的形式。任何一个有理真分式都可以分解为以下四类最简分式之和：

$$\frac{A}{x-a}, \frac{A}{(x-a)^n}, \frac{Ax+B}{x^2+px+q}, \frac{Ax+B}{(x^2+px+q)^n} \quad (n \ge 2, p^2-4q < 0)$$

若有理真分式的分母中含有因式$$(x-a)^n$$，那么分式中含有：

$$\frac{A1}{x-a}+\frac{A2}{(x-a)^2}+\dots+\frac{An}{(x-a)^n}$$

若有理真分式的分母中含有因式$$(x+px+q)^n$$，那么分式中含有：

$$\frac{A1}{x+px+q}+\frac{A2}{(x+px+q)^2}+\dots+\frac{An}{(x+px+q)^n}$$

对于系数，可以在确定了最简分式的组合之后利用待定系数就可求出来。


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
  
  