---
layout: post
title: "Calculus Summary All Chapters"
date: 2014-04-28 08:40
comments: true
categories: math
published: false
---

**<center>微积分总结 Summary of Calculus</center>**
**<center>逸夫图书馆, 2014/4/26</center>**

### <center>第零部分 碎碎念</center>

到了研究生阶段才意识到本科的数学原来作用这么大，不论是在数据挖掘，还是机器学习，亦或是模式识别，数学都是基础中的基础。于是乎，我在逸夫图书馆泡了几天看了些微积分、线代和数理统计的书籍，写下三份总结，记录下重要的知识，以备后忘。本人才疏学浅，若有错误之处还请指出，让我“增长”，若有不足也请指出，使我“完备”，谢谢！:-)

**[注：这些总结不会详细地讲解所有概念，只是挑选一些我个人感觉比较有用的知识点进行总结，很多时候可能只是列举知识点，并无解释，忘记了的可以自行Wiki或者翻书，另外，为了节省写作时间，对于多重积分的计算和应用以及二阶的微分方程的求解我略过了，这部分暂时对我作用不大。另外，对于一些定理我并没有给出详细的表达，忽略了些前提条件，请不要较真，我希望的是给自己一个感性的理解就行，具体理性的分析需要的时候再查，还有就是我还剪切粘贴了很多图片...嗯，就是这样...强迫症者慎入...]**

