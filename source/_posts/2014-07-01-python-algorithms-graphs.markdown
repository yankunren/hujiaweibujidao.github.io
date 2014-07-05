---
layout: post
title: "Python Algorithms - C9 Graphs"
date: 2014-07-01 11:30
comments: true
categories: algorithm
published: true
---

**<center>Python算法设计篇(9)</center>**
**<center>逸夫图书馆, 2014/7/1</center>**

### <center>Chapter 9: From A to B with Edsger and Friends</center>

> The shortest distance between two points is under construction.      
  ——Noelie Altito

本节主要介绍图算法中的各种最短路径算法，从不同的角度揭示它们的内核以及它们的异同

在前面的内容里我们已经介绍了图的表示方法(邻接矩阵和"各种"邻接表)、图的遍历(DFS和BFS)、图中的一些算法(基于DFS的拓扑排序和有向无环图的强连通分量、最小生成树的Prim和Kruskal算法等)，所有本节的主要就放在了图算法中的各种最短路径算法上。

[The shortest path problem comes in several varieties. For example, you can find shortest paths (just like any other kinds of paths) in both directed and undirected graphs. The most important distinctions, though, stem from your starting points and destinations. Do you want to find the shortest from one node to all others (single source)? From one node to another (single pair, one to one, point to point)? From all nodes to one (single destination)? From all nodes to all others (all pairs)? Two of these—single source and all pairs—are perhaps the most important. Although we have some tricks for the single pair problem (see “Meeting in the middle” and “Knowing where you’re going,” later), there are no guarantees that will let us solve that problem any faster than the general single source problem. The single destination problem is, of course, equivalent (just flip the edges for the directed case). The all pairs problem can be tackled by using each node as a single source (and we’ll look into that), but there are special-purpose algorithms for that problem as well.]

最短路径问题有很多的变种，比如我们是处理有向图还是无向图上的最短路径问题呢？但是，各个问题之间最大的区别是起点和终点。是从一个节点到所有其他节点的最短路径吗(单源最短路径)？还是从一个节点到另一个节点的最短路径(单对节点间最短路径)？还是从所有其他节点到某一个节点(多源最短路径)？还是求任何两个节点之间的最短路径(所有节点对最短路径)？

其中单源最短路径和所有节点对最短路径是最常见的问题。虽然单对节点间最短路径问题有一些求解的技巧(“Meeting in the middle” and “Knowing where you’re going,”)，但是该问题并没有比单源最短路径问题的解法快到哪里去，所以前者还是可以用后者的算法去求解；而多源点单终点的最短路径问题可以将边反转过来看成是单源最短路径问题；至于所有节点对最短路径问题，可以对图中的每个节点使用单源最短路径来求解，但是对于这个问题还有一些特殊的更好的算法可以解决。

在开始介绍各种算法之前，作者给出了图中的几个重要结论或者性质，此处附上原文

assume that we start in node s and that we initialize D[s] to zero, while all other distance estimates are set to infinity. Let d(u,v) be the length of the shortest path from u to v.

• d(s,v) <= d(s,u) + W[u,v]. This is an example of the triangle inequality.

• d(s,v) <= D[v]. For v other than s, D[v] is initially infinite, and we reduce it only
when we find actual shortcuts. We never “cheat,” so it remains an upper bound.

• If there is no path to node v, then relaxing will never get D[v] below infinity. That’s
because we’ll never find any shortcuts to improve D[v].

• Assumeashortestpathtovisformedbyapathfromstouandanedgefromutov. Now, if D[u] is correct at any time before relaxing the edge from u to v, then D[v] is correct at all times afterward. The path defined by P[v] will also be correct.

• Let [s, a, b, ... , z, v] be a shortest path from s to v. Assume all the edges (s,a), (a,b), ... , (z,v) in the path have been relaxed in order. Then D[v] and P[v] will be correct. It doesn’t matter if other relax operations have been performed in between.

[最后这个是路径松弛性质，也就是后面的Bellman-Ford算法的核心]

