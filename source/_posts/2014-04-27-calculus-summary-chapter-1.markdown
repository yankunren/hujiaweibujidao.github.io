---
layout: post
title: "CS 1-Functions and Limits"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---

### <center>第一部分 函数与极限 </center>

####第一节 函数
集合、区间与邻域，函数的概念与性质，反函数与复合函数，初等函数

关于初等函数 [wiki](http://zh.wikipedia.org/wiki/%E5%88%9D%E7%AD%89%E5%87%BD%E6%95%B0)，初等函数在其定义域内都是连续的。

![image][1]

关于指数函数：
对于相等间隔的自变量x的取值，指数函数对应值的比例为常数。由指数运算法则可知，对任意的x，只要给定$$x_{0}>0$$，则$$a^{x+x_{0}}/a^{x}=a^{x_{0}}$$恒成立。此性质可以作为判断两个变量之间的关系是否为指数函数关系的主要依据。此外，这个性质导出了数理统计中的指数分布，在数理统计中我们会看到。

####第二节 函数的极限
数列极限及性质，函数极限及性质，无穷小与无穷大，极限运算法则，极限存在准则和两个重要极限，无穷小的比较

关于收敛数列(极限存在)有两个性质：唯一性和有界性

关于函数极限，注意，$$x \to x_{0}$$的极限是否存在与函数在$$x_{0}$$是否有定义无关。[函数极限的定义][3]

函数极限的几何意义是，当x在领域$$(x_{0}-\delta,x_{0}+\delta)$$内时，函数值y落在下图中$$(A-\varepsilon,A+\varepsilon)$$内。

![image][4]

关于无穷小和无穷大：无穷小并不是指负无穷，而是函数在$$x \to x_{0}$$时的极限为0，无穷小与有解变量的乘积还是无穷小，但是这个性质放在无穷大上面就不成立了！例如，$$\lim_{x \to +\infty} \frac{sinx}{x} = 0$$是无穷小，但是$$\lim_{x \to +\infty} xcosx$$不是无穷小，它不符合无穷小的定义，[关于这个问题的讨论](http://www.guokr.com/post/469944/)，上面仅代表我的理解，不知对否，若有错误请指出。

两个重要的极限：$$\lim_{x \to 0} \frac{sinx}{x} = 1$$ 和 $$\lim_{x \to +\infty} (1+\frac{1}{x})^{x} = e$$

关于极限$$\lim_{x \to 0} \frac{sinx}{x} = 1$$可用下图来解释，圆的边长是1，$$BC=sinx, AD=tanx, \hat{AB}=x$$，在角度很小很小，即$$x \to 0$$时，三者近似相等。

![image][5]

关于极限$$\lim_{x \to \infty} (1+\frac{1}{x})^{x} = e$$ (注意，不论是$$\lim_{x \to +\infty}$$还是$$\lim_{x \to -\infty}$$都成立)它道出了自然对数$$e$$到底是什么！当然还有其他的方式表示出$$e$$，比如按照级数展开的方式，我认为$$e$$是数学界最美丽的符号！$$e \approx 2.71828$$

这两个重要极限一般用于求复杂的函数的极限值。

####第三节 函数的连续性与间断点
函数的连续性，函数的间断点

函数的间断点分为两类：
第一类是函数在$$x=x_{0}$$处间断，但是左右极限都存在，如果左右极限相等的话该间断点称为可去间断点，如果不相等称为跳跃间断点；
其他情况下的间断点都属于第二类间断点。

####第四节 初等函数的连续性
连续函数四则运算的连续性，反函数与复合函数的连续性，初等函数的连续性

只要记住初等函数在它们的定义域内是连续就行了。

####第五节 闭区间上连续函数的性质
最大值和最小值定理，介值定理与零点定理

最大值和最小值定理就是说在闭区间上的连续函数f(x)一定是有上下界的；

介值定理就是说在闭区间上的连续函数f(x)，如果左右端点的取值不同，例如$$f(a)=A,f(b)=B$$，那么区间中肯定有一点的函数值能够取到$$[A,B]$$之间的任何一个值；

零点定理就是说在闭区间上的连续函数f(x)，如果左右端点的取值异号，例如$$f(a)=A>0,f(b)=B<0$$，那么区间中肯定有一点的函数值为0！

  [1]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png
  [2]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png
  [3]: http://hujiaweibujidao.github.io/images/math/fun_limit.png
  [4]: http://hujiaweibujidao.github.io/images/math/funlimit_meaning.png
  [5]: http://hujiaweibujidao.github.io/images/math/sinxoverx.png
  [6]: http://hujiaweibujidao.github.io/images/math/deviration_meaning.png
  

  
  