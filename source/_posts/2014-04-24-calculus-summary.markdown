---
layout: post
title: "Calculus Summary"
date: 2014-04-24 08:40
comments: true
categories: math
published: false
---
<script type="text/javascript" src="https://stackedit.io/libs/MathJax/MathJax.js?config=TeX-AMS_HTML"></script>

## <center>微积分总结</center>

[TOC]

### <center>第零部分 碎碎念</center>

到了研究生阶段才意识到本科的数学原来作用这么大，不论是在数据挖掘，还是机器学习，亦或是模式识别，数学都是基础中的基础。于是乎，我在逸夫图书馆泡了几天看了些微积分、线代和数理统计的书籍，写下三份总结，记录下重要的知识，以备后忘。本人才疏学浅，若有错误之处还请指出，让我“增长”，若有不足也请指出，使我“完备”，谢谢！:-)

**[注：这些总结不会详细地讲解所有概念，只是挑选一些我个人感觉比较有用的知识点进行总结，很多时候可能只是列举知识点，并无解释，忘记了的可以自行Wiki或者翻书，另外，为了节省写作时间，我剪切粘贴了很多图片...嗯，就是这样...]**

参考书籍：

1.[同济大学 高等数学 高等教育出版社](http://book.douban.com/subject/2112359/)

2.[高等数学 中国环境出版社](http://product.dangdang.com/23311529.html)

### <center>第一部分 函数与极限 </center>

####第一节 函数
集合、区间与邻域，函数的概念与性质，反函数与复合函数，初等函数

关于[初等函数 on wiki](http://zh.wikipedia.org/wiki/%E5%88%9D%E7%AD%89%E5%87%BD%E6%95%B0)，初等函数在其定义域内都是连续的。

![image][1]

关于指数函数：
对于相等间隔的自变量x的取值，指数函数对应值的比例为常数。由指数运算法则可知，对任意的x，只要给定$x_{0}>0$，则$a^{x+x_{0}}/a^{x}=a^{x_{0}}$恒成立。此性质可以作为判断两个变量之间的关系是否为指数函数关系的主要依据。此外，这个性质导出了数理统计中的指数分布。

####第二节 函数的极限
数列极限及性质，函数极限及性质，无穷小与无穷大，极限运算法则，极限存在准则和两个重要极限，无穷小的比较

关于收敛数列(极限存在)有两个性质：唯一性和有界性

关于函数极限，注意，$x \to x{0}$的极限是否存在与函数在$x_{0}$是否有定义无关。[函数极限的定义][3]

<!--![image](http://hujiaweibujidao.github.io/images/math/elementalfuns.png)-->

函数极限的几何意义是，当x在领域$(x_{0}-\delta,x_{0}+\delta)$内时，函数值y落在下图中$(A-\varepsilon,A+\varepsilon)$内。

![function limit meaning][4]

关于无穷小和无穷大：无穷小并不是指负无穷，而是函数在$x \to x{0}$时的极限为0，无穷小与有解变量的乘积还是无穷小，但是这个性质放在无穷大上面就不成立！例如，$\lim_{x \to +\infty} \frac{sinx}{x} = 0$是无穷小，但是$\lim_{x \to +\infty} xcosx$不是无穷小，它不符合无穷小的定义，[关于这个问题的讨论](http://www.guokr.com/post/469944/)。

两个重要的极限：$\lim_{x \to 0} \frac{sinx}{x} = 1$ 和 $\lim_{x \to +\infty} (1+\frac{1}{x})^{x} = e$

关于极限$\lim_{x \to 0} \frac{sinx}{x} = 1$可用下图来解释，圆的边长是1，$BC=sinx, AD=tanx, \hat{AB}=x$，在$x \to 0$时，三者近似相等。

![sinx over x][5]

关于极限$\lim_{x \to \infty} (1+\frac{1}{x})^{x} = e$，注意，不论是$\lim_{x \to +\infty}$还是$\lim_{x \to -\infty}$都成立，它道出了自然对数$e$到底是什么！当然还有其他的方式表示出$e$，比如级数的方式，我认为$e$是数学界最美丽的符号！$e \approx 2.71828$

####第三节 函数的连续性与间断点
函数的连续性，函数的间断点

函数的间断点分为两类：第一类是函数在$x=x_{0}$处间断，但是左右极限都存在，如果左右极限相等的话该间断点称为可去间断点，如果不相等称为跳跃间断点；其他情况下的间断点都属于第二类间断点。

####第四节 初等函数的连续性
连续函数四则运算的连续性，反函数与复合函数的连续性，初等函数的连续性

####第五节 闭区间上连续函数的性质
最大值和最小值定理，介值定理与零点定理

最大值和最小值定理就是说在闭区间上的连续函数f(x)一定是有上下界的；

介值定理就是说在闭区间上的连续函数f(x)，如果左右端点的取值不同，例如$f(a)=A,f(b)=B$，那么区间中肯定有一点的函数值能够取到$[A,B]$之间的任何一个值！

零点定理就是说在闭区间上的连续函数f(x)，如果左右端点的取值异号，例如$f(a)=A>0,f(b)=B<0$，那么区间中肯定有一点的函数值为0！

###<center>第二部分 导数与微分</center>

####第一节 导数概念
引例，导数的定义，导数的几何意义，可导与连续的关系

导数的几何意义就是曲线在某点的切线的斜率，反应了变化的快慢，理解这个很重要，以及后面的偏导数的理解，它们最后都应用对一些算法的理解中，例如梯度下降算法，其实就是利用这个几何意义，让要优化的函数尽快地逼近局部最优解。

![deviration_meaning.png][6]

####第二节 函数的求导法则
函数的和、差、积、商的求导法则，反函数的求导法则，复合函数的求导法则，基本求导法则与导数公式

关于反函数的求导法则：$\frac{dy}{dx}=\frac{1}{\frac{dx}{dy}}$

关于复合函数的求导法则：$\frac{dy}{dx}=\frac{dy}{du} \cdot \frac{du}{dx}$

关于基本初等函数求导法则

![image][7]

####第三节 高阶导数

二阶及二阶以上的导数称为高阶导数

####第四节 隐函数及其参数方程所确定的函数的导数
隐函数的导数，由参数方程所确定的函数的导数

如果方程$F(x,y)=0$确定了$y$是$x$的函数，那么这样的函数就叫做隐函数。一般它的求导分为两种方法：(1)如果能够解出$y=f(x)$关系式的话，就先解出然后求导；(2)如果不能解出，那么就利用复合函数求导方式进行求导。

####第五节 函数的微分
微分的定义，微分的几何意义，基本微分公式与微分法则，微分形式的不变性，微分的应用

先看看微分是怎么引入的？

![image][8]

就是说，在实际应用中，常常需要知道当自变量x有细微变化的时候，函数y的变化量$\vartriangle y$是多少？为了方便计算，需要将增量表达式线性化处理，从而计算出$\vartriangle y$的近似值。如上面所示，我们只需要用$A \vartriangle x$来近似代替$\vartriangle y$。

微分的几何意义，这其实是数学中常用的非线性函数的局部线性化，这里是利用曲线的切线段来近似代替曲线段。

![image][9]


  [1]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png "elementalfuns.png"
  [2]: http://hujiaweibujidao.github.io/images/math/elementalfuns.png "elementalfuns.png"
  [3]: http://hujiaweibujidao.github.io/images/math/fun_limit.png "fun_limit.png"
  [4]: http://hujiaweibujidao.github.io/images/math/funlimit_meaning.png "funlimit_meaning.png"
  [5]: http://hujiaweibujidao.github.io/images/math/sinxoverx.png "sinxoverx.png"
  [6]: http://hujiaweibujidao.github.io/images/math/deviration_meaning.png "deviration_meaning.png"
  [7]: http://hujiaweibujidao.github.io/images/math/deviration.png
  [8]: http://hujiaweibujidao.github.io/images/math/weifen.png
  [9]: http://hujiaweibujidao.github.io/images/math/weifen_meaning.png
  