---
layout: post
title: "Python Algorithms - Dynamic Programming"
date: 2014-05-08 23:30
comments: true
categories: algorithm
published: true
---

**<center>Python Algorithms Python算法系列</center>**
**<center>逸夫图书馆, 2014/5/18</center>**

### <center>动态规划</center>

参考内容：

1.[Python Algorithms: Mastering Basic Algorithms in the Python Language](http://link.springer.com/book/10.1007%2F978-1-4302-3238-4)

Chapter 8 Tangled Dependencies and Memoization

2.[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)

3.[算法设计、分析与实现从入门到精通](http://book.douban.com/subject/4875278/)

大家都知道，动态规划算法一般都有两种实现方式：

**1.直接自顶向下实现递归式，并将中间结果保存，这叫备忘录法；**

**2.将递归式翻转，自底向上地迭代，将结果保存在某个数据结构中。**

编程有一个原则`DRY=Don’t Repeat Yourself`，就是说你的代码不要重复来重复去的，这个原则同样可以用于理解动态规划，动态规划除了满足最优子结构，它还存在子问题重叠的性质，我们不能重复地去解决这些子问题，所以我们将子问题的解保存起来，类似缓存机制，之后遇到这个子问题时直接取出子问题的解。

举个简单的例子，斐波那契数列中的元素的计算，很简单，我们写下如下的代码：

```python
def fib(i):
    if i<2: return 1
    return fib(i-1)+fib(i-2)
```

好，来测试下，运行`fib(10)`得到结果69，不错，速度也还行，换个大的数字，试试100，这时你会发现，这个程序执行不出结果了，为什么？递归太深了！要计算的子问题太多了！

所以，我们需要改进下，我们保存每次计算出来的子问题的解，用什么保存呢？用Python中的dict！那怎么实现保存子问题的解呢？用Python中的装饰器！

如果不是很了解Python的装饰器，可以快速看下[这篇总结中关于装饰器的解释：Python Basics](http://hujiaweibujidao.github.io/blog/2014/05/10/python-tips1/)

修改刚才的程序，得到如下代码，定义一个函数`memo`返回我们需要的装饰器，这里用`cache`保存子问题的解，key是方法的参数，也就是数字`n`，值就是`fib(n)`返回的解。

```
from functools import wraps

def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        if args not in cache:
            cache[args]=func(*args)
        return cache[args]
    return wrap

@memo
def fib(i):
    if i<2: return 1
    return fib(i-1)+fib(i-2)
```
重新运行下`fib(100)`，你会发现这次很快就得到了结果`573147844013817084101`，这就是动态规划的威力，上面使用的是第一种带备忘录的递归实现方式。

**带备忘录的递归方式的优点就是易于理解，易于实现，代码简洁干净，运行速度也不错，直接从需要求解的问题出发，而且只计算需要求解的子问题，没有多余的计算。但是，它也有自己的缺点，因为是递归形式，所以有限的栈深度是它的硬伤，有些问题难免会出现栈溢出了。**

于是，迭代版本的实现方式就诞生了！

**迭代实现方式有2个好处：1.运行速度快，因为没有用栈去实现，也避免了栈溢出的情况；2.迭代实现的话可以不使用dict来进行缓存，而是使用其他的特殊cache结构，例如多维数组等更为高效的数据结构。**

那怎么把递归版本转变成迭代版本呢？

**这就是递归实现和迭代实现的重要区别：递归实现不需要去考虑计算顺序，只要给出问题，然后自顶向下去解就行；而迭代实现需要考虑计算顺序，并且顺序很重要，算法在运行的过程中要保证当前要计算的问题中的子问题的解已经是求解好了的。**

斐波那契数列的迭代版本很简单，就是按顺序来计算就行了，不解释，关键是你可以看到我们就用了3个简单变量就求解出来了，没有使用任何高级的数据结构，节省了大量的空间。

```python
def fib_iter(n):
    if n<2: return 1
    a,b=1,1
    while n>=2:
        c=a+b
        a=b
        b=c
        n=n-1
    return c
```

斐波那契数列的变种经常出现在上楼梯的走法问题中，每次只能走一个台阶或者两个台阶，广义上思考的话，**动态规划也就是一个连续决策问题，到底当前这一步是选择它(走一步)还是不选择它(走两步)呢?**

其他问题也可以很快地变相思考发现它们其实是一样的，例如求二项式系数`C(n,k)`，杨辉三角(求从源点到目标点有多少种走法)等等问题。

二项式系数`C(n,k)`表示从n个中选k个，假设我们现在n个中的第1个，考虑是否选择它。如果选择它的话，那么我们还需要从剩下的n-1个中选k-1个，即`C(n-1,k-1)`；如果不选择它的话，我们需要从剩下的n-1中选k个，即`C(n-1,k)`。所以，`C(n,k)=C(n-1,k-1)+C(n-1,k)`。

结合前面的装饰器，我们很快便可以实现求二项式系数的递归实现代码，其中的`memo`函数完全没变，只是在函数`cnk`前面添加了`@memo`而已，就这么简单！

```
from functools import wraps

def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        if args not in cache:
            cache[args]=func(*args)
        return cache[args]
    return wrap

@memo
def cnk(n,k):
    if k==0: return 1 #the order of `if` should not change!!!
    if n==0: return 0
    return cnk(n-1,k)+cnk(n-1,k-1)
```

它的迭代版本也比较简单，这里使用了`defaultdict`，略高级的数据结构，和dict不同的是，当查找的key不存在对应的value时，会返回一个默认的值，这个很有用，下面的代码可以看到。

如果不了解`defaultdict`的话可以看下[这篇文章：Python中的高级数据结构](http://blog.jobbole.com/65218/)

```
from collections import defaultdict

n,k=10,7
C=defaultdict(int)
for row in range(n+1):
    C[row,0]=1
    for col in range(1,k+1):
        C[row,col]=C[row-1,col-1]+C[row-1,col]

print(C[n,k]) #120
```

杨辉三角大家都熟悉，在国外这个叫`Pascal Triangle`，它和二项式系数特别相似，看下图，除了两边的数字之外，里面的任何一个数字都是由它上面相邻的两个元素相加得到，想想`C(n,k)=C(n-1,k-1)+C(n-1,k)`不也就是这儿含义吗?

![image](http://hujiaweibujidao.github.io/images/algos/sanjiao.png)

所以说，顺序对于迭代版本的动态规划实现很重要，下面举个实例，用动态规划解决有向无环图的单源最短路径问题。假设有如下图所示的图，当然，我们看到的是这个有向无环图经过了拓扑排序之后的结果，从a到f的最短路径用灰色标明了。

![image](http://hujiaweibujidao.github.io/images/algos/dag_sp.png)

好，怎么实现呢? 

**我们有两种思考方式：**

**1."去哪里?"：我们顺向思维，首先假设从a点出发到所有其他点的距离都是无穷大，然后，按照拓扑排序的顺序，从a点出发，接着更新a点能够到达的其他的点的距离，那么就是b点和f点，b点的距离变成2，f点的距离变成9。因为这个有向无环图是经过了拓扑排序的，所以按照拓扑顺序访问一遍所有的点(到了目标点就可以停止了)就能够得到a点到所有已访问到的点的最短距离，也就是说，当到达哪个点的时候，我们就找到了从a点到该点的最短距离，拓扑排序保证了后面的点不会指向前面的点，所以访问到后面的点时不可能再更新它前面的点的最短距离！这种思维方式的代码实现就是迭代版本。**

这里涉及到了拓扑排序，我的博客中还没有讲解，所以下面的代码已经将输入的点进行了拓扑排序，待我更新了图算法那篇文章再来更新这里的代码，谅解。

```
def topsort(W):
    return W

def dag_sp(W, s, t):
    d = {u:float('inf') for u in W} #
    d[s] = 0
    for u in topsort(W):
        if u == t: break
        for v in W[u]:
            d[v] = min(d[v], d[u] + W[u][v])
    return d[t]

#邻接表
W={0:{1:2,5:9},1:{2:1,3:2,5:6},2:{3:7},3:{4:2,5:3},4:{5:4},5:{}}
s,t=0,5
print(dag_sp(W,s,t)) #7
```

用图来表示计算过程就是下面所示：

![image](http://hujiaweibujidao.github.io/images/algos/dag_sp_iter.png)

**2."从哪里来?"：我们逆向思维，目标是要到f，那从a点经过哪个点到f点会近些呢?只能是求解从a点出发能够到达的那些点哪个距离f点更近，这里a点能够到达b点和f点，f点到f点距离是0，但是a到f点的距离是9，可能不是最近的路，所以还要看b点到f点有多近，看b点到f点有多近就是求解从b点出发能够到达的那些点哪个距离f点更近，所以又绕回来了，也就是递归下去，直到我们能够回答从a点经过哪个点到f点会更近。这种思维方式的代码实现就是递归版本。**

这种情况下，不需要输入是经过了拓扑排序的，所以你可以任意修改输入`W`中节点的顺序，结果都是一样的，而上面采用迭代实现方式必须要是拓扑排序了的，从中你就可以看出迭代版本和递归版本的区别了。

```
from functools import wraps
def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        if args not in cache:
            cache[args]=func(*args)
            # print('cache {0} = {1}'.format(args[0],cache[args]))
        return cache[args]
    return wrap

def rec_dag_sp(W, s, t):
    @memo
    def d(u):
        if u == t: return 0
        return min(W[u][v]+d(v) for v in W[u])
    return d(s)

#邻接表
W={0:{1:2,5:9},1:{2:1,3:2,5:6},2:{3:7},3:{4:2,5:3},4:{5:4},5:{}}
s,t=0,5
print(rec_dag_sp(W,s,t)) #7
```

用图来表示计算过程就是下面所示：

![image](http://hujiaweibujidao.github.io/images/algos/dag_sp_rec.png)

下面是参考内容1对DAG求单源最短路径的动态规划问题的总结，比较难理解，不知道我自己理解得对不对，可以忽视注释，:-)

![image](http://hujiaweibujidao.github.io/images/algos/dp_summary.png)

好，我们差不多搞清楚了动态规划的本质以及两种实现方式的优缺点，下面我们来实践下，举最常用的例子：矩阵链乘问题！

矩阵链乘问题的描述如下，就是说要确定一个完全加括号的形式使得需要进行的标量计算数目最少，矩阵$A_{i}$的维数为$p_{i-1}p_{i}$，如果穷举所有可能形式的话，时间复杂度是指数级的！因为该问题满足最优子结构，并且子问题存在重叠，所以我们要借助动态规划来求解。

![image](http://hujiaweibujidao.github.io/images/algos/matrix.png)

我们需要确定一个递归式来将我们要求解的问题表示出来，下面摘自算法导论，介绍地非常详细
![image](http://hujiaweibujidao.github.io/images/algos/matrix2.png)

最后给出的递归式如下，就是说**我们要去确定任何从第i个矩阵到第j个矩阵组成的矩阵链$A_{i...j}$的最优解。如果i和j相等，那么就是一个矩阵，不需要运算；如果i小于j，那么肯定要从它们中间的某个位置分开来，那从哪里分开来呢? 这个我们可以尝试下所有可能的选择，也就是尝试不同的位置k，k满足条件$i <= k < j$，在位置k将矩阵链进行分开，看看它需要的计算次数，然后我们从这些可能的k中选择使得计算次数最小的那个k进行分开，分开了之后我们的问题就变成了2个小问题，确定矩阵链从i到k即$A_{i...k}$和另一个矩阵链从k+1到j即$A_{(k+1)...j}$的最优解。如果我们一开始设置i=1(第一个矩阵)，j=n(最后一个矩阵)，那么，经过上面的递归即可得到我们需要的解。这就是递归的思想！**

$$
m[i][j]= \left\{ 
  \begin{array}{l l}
    0 & \quad \text{if i=j }\\
    min_{i \le k < j}{m[i][k]+m[k+1][j]+p_{i-1}p_{k}p_{j}} & \quad \text{if i<j}
  \end{array} \right.
$$

根据上面的思想我们很快就可以写出一个递归版本的矩阵链承法的实现代码，输出的结果也没有错，给出的加括号的方式是`( ( A1 ( A2 A3 ) ) ( ( A4 A5 ) A6 ) )`。[问题的数据是算法导论中的问题的数据，值是`30,35,15,5,10,20,25`]。

```
def matrixchain_rec(p,i,j):
    if i==j:
        return 0
    for k in range(i,j):
        q=matrixchain_rec(p,i,k)+matrixchain_rec(p,k+1,j)+p[i-1]*p[k]*p[j]
        if q<m[i][j]:
            m[i][j]=q
            s[i][j]=k
    return m[i][j]

def showmatrixchain(s,i,j):
    if i==j:
        print 'A%d'%(i),
    else:
        print '(',
        showmatrixchain(s,i,s[i][j])
        showmatrixchain(s,s[i][j]+1,j)
        print ')',

n=6
p=[30,35,15,5,10,20,25]
m=[[sys.maxint for i in range(n+1)] for j in range(n+1)]
s=[[0 for i in range(n+1)] for j in range(n+1)]
# pprint.pprint(m)
result=matrixchain_rec(p,1,6)
print(result) #15125
showmatrixchain(s,1,6) #( ( A1 ( A2 A3 ) ) ( ( A4 A5 ) A6 ) )
```

上面的代码运行没有问题，但是，它不够完美！为什么呢? 很明显，矩阵链乘问题子问题存在重叠，下面这张图很形象地显示了哪些子问题被重复计算了，所以我们需要改进，改进的方法就是使用带备忘录的递归形式！

![image](http://hujiaweibujidao.github.io/images/algos/matrix3.png)

要改成带备忘录的很简单，我们实现过几次了，但是，这次我们不能直接使用原来的装饰器，因为Python中的dict不能对list对象进行hash，所以我们要简单地修改下我们key值的构建，也很简单，看下代码就明白了：

```
from functools import wraps

def memo(func):
    cache={}
    @wraps(func)
    def wrap(*args):
        #build new key!!!
        key=str(args[1])+str(args[2])
        if key not in cache:
            cache[key]=func(*args)
        return cache[key]
    return wrap

@memo
def matrixchain_rec(p,i,j):
    if i==j:
        return 0
    for k in range(i,j):
        q=matrixchain_rec(p,i,k)+matrixchain_rec(p,k+1,j)+p[i-1]*p[k]*p[j]
        if q<m[i][j]:
            m[i][j]=q
            s[i][j]=k
    return m[i][j]

def showmatrixchain(s,i,j):
    if i==j:
        print 'A%d'%(i),
    else:
        print '(',
        showmatrixchain(s,i,s[i][j])
        showmatrixchain(s,s[i][j]+1,j)
        print ')',

n=6
p=[30,35,15,5,10,20,25]
m=[[sys.maxint for i in range(n+1)] for j in range(n+1)]
s=[[0 for i in range(n+1)] for j in range(n+1)]
# pprint.pprint(m)
result=matrixchain_rec(p,1,6)
print(result) #15125
showmatrixchain(s,1,6) #( ( A1 ( A2 A3 ) ) ( ( A4 A5 ) A6 ) )
```

**接下来的一个问题是，我们怎么实现迭代版本呢? 迭代版本关键在于顺序！我们怎么保证我们在计算$A_{i...j}$的最优解时，所有可能的k的选择需要求解的子问题$A_{i...k}$以及$A_{(k+1)...j}$是已经求解出来了的呢? 一个简单但是有效的想法就是看矩阵链的长度，我们先计算矩阵链短的最优解，然后再计算矩阵链长的最优解，后者计算时所需要求解的子问题肯定已经求解完了，对不对? 于是就有了迭代版本的实现，需要注意的就是其中的i,j,k的取值范围。**

```
import sys
def matrixchain_iter(p):
    n=len(p)-1 #total n matrices 6
    #to solve the problem below, so initialize to n+1!!!
    m=[[0 for i in range(n+1)] for j in range(n+1)]
    s=[[0 for i in range(n+1)] for j in range(n+1)]
    # for i in range(n): #for matrix with len=1
        # m[i][i]=0
    # pprint.pprint(m)
    for l in range(2,n+1): #iterate the length, max is n
        for i in range(1,n-l+2): #i max is n-l+1
            j=i+l-1 #j is always l away from i
            m[i][j]=sys.maxint #initial to infinity
            for k in range(i,j):
                #attention to python array when index < 0!!!
                #solution is using more space with useless values
                q=m[i][k]+m[k+1][j]+p[i-1]*p[k]*p[j]
                if q<m[i][j]:
                    m[i][j]=q
                    s[i][j]=k
        # print('when len is %d ' % (l))
        # pprint.pprint(m)
    return m,s

print('')
m,s=matrixchain_iter(p)
print(m[1][6]) #15125
showmatrixchain(s,1,6) #( ( A1 ( A2 A3 ) ) ( ( A4 A5 ) A6 ) )
```
实现的时候需要注意一点，在Python中取list中的值时，如果索引是负值的话会从后面往前数返回对应的元素，而以前我们用其他语言的时候肯定是提示越界了，所以代码中用来存储结果的数数组是(n+1)x(n+1)，而不是nxn的，这样的话就能够保证返回的是0，而不是从后往前数得到的结果。

得到的数组`m`如下，`m[1,6]`就是我们需要的解。

```
[[0, 0, 0, 0, 0, 0, 0],
 [0, 0, 15750, 7875, 9375, 11875, 15125],
 [0, 0, 0, 2625, 4375, 7125, 10500],
 [0, 0, 0, 0, 750, 2500, 5375],
 [0, 0, 0, 0, 0, 1000, 3500],
 [0, 0, 0, 0, 0, 0, 5000],
 [0, 0, 0, 0, 0, 0, 0]]
```

数组`s`如下：

```
[[0, 0, 0, 0, 0, 0, 0],
 [0, 0, 1, 1, 3, 3, 3],
 [0, 0, 0, 2, 3, 3, 3],
 [0, 0, 0, 0, 3, 3, 3],
 [0, 0, 0, 0, 0, 4, 5],
 [0, 0, 0, 0, 0, 0, 5],
 [0, 0, 0, 0, 0, 0, 0]]
```

将这个两个数组旋转下，并且只看上三角部分的数字，就可以得到算法导论中给出的那张三角图形了，非常类似杨辉三角

![image](http://hujiaweibujidao.github.io/images/algos/matrixmulti.png)

OK，希望我把动态规划将清楚了，总结下：**动态规划其实就是一个连续决策的过程，每次决策我们可能有多种选择(二项式系数和0-1背包问题中我们只有两个选择，DAG图的单源最短路径中我们的选择要看点的出边或者入边，矩阵链乘问题中就是矩阵链可以分开的位置总数...)，我们每次选择最好的那个作为我们的决策。动态规划有2中实现方式，一种是带备忘录的递归形式，这种方式直接从原问题出发，遇到子问题就去求解子问题并存储子问题的解，下次遇到的时候直接取出来，问题求解的过程看起来就像是先自顶向下地展开问题，然后自下而上的进行决策。另一个实现方式是迭代方式，这种方式需要考虑如何给定一个子问题的求解方式，使得后面求解规模较大的问题是需要求解的子问题都已经求解好了，它的缺点就是可能有些子问题不要算但是它还是算了，而递归实现方式只会计算它需要求解的子问题。**

