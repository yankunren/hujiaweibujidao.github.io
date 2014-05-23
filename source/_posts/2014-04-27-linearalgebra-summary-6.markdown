---
layout: post
title: "LAS 6-Matrix Decomposition"
date: 2014-04-29 17:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/5/22</center>**

### <center>矩阵分解</center>

[内容摘录自我去年写的[Numeric Methods with Matlab总结](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)的第一章 线性方程组求解和第三章 矩阵特征值和奇异值求解，进入上面的链接地址可以下载原始的PDF版本的内容，如果不想下载，那么也可以直接阅读下面的内容，源代码基本上都是使用或者修改自书籍[《Numerical Computing with Matlab》](http://www.mathworks.cn/moler/)，如果下面有不熟悉的术语也请阅读这本书或者喻文健老师的翻译版本《Matlab数值计算》]

总结矩阵分解：由于实际中遇到的矩阵可能规模很大而且很复杂，为了更高效地处理矩阵于是就有了矩阵分解。分解一般是分解成规模更小的或者性质更好的矩阵(比如三角矩阵或者对角矩阵)，这个时候我们需要透过现象看本质，结合前面我们解释矩阵就是线性变换可知，矩阵分解实际上是把这个线性变换转换成几个其他的线性变换的组合，一般是旋转变换(对应一个正交矩阵)或者放缩变换(对应一个对角矩阵)的组合。

1.LU分解

线性方程组的实际应用中经常遇到系数矩阵不变，只是右端项发生变化的情况(多右端项问题)，这个时候如果还是使用高斯消去法的话，对于每个右端项都要进行重复的消去和回代的过程，显然计算量很大。为了解决这类问题，于是就有了LU分解算法。

关系式$LU=PA$即为矩阵$A$的LU分解(或者三角分解)，其中矩阵$P$为排列阵(单位阵经过行列交换得到的矩阵，有时候也叫置换阵)，矩阵$L$为单位下三角矩阵(对角线元素都为1)，矩阵$U$为上三角矩阵，这样的话，一般的线性方程组$Ax=b$可以等价为两个三角型线性方程组 $Ly=Pb,\,Ux=y$。

首先对系数矩阵$A$进行LU分解，然后对于每个右端项只要先计算出$y$然后再计算$x$即可，两个都只是解很简单的三角型线性方程组。计算过程如下，[图片来源](http://www.cnblogs.com/daniel-D/p/3204508.html)

![image](http://hujiaweibujidao.github.io/images/math/lu2.jpg)

LU分解有两种方法，一种是使用前面的高斯消去法，另一种是Crout方法(这里不介绍，详情请看参考[《Numerical Methods: An introduction with Applications Using Matlab》](http://as.wiley.com/WileyCDA/WileyTitle/productCd-EHEP001929.html))。

下面给出使用高斯消去法的LU分解算法源码[大部分内容和高斯消去法相同，只是它还要计算矩阵$L,U,P$]，它是LU分解常用的K-I-J版本。在Matlab中可以使用内置`lu`函数，调用示例：$[L,U,P] = lu(A)$

```matlab
function [L,U,p] = lugs(A)
% 使用高斯消去法的LU分解 [ k-i-j 版本 ]
% 系数矩阵，单位下三角矩阵，上三角矩阵，排列阵
% A=[4 -2 -3 6; -6 7 6.5 -6; 1 7.5 6.25 5.5; -12 22 15.5 -1];
% b=[12; -6.5; 16; 17];
% [L,U,P]=lugs(A)
% A(P,:) 
% L*U

[n,n] = size(A);
p = (1:n)';
for k = 1:n-1
    %查找主元列对角线以下的绝对值最大的元素和索引
    [r,m] = max(abs(A(k:n,k)));
    m = m+k-1;
    %如果对应元素是0则跳过消去过程
    if (A(m,k) ~= 0)
        %满足条件的话就交换行
        if (m ~= k)
            A([k m],:) = A([m k],:);
            p([k m]) = p([m k]);%对应的排列阵也要跟着变化
        end
        %计算乘子
        i = k+1:n;
        A(i,k) = A(i,k)/A(k,k);
        %更新矩阵的行
        j = k+1:n;
        A(i,j) = A(i,j) - A(i,k)*A(k,j);%就地存储！
    end
end
%得到LU分解的结果
L = tril(A,-1) + eye(n,n);%下三角部分，但是对角线上都是1
U = triu(A);%上三角部分
```

wiki上关于LU分解的应用

![image](http://hujiaweibujidao.github.io/images/math/lu.png)

2.Cholesky分解

**对于对称矩阵$A$，如果它的各阶顺序主子式$\neq0$，则它可以唯一分解为$A=LDL^{T}$，其中$D$是对角阵，$L$为单位下三角阵。若矩阵同时正定，那么存在实的非奇异的下三角矩阵$L$，满足$A=LL^{T}$，若限定L对角线元素$>0$，那么此分解唯一。**

考虑对称正定矩阵$A$，它的LU分解过程可以进一步简化，这也就是Cholesky分解！

事实证明，**对于对称正定矩阵，Cholesky分解是稳定的，不需要进行选主元操作。**另外，它的计算量和存储量都只是LU分解的一半。考虑到它的对称性，LU分解的结果如下：(注意矩阵L不再是单位下三角矩阵了)

$$
A=
\left[
\begin{array}{lllll}
l_{11} & 0 & 0 & \ldots & 0 \\
l_{21} & l_{22} & 0 & \ldots & 0\\
l_{31} & l_{32} & l_{33} & \ldots & 0 \\
\vdots & \vdots & \vdots & \ddots & 0 \\
l_{n1} & l_{n2} & l_{n3} & \ldots & l_{nn}
\end{array}
\right]
\left[
\begin{array}{lllll}
l_{11} & l_{12} & l_{13} & \ldots & l_{1n} \\
0 & l_{22} & l_{23} & \ldots & l_{2n}\\
0 & 0 & l_{33} & \ldots & l_{3n} \\
\vdots & \vdots & \vdots & \ddots & \vdots \\
0 & 0 & 0 & \ldots & l_{nn}
\end{array}
\right]
$$

一种就地存储的Cholesky分解算法的实现步骤(对$j=2,3\cdots,n$重复执行(3)(4)步即可)：

(1)求$$l_{11}$$。 $$l_{11}=\sqrt{a_{11}}$$

(2)求$$l_{i1}$$。 $$l_{i1}=a_{i1}/l_{11}$$

(3)假设矩阵$L$的前$j-1$列都已经求出了，即$$l_{ik} (k \leq j-1,i=1,\cdots,n)$$都已知，考虑计算$$a_{i,j}$$。

$$
a_{jj}=\sum_{k=1}^{j}{l_{ik}^2}\quad
=>\quad
l_{jj}=\sqrt{a_{jj}-\sum_{k=1}^{j-1}{l_{jk}}^2}
$$

(4)求矩阵$L$中第$j$列剩余元素，即$$l_{ij}(i>j)$$，考虑计算$$a_{ij}$$。

$$
a_{jj}=\sum_{k=1}^{n}{l_{ik}l_{jk}}=\sum_{k=1}^{j}{l_{ik}l_{jk}}=\sum_{k=1}^{j-1}{l_{ik}l_{jk}}+l_{ij}l_{jj}\quad
=>\quad
l_{ij}=( {a_{ij}-\sum_{k=1}^{j-1}{l_{ik} l_{jk} } } )/ l_{jj}
$$

简易版本的cholesky分解算法代码，在Matlab中可以调用内置`chol`函数，示例：$[R,p] = chol(A)$

```
function [L,U] = cholnm(A)
% 简易版本的Cholesky分解，就地存储，使用下三角
% p=pascal(5)
% [l,u]=cholnm(p)
% l*u

[n,n] = size(A);
for j=1:n %当前操作的列
    for k=1:j-1
        A(j,j)=A(j,j)-A(j,k)^2;
    end
    A(j,j)=sqrt(A(j,j));%求出对角线元素
    for i=j+1:n %求解对角线以下的元素
        for k=1:j-1
            A(i,j)=A(i,j)-A(i,k)*A(j,k);
        end
        A(i,j)=A(i,j)/A(j,j);%求出对角线以下的元素
    end
end
%求出上三角和下三角
L=tril(A);
U=L';
```

小总结：有了上面的LU分解和Cholesky分解，我们就可以写出一个简易版本的矩阵求逆算法。

```
function x = bslashnm(A,b)
% 解线性方程组
% A=[4 -2 -3 6; -6 7 6.5 -6; 1 7.5 6.25 5.5; -12 22 15.5 -1];
% b=[12; -6.5; 16; 17];
% A\b
% x=bslashnm(A,b)

[n,n] = size(A);
if isequal(triu(A,1),zeros(n,n))
   %下三角直接前向回代即可
   x = forward(A,b);
   return
elseif isequal(tril(A,-1),zeros(n,n))
   %上三角直接后向回代即可
   x = backsubs(A,b);
   return
elseif isequal(A,A')
   [R,fail] = chol(A);%进行Cholesky分解
   if ~fail
      %如果分解成功，求解两个三角型线性方程组即可
      y = forward(R',b);
      x = backsubs(R,y);
      return
   end
end

%三角分解
[L,U,p] = lugs(A);
%对右端项进行排列然后解下三角线性方程组
y = forward(L,b(p));
%解上三角线性方程组
x = backsubs(U,y);

% --------前向消去 解下三角型线性方程组--------
% For lower triangular L, x = forward(L,b) solves L*x = b.
function x = forward(L,x)
[n,n] = size(L);
x(1) = x(1)/L(1,1);
for k = 2:n
   j = 1:k-1;
   x(k) = (x(k) - L(k,j)*x(j))/L(k,k);
end

% --------回代 解上三角型线性方程组------------
% For upper triangular U, x = backsubs(U,b) solves U*x = b.
function x = backsubs(U,x)
[n,n] = size(U);
x(n) = x(n)/U(n,n);
for k = n-1:-1:1
   j = k+1:n;
   x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
end
```

3.QR分解

QR分解是求解中小规模矩阵所有特征值的有效方法，它的基本原理是利用相似变换(两个方阵相似的条件是存在可逆矩阵$C$,使得$A=C^{-1}BC$)不改变矩阵的特征值以及上三角矩阵的特征值就是它的对角线元素的性质对矩阵进行分解。

QR分解的实际计算有很多方法，例如Givens旋转、Householder变换，以及Gram-Schmidt正交化等等。每一种方法都有其优点和不足。

**实Schur型矩阵：矩阵$S$为上三角阵，且对角块为1阶或者2阶矩阵。这类矩阵可以进行正交分解：$S=Q^{T}AQ$，称为实Schur分解，其中$S$的1阶对角块就是$A$的实特征值，2阶对角块的特征值是$A$的共轭复特征值。等式$A=QSQ^{T}$称为矩阵$A$的实Schur分解。**

QR分解的目标是通过一系列**正交相似变换**(也就是说不单要求变换矩阵P可逆，还要求它是正交阵)将原矩阵转换成一个上三角型的相似矩阵(即实Schur型矩阵)，这样求解特征值就特别简单了。QR分解可以得到所有的特征值，但是不能得到特征向量。**如果所有的特征值都是实数的话，QR分解得到的是一个正交阵和一个上三角阵。如果有的特征值是复数的话，那么得到的是一个正交阵和一个对角线某些位置为(2x2)块矩阵的上三角阵。**

假设矩阵$$A_{1}$$是要求特征值的矩阵，QR分解求其特征值的迭代过程如下：

(1)对$$A_{1}$$进行QR分解得到$$A_{1}=Q_{1}R_{1}$$。其中$$Q_{1}$$是一个正交阵，$$R_{1}$$是一个上三角阵。

(2)用$$R_{1}$$乘以$$Q_{1}$$得到$$A_{2}$$，即$$A_{2}=R_{1}Q_{1}$$。由于$$R_{1}=Q_{1}^{-1}A_{1}$$，则有$$A_{2}=Q_{1}^{-1}A_{1}Q_{1}$$，所以$$A_{2}$$和$$A_{1}$$是相似矩阵。

(3)此时，对$$A_{2}$$进行QR分解得到$$A_{2}=Q_{2}R_{2}$$，再将得到的$$Q_{2}$$和$$R_{2}$$反过来相乘，得到$$A_{3}$$，然后再对$$A_{3}$$进行QR分解，不断重复上面的操作直到得到上三角矩阵，最终的上三角矩阵对角线元素便是矩阵特征值。

上面的迭代过程中，每步都要进行一次QR分解，这是通过上节介绍的Householder变换实现的。

简易版本的QR分解的实现，Matlab中可以使用内置函数`qr`进行QR分解。

```
function [Q,R] = easyqrnm(R)
% 简易版本的QR分解
% A=[45 30 -25; 30 -24 68; -25 68 80];
% for i=1:40
%     [q,r]=easyqrnm(A);
%     A=r*q;
% end
% e=diag(A)
% eig(A)


n=size(R);
I=eye(n);
Q=I;
for j=1:n-1
    c=R(:,j);
    c(1:j-1)=0;
    e(1:n,1)=0;%
    if c(j) > 0
        e(j)=1;
    else
        e(j)=-1;
    end
    clen=sqrt(c'*c);
    v=c+clen*e;
    H=I-2/(v'*v) * v*v';%得到矩阵H
    Q=Q*H;%
    R=H*R;%
end
```

实际使用的QR分解要比上面的简易版本的QR分解复杂很多，但是基本思路是一样的，那就是通过一系列的正交相似变换$B=Q^{T}AQ$将矩阵$A$化为上三角或者对角块阶数很小的分块上三角阵，然后求特征值。实用的技术主要有两个：(1)将矩阵化简为上Hessenberg矩阵；(2)带原点位移的QR算法。

上Hessenberg矩阵和上三角矩阵的区别在于，其紧邻主对角线下方的副对角线上的元素不全为0。可以证明，**对上Hessenberg矩阵$$A_{k}$$进行QR算法的一步迭代，得到的$$A_{k+1}$$仍为上Hessenberg矩阵。**使用Householder变换可以将一般矩阵化为上Hessenberg矩阵，总共经过(n-2)步正交相似变换。**若原始矩阵是实对称阵，那么得到的上Hessenberg矩阵是一个对称的三对角阵。**对上Hessenberg矩阵进行QR分解时不需要使用Householder变换，只要使用一系列Givens旋转变换即可。Givens旋转变换是一类平面旋转变换，它能够消去给定向量的某一个分量(使其为0)，这不同于Householder变换消去向量中的多个分量。在处理稀疏向量或者稀疏矩阵时，Givens旋转更加高效。

将原点位移技术与QR分解结合，通过原点位移技术可以改变做QR分解的矩阵，一方面它能够提高迭代收敛速度，另一方面也使QR分解对更一般的矩阵有效。

该部分的内容比较难，此处不过多介绍，详细内容参考书籍《数值分析与算法》,喻文健,清华大学出版社,2012,1。

4.SVD

**若矩阵表示一个空间到另一个空间的变换，则奇异值很重要。**求矩阵的奇异值可以利用求矩阵的特征值的方法，最简单的求矩阵$A$奇异值的方法是计算矩阵$A^{T}A$的特征值，非负特征值的平方根就是特征值(对称矩阵的一个性质)，但是这种方法的计算误差大。

还有一种求矩阵奇异值的方法是先将矩阵$A$化简成双对角阵$B$，再对$B^{T}B$执行(隐式)QR迭代算法。$$B_{k}^{T}B_{k}$$在QR迭代过程中保持形状不变。[暂时没有查找相应的资料使用这种方法求解奇异值]

这部分内容参考自[Data Mining Algorithms In R.](http://en.wikibooks.org/w/index.php?title=Data_Mining_Algorithms_In_R&stable=1)中章节Dimensionality Reduction中的[Singular Value Decomposition](http://en.wikibooks.org/wiki/Data_Mining_Algorithms_In_R/Dimensionality_Reduction/Singular_Value_Decomposition)。在该网页中可以查看详细例子。

对于(nxd)矩阵$X$的奇异值分解式是：$X=UAV^{T}$，其中(nxn)矩阵$U$和(dxd)矩阵$V$都是正交阵，而(nxd)矩阵$A$是对角阵，对角线上的元素是矩阵$A$的奇异值。矩阵$U$的列向量是矩阵$X$的左奇异向量，矩阵$V$的列向量是矩阵$X$的右奇异向量。矩阵$A$对角线上的奇异值自上到下是从大到小分布的，并且所有的奇异值都大于0。

要计算矩阵$X$的奇异值分解式，就要计算$X^{T}X$和$XX^{T}$的特征值和特征向量。其中，**矩阵$X^{T}X$的特征向量就是矩阵$V$的列，而矩阵$XX^{T}$的特征向量就是矩阵$U$的列，矩阵$X$的奇异值就是矩阵$X^{T}X$和$XX^{T}$的共同非负特征值的平方根。矩阵$X$的奇异值的个数是矩阵$X$的秩，也就是线性无关的行(或者列)的数目。**

SVD分解的过程：
(1)计算矩阵$X^{T}X$和矩阵$XX^{T}$的特征值和特征向量；
(2)计算矩阵$X^{T}X$和矩阵$XX^{T}$的共同非负特征值的平方根得到奇异值；
(3)通过计算的结果得到矩阵$U$，矩阵$V$和矩阵$A$。

在Matlab中直接使用内置函数`svd`即可，示例：

$[U,S,V] = svd(X)$ 

$[U,S,V] = svd(X,0)$ 简化版本



