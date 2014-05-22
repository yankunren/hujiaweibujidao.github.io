---
layout: post
title: "LAS 6-Matrix Decomposition"
date: 2014-04-29 17:03
comments: true
categories: math
published: true
---

**<center>线性代数那些事 Things of Linear Algebra</center>**
**<center>逸夫图书馆, 2014/4/27</center>**

### <center>矩阵分解</center>

[内容摘录自我去年写的[Numeric Methods with Matlab总结](http://hujiaweibujidao.github.io/blog/2014/04/23/numerical-methods-using-matlab/)的第一章 线性方程组求解和第三章 第三章 矩阵特征值和奇异值求解，点击上面的链接地址可以下载原始的PDF版本的内容，如果不想下载，那么也可以直接阅读下面的内容，源代码基本上都是使用或者修改自书籍[《Numerical Computing with Matlab》. Cleve B. Moler.](http://www.mathworks.cn/moler/)]

1.LU分解

线性方程组的实际应用中经常遇到系数矩阵不变，只是右端项发生变化的情况(多右端项问题)，这个时候如果还是使用高斯消去法的话，对于每个右端项都要进行重复的消去和回代的过程，显然计算量很大。为了解决这类问题，于是就有了LU分解算法。

关系式$LU=PA$即为矩阵$A$的LU分解(或者三角分解)，其中矩阵$P$为排列阵(单位阵经过行列交换得到的矩阵，有时候也叫置换阵)，矩阵$L$为单位下三角矩阵(对角线元素都为1)，矩阵$U$为上三角矩阵，这样的话，一般的线性方程组$Ax=b$可以等价为两个三角型线性方程组 $Ly=Pb,\,Ux=y$。

首先对系数矩阵$A$进行LU分解，然后对于每个右端项只要先计算出$y$然后再计算$x$即可，两个都只是解很简单的三角型线性方程组。

LU分解有两种方法，一种是使用前面的高斯消去法，另一种是Crout方法(这里不介绍，详情请看参考《Numerical Methods: An introduction with Applications Using Matlab》. Amos Gilat. Vish Subramaniam,2010,10)。

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

2.Cholsky分解

**对于对称矩阵$A$，如果它的各阶顺序主子式$\neq0$，则它可以唯一分解为$A=LDL^{T}$，其中$D$是对角阵，$L$为单位下三角阵。若矩阵同时正定，那么存在实的非奇异的下三角矩阵$L$，满足$A=LL^{T}$，若限定L对角线元素$>0$，那么此分解唯一。**

考虑对称正定矩阵$A$，它的LU分解过程可以进一步简化，这也就是Cholesky分解！事实证明，**对于对称正定矩阵，Cholesky分解是稳定的，不需要进行选主元操作。**另外，它的计算量和存储量都只是LU分解的一半。考虑到它的对称性，LU分解的结果如下：(注意矩阵L不再是单位下三角矩阵了)

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

(1)求$l_{11}$。 $l_{11}=\sqrt{a_{11}}$

(2)求$l_{i1}$。 $l_{i1}=a_{i1}/l_{11}$

(3)假设矩阵$L$的前$j-1$列都已经求出了，即$l_{ik} (k \leq j-1,i=1,\cdots,n)$都已知，考虑计算$a_{i,j}$。

$$
a_{jj}=\sum_{k=1}^{j}{l_{ik}^2}\quad
=>\quad
l_{jj}=\sqrt{a_{jj}-\sum_{k=1}^{j-1}{l_{jk}}^2}
$$

(4)求矩阵$L$中第$j$列剩余元素，即$l_{ij}(i>j)$，考虑计算$a_{ij}$。

$$
a_{jj}=\sum_{k=1}^{n}{l_{ik}l_{jk}}=\sum_{k=1}^{j}{l_{ik}l_{jk}}=\sum_{k=1}^{j-1}{l_{ik}l_{jk}}+l_{ij}l_{jj}\quad
=>\quad
l_{ij}=({{a_{ij}-\sum_{k=1}^{j-1}{l_{ik}l_{jk}}}})/{l_{jj}}
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

**QR分解是求解中小规模矩阵所有特征值的有效方法，它的基本原理是相似变换(两个方阵相似的条件是存在可逆矩阵$C$,使得$A=C^{-1}BC$)不改变矩阵的特征值和对应的特征向量以及上三角矩阵的特征值就是它的对角线元素。**

**实Schur型矩阵：矩阵$S$为上三角阵，且对角块为1阶或者2阶矩阵。这类矩阵可以进行正交分解：$S=Q^{T}AQ$，称为实Schur分解，其中$S$的1阶对角块就是$A$的实特征值，2阶对角块的特征值是$A$的共轭复特征值。等式$A=QSQ^{T}$称为矩阵$A$的实Schur分解。**

QR分解的目标是通过一系列正交相似变换将原矩阵转换成一个上三角型的相似矩阵(即实Schur型矩阵)，这样求解特征值就特别简单了。QR分解可以得到所有的特征值，但是不能得到特征向量。**如果所有的特征值都是实数的话，QR分解得到的是一个正交阵和一个上三角阵。如果有的特征值是复数的话，那么得到的是一个正交阵和一个对角线某些位置为(2x2)块矩阵的上三角阵。**

假设矩阵$A_{1}$是要求特征值的矩阵，QR分解的迭代过程如下：

(1)对$A_{1}$进行QR分解得到$A_{1}=Q_{1}R_{1}$。其中$Q_{1}$是一个正交阵，$R_{1}$是一个上三角阵。

(2)用$R_{1}$乘以$Q_{1}$得到$A_{2}$，即$A_{2}=R_{1}Q_{1}$。由于$R_{1}=Q_{1}^{-1}A_{1}$，则有$A_{2}=Q_{1}^{-1}A_{1}Q_{1}$，所以$A_{2}$和$A_{1}$是相似矩阵。

(3)此时，对$A_{2}$进行QR分解得到$A_{2}=Q_{2}R_{2}$，再将得到的$Q_{2}$和$R_{2}$反过来相乘，得到$A_{3}$，然后再对$A_{3}$进行QR分解，不断重复上面的操作直到得到上三角矩阵，最终的上三角矩阵对角线元素便是矩阵特征值。



