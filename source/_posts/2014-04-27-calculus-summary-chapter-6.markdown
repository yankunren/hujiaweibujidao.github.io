---
layout: post
title: "CS 6-Infinite Series"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---
###<center>第六部分 无穷级数</center>

####第一节 常数项级数的概念与基本性质
常数项级数的概念，常数项级数的基本性质

无穷级数的思想来源于近似计算圆面积这个问题，考虑用内接正方形来近似计算。

![image][15]

数列{$$u_{n}$$}的元素之和得到的表达式$$u_{1}+u_{2}+\cdots+u_{n}+\cdots$$就叫做(常数项)(无穷)级数，其前n项之和又可以组成一个新的数列{$$s_{n}$$}，即$$s_{n}=\Sigma_{i=1}^{n}u_{i}$$，一般项$$s_{n}$$称为部分和。

如果部分和数列{$$s_{n}$$}有极限，那么这个无穷级数$$u_{n}=\Sigma_{i=1}^{n}u_{i}$$就是收敛的，极限s就叫做这个无穷级数的和。

级数收敛的必要条件是它的一般项$$u_{n}$$趋近于0，但不是充分条件！比如，调和级数$$1+\frac{1}{2}+\frac{1}{3}+\frac{1}{4}+\cdots+\frac{1}{n}+\cdots$$的一般项$$u_{n}=\frac{1}{n}$$也是趋近于0的，但是调和级数是发散的，采用反证法即可证明得到，证明如下，$$s_{2n}-s{n}>\frac{1}{2}$$并不趋近于0，所以不收敛。

![image][21]

####第二节 常数项级数敛散性的判别方法
正项级数及其敛散性的判别方法，交错级数及其敛散性的判别方法，绝对收敛与条件收敛

正项级数$$u_{n}=\Sigma_{i=1}^{n}u_{i}$$收敛的充分必要条件是它的部分和数列{$$s_{n}$$}有界。

比值审敛法，对于正项级数$$u_{n}=\Sigma_{i=1}^{n}u_{i}$$，若$$\lim_{n\to \infty}\frac{u_{n+1}}{u_{n}}=\beta$$，当$$\beta>1$$时级数发散，当$$\beta<1$$时级数收敛，当$$\beta=1$$时级数可能发散可能收敛。

还有其他的一些判断级数收敛的方法，略过。

####第三节 幂级数
函数项级数的基本概念，幂级数及其敛散性，幂级数的运算，函数展开成幂级数，幂级数在近似计算中的应用

函数项级数就是定义在某个区间上的函数族之和，表达式类似$$u_{1}(x)+u_{2}(x)+u_{3}(x)+\cdots+u_{n}(x)+\cdots$$，对于某个确定的值$$x=x_{0}$$，函数项级数$$u_{1}(x_{0})+u_{2}(x_{0})+u_{3}(x_{0})+\cdots+u_{n}(x_{0})+\cdots$$就变成常数项级数，如果该常数项级数收敛的话，那么点$$x_{0}$$就是函数项级数在定义区间上的一个收敛点，所有收敛点就组成了收敛域。

幂级数就是最常用的一类函数项级数，它的形式如下：

$$\Sigma_{n=0}^{\infty}a_{n}x^{n}=a_{0}x^{0}+a_{1}x^{1}+\cdots+a_{n}x^{n}+\cdots$$

一种判断幂级数收敛的办法是阿贝尔定理，如果级数$$\Sigma_{n=0}^{\infty}a_{n}x^{n}$$当$$x=x_{0}(x_{0} \ne 0)$$时收敛，那么对于开区间$$(-\|x_{0}\|,\|x_{0}\|)$$内的任何x都有幂级数收敛，反之，如果当$$x=x_{0}(x_{0} \ne 0)$$时发散，那么对于闭区间$$[-\|x_{0}\|,\|x_{0}\|]$$外的任何x都有幂级数发散。其实就是对于幂级数的收敛半径R内部任意x都收敛，外部都发散！

许多应用中，我们都希望知道如何将一个给定的函数f(x)展开成幂级数的形式，这样相当于对函数进行近似了，可以大大简化计算量，于是便有了泰勒级数！

![image][16]

特别地，当$$x_{0}=0$$时泰勒级数又叫麦克劳林级数，展开式称为麦克劳林展开式

$$f(x)=\Sigma_{n=0}^{n}\frac{1}{n!}f^{n}(0)x^{n}$$

将函数展开成幂级数的步骤：

![image][17]
![image][18]

例如，对于函数$$e^{x}$$幂级数展开

![image][19]

常用的幂级数：

![image][20]


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
  
  