对于单对节点间最短路径问题，如果每条边的权值都一样(或者说边一样长)的话，使用前面的BFS就可以得到结果了([第5节遍历中介绍了](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-traversal/))；如果图是没有环的有向图，那么我们还可以用前面动规中的DAG图最短路径算法来求解([第8节动态规划中介绍了](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-dynamic-programming/))，但是，现实中的图总是有环的，边的权值总是不同的，所以我们还需要其他的算法！

首先我们来实现下[之前学过的松弛技术relaxtion](http://hujiaweibujidao.github.io/blog/2014/07/01/python-algorithms-induction/)，代码中D保存各个节点的到源点的距离的估计(上界值)，P保存对应节点的前驱节点，W保存边的权值，其中不存在的边的权值为inf。松弛就是说，假设节点 u 和节点 v 事先都有一个距离的上界(例如测试代码中的7和13)，如果现在要松弛边(u,v)，也就是对从节点 u 通过边(u,v)到达节点 v 得到的节点 v 的距离估计值(7+3=10)和原来的节点 v 的距离估计值(13)进行比较，如果前者更小的话，就表示我们可以放弃节点 v 以前确定的从源点到它那里的路线，改成从节点 u 到节点 v 这条路线距离会更短些，这也就是发生了一次松弛！(测试代码中10<13，的确发生了松弛，此时D[v]变成10，而它的前驱节点也变成了 u)

```python
#relaxtion
inf = float('inf')
def relax(W, u, v, D, P):
    d = D.get(u,inf) + W[u][v]                  # Possible shortcut estimate
    if d < D.get(v,inf):                        # Is it really a shortcut?
        D[v], P[v] = d, u                       # Update estimate and parent
        return True                             # There was a change!

#测试代码
u = 0; v = 1
D, W, P = {}, {u:{v:3}}, {}
D[u] = 7
D[v] = 13
print D[u] # 7
print D[v] # 13
print W[u][v] # 3
relax(W, u, v, D, P) # True
print D[v] # 10
D[v] = 8
relax(W, u, v, D, P)
print D[v] # 8
```

显然，如果你随机地对边进行松弛，那么与该边有关的节点的距离值估计就会慢慢地变得更加准确，这样的改进会在整个图中进行传播，如果一直这么松弛下去的话，最终整个图所有节点的距离值都不会发生变化的时候我们就得到了正确的解。

**每次松弛可以看作是向最终解前进了“一步”，我们的目标自然是希望松弛的次数越少越好，关键就是要确定松弛的次数和松弛的顺序**(好的松弛顺序可以让我们直接朝着最优解前进，缩短算法运行时间)，后面要介绍的图中的Bellman-Ford算法、Dijkstra算法以及DAG图上的最短路径问题都是如此。

现在我们考虑一个问题，如果我们对图中的所有边都松弛一遍会怎样？可能部分顶点的距离估计值有所改进对吧，那如果再对图中的所有边都松弛一遍又会怎样呢？可能又有部分顶点的距离估计值有所改进对吧，那到底什么时候才会没有改进呢？到底什么时候可以停止了呢？

这个问题可以这么思考，假设从节点 s 到节点 v 要经过这么一条路径`p=<v0, v1, v2, v3 ... vk>`，此时v0=s, vk=v，那除了起点 s 之外，这条路径总共经过了其他 k 个顶点对吧，k 肯定小于 |V|-1 对吧，也就是说从节点 s 到节点 v 要经过一条最多只有(|V|-1)条边的路径，因为每遍松弛都是松弛所有边，那么肯定会松弛路径p中的所有边，我们可以保险地认为第 i 次循环就松弛边$$<v_{i-1}, v_{i}>$$，这样的话经过 k 次松弛遍历，我们肯定能够得到节点 v 的准确的距离值，再根据这条路径最多只有(|V|-1)条边，也就说明了我们最多只要循环地对图中的所有边都松弛(|V|-1)遍就可以得到所有节点的最短距离值！

