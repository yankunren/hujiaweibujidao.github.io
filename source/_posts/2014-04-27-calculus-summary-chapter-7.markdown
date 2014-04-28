---
layout: post
title: "Calculus Summary Chapter 7"
date: 2014-04-27 14:29
comments: true
categories: math
published: true
---
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
  
  