PS：本总结的大纲是按照参考书籍[高等数学 中国环境出版社](http://product.dangdang.com/23311529.html)的目录结构来整理的，章节顺序有调整，我将无穷级数提前了，原书将这部分放在最后一章节，私以为不妥，每个小节标题下面一行的内容都是原书中的各个细分的小节内容。所有截图都来自参考书籍[同济大学 高等数学 高等教育出版社](http://book.douban.com/subject/2112359/)。

参考书籍：

1.[同济大学 高等数学 高等教育出版社](http://book.douban.com/subject/2112359/)

2.[高等数学 中国环境出版社](http://product.dangdang.com/23311529.html)

它山之石：

1.[武汉大学 黄正华老师](http://aff.whu.edu.cn/huangzh/)写的微积分复习总结 [上][book1]和[下][book2]

### <center>第一部分 函数与极限 </center>

####第一节 函数
集合、区间与邻域，函数的概念与性质，反函数与复合函数，初等函数

关于初等函数 [wiki](http://zh.wikipedia.org/wiki/%E5%88%9D%E7%AD%89%E5%87%BD%E6%95%B0)，初等函数在其定义域内都是连续的。

![image][1]

关于指数函数：
对于相等间隔的自变量x的取值，指数函数对应值的比例为常数。由指数运算法则可知，对任意的x，只要给定$x_{0}>0$，则$$a^{x+x_{0}}/a^{x}=a^{x_{0}}$$恒成立。此性质可以作为判断两个变量之间的关系是否为指数函数关系的主要依据。此外，这个性质导出了数理统计中的指数分布，在数理统计中我们会看到。

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

###<center>第二部分 导数与微分</center>

####第一节 导数概念
引例，导数的定义，导数的几何意义，可导与连续的关系

导数的几何意义就是曲线在某点的切线的斜率，反应了变化的快慢，理解这个很重要，后面的偏导数的理解也类似。如果用物体的运动来解释的话，导数就是物体在那个时刻的加速度了。

![image][6]

####第二节 函数的求导法则
函数的和、差、积、商的求导法则，反函数的求导法则，复合函数的求导法则，基本求导法则与导数公式

关于反函数的求导法则：$$\frac{dy}{dx}=\frac{1}{\frac{dx}{dy}}$$

关于复合函数的求导法则：$$\frac{dy}{dx}=\frac{dy}{du} \cdot \frac{du}{dx}$$

关于基本初等函数求导法则

![image][7]

####第三节 高阶导数

二阶及二阶以上的导数称为高阶导数

####第四节 隐函数及其参数方程所确定的函数的导数
隐函数的导数，由参数方程所确定的函数的导数

如果方程$$F(x,y)=0$$确定了$$y$$是$$x$$的函数，那么这样的函数就叫做隐函数。
一般它的求导分为两种方法：
(1)如果能够解出$$y=f(x)$$关系式的话(即隐函数显化)，就先解出然后求导；
(2)如果不能解出，那么就利用复合函数求导方式进行求导，例如两边同时对x求导，遇到复杂的还可以两边先取对数然后求导。

####第五节 函数的微分
微分的定义，微分的几何意义，基本微分公式与微分法则，微分形式的不变性，微分的应用

先看看微分是怎么引入的？

![image][8]

简言之，在实际应用中，常常需要知道当自变量x有细微变化的时候，函数y的变化量$$\vartriangle y$$是多少？为了方便计算，我们需要将增量表达式线性化处理，从而计算出$$\vartriangle y$$的近似值。如上面所示，我们只需要用$$A \vartriangle x$$来近似代替$$\vartriangle y$$。

微分的几何意义，这其实是数学中常用的非线性函数的局部线性化，这里是利用曲线的切线段(MP)来近似代替曲线段(MN)。

![image][9]

微分最大的应用就是求近似值，利用$$\vartriangle y \approx dy = f'(x) \vartriangle x$$。例如，求$$\sqrt[3]{1.02}$$的近似值，取函数$$f(x)=\sqrt[3]{x}, x_{0}=1, \vartriangle x=0.02$$即可。

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

### <center>第七部分 向量代数与空间解析几何</center>
本部分是多元微分学的基础，而且涉及到了很多的空间知识，图形比较多，所以这部分的图片比较多，如若不清晰请Wiki或者翻书查看。

####第一节 空间直角坐标系
空间点的直角坐标，空间两点的距离

####第二节 向量代数
向量的概念，向量的线性运算，向量的坐标，向量的模、方向角、投影，向量的数量积与向量积

方向角和方向余弦的概念：

![image][23]
![image][24]

投影的概念，投影是一个数值，当投影是指是一个向量$$\overrightarrow{r}$$在另一个向量$$\overrightarrow{u}$$上的投影时，投影就是投影到目标向量上得到的向量的模与目标向量的单位向量的模的比值。

![image][25]
![image][26]

向量的数量积的概念，即$$ab=\|a\|\|b\|\cos \theta$$，在物理中就是指力F做的功W。数量积又叫内积，是很重要的概念，在线代中同样有矩阵内积的概念，在数据挖掘中有一种很常用的度量相似度的方式，即余弦相似度，一般用于文本类似的数据求相似度。向量的向量积是$$ab=\|a\|\|b\|\sin\theta$$。

![image][27]
![image][28]

####第三节 平面及其方程
平面的点法式方程，平面的一般方程，两平面的夹角

已知一个平面内的一点和这个平面的法向量便可以确定一个平面了；其实，任何一个三元一次方程$$Ax+By+Cz+D=0$$都可以确定一个平面，其法向量就是(A,B,C)。

![image][33]
![image][34]

两个平面的夹角可用两个平面的法向量之间的夹角来得到。

![image][37]
       　
####第四节 空间直线及其方程
空间直线的一般方程，空间直线的对称式方程与参数方程，两直线的夹角，直线与平面的夹角

两个平面的交线就可以确定一条空间直线；已知直线上一点和直线的方向向量也可以确定一条直线。

![image][29]
![image][30]

两条直线之间的夹角可用两条直线的方向向量之间的夹角来得到

![image][31]

直线与平面之间的夹角可用直线的方向向量和平面的法向量之间的夹角来得到。

![image][32]

####第五节 曲面及其方程
曲面方程的概念，旋转曲面，柱面，二次曲面

曲面方程

![image][38]

旋转曲面：平面内一条曲线绕着平面上的一条直线旋转一周得到的曲面叫做旋转曲面。

![image][39]

柱面：一条直线绕着一条定曲线平行移动得到的轨迹称为柱面。

![image][40]

二次曲面[on wiki](http://zh.wikipedia.org/wiki/%E4%BA%8C%E6%AC%A1%E6%9B%B2%E9%9D%A2)，与平面解析几何中定义二次曲线类似，三元二次方程$$F(x,y,z)=0$$所表示的曲面称为二次曲面，而平面是一次曲面。Wikipedia上显示了各种二次曲面的方程和二次曲面的图形。

####第六节 空间曲线及其方程
空间曲线的一般方程，空间曲线的参数方程，空间曲线在坐标面上的投影

![image][35]
![image][36]

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

### <center>第九部分 重积分</center>

####第一节 二重积分的概念与性质
二重积分的概念，二重积分的性质

将一元函数积分进行扩展，如果是对闭区域D进行积分的话就叫做二重积分，很重要的一类二重积分问题是求曲顶柱体的体积，利用前面的定积分的思想来看，二重积分是取很小的积分面积元素，以它们为底，以函数值为高，然后求对应的曲顶柱体的体积。

![image][65]

####第二节 二重积分的计算方法
直角坐标下二重积分的计算，利用极坐标计算二重积分

直角坐标下的二重积分的计算可以看做是做两次单独的定积分。

![image][66]
![image][67]

有些情况下实际计算时需要根据区域D的情况考虑它属于X型还是Y型，还是需要分段进行考虑。

![image][68]

####第三节 三重积分
三重积分的概念，三重积分的计算

三重积分可以看做是求密度不均匀的物体的体积，它取的是很小很小的体积元素。它的计算使用先一后二或者先二后一的方式来计算，此处略过。

####第四节 重积分的应用
曲面的面积，质心

略过。

### <center>第十部分 微分方程</center>

####第一节 微分方程的基本概念
引例，微分方程的基本概念

在许多问题中，我们不总是能够得到函数关系式，而是得到函数和它的导数之间的关系式，这样的关系式就是微分方程。微分方程中出现的未知函数的最高阶导数的阶数叫做微分方程的阶。

只要是能够满足微分方程的函数都是它的解，如果解中包含了任意常数，并且任意常数的个数与阶数相同，那么这个解又叫做微分方程的通解。

通常我们会有一些初始条件。确定了通解中的任意常数的话，那么就得到了微分方程的特解。

求微分方程$$y'=f(x,y)$$满足初始条件$$y|_{x=x_{0}}=y_{0}$$的特解的问题，叫做一阶微分方程的初值问题。

![image][69]

####第二节 一阶微分方程
可分离变量方程，齐次方程，一阶线性微分方程，伯努利方程

可分离变量方程：利用一阶微分方程的形式，巧妙地分离变量，一边是y的函数，另一边是x的函数，然后左右两边积分即可得到一个关于x和y的隐函数，这个隐函数即为微分方程的解。

![image][70]
![image][71]

齐次方程：将原微分方程进行调整，左边为一阶导数，右边为关于$$\frac{y}{x}$$的函数，然后可以利用可分离变量得到微分方程的解。有些非齐次的微分方程可以化为齐次方程。

![image][72]
![image][73]

一阶线性微分方程：对于未知函数和导数都是一次的微分方程。

![image][75]
![image][76]
![image][77]
![image][78]

伯努利方程：含二阶导数

![image][79]
![image][80]
![image][81]

####第三节 可降阶的高阶微分方程
y(n)=f(x)型的微分方程，yn=f(x，y')型的微分方程，yn=f(Y，y')型的微分方程

略过。

####第四节 二阶常系数微分方程
通解的结构，二阶常系数齐次线性微分方程，二阶常系数非齐次线性微分方程

略过。

####第五节 微分方程的应用实例
物体冷却过程的数学模型，动力学问题，人口模型

略过。

<center>Congratuation! Thank you!</center> 
<center>恭喜你，看完啦！</center> 

  [book1]: http://hujiaweibujidao.github.io/files/calculus1_huangzhenghua.pdf
  [book2]: http://hujiaweibujidao.github.io/files/calculus2_huangzhenghua.pdf
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
  
  ---------------------------------------------------------------------
  
  

