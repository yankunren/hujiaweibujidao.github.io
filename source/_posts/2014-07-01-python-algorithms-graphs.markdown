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

这个问题可以这么思考，假设从源点 s 到节点 v 的最短路径是`p=<v0, v1, v2, v3 ... vk>`，此时v0=s, vk=v，那除了源点 s 之外，这条路径总共经过了其他 k 个顶点对吧，k 肯定小于 |V|-1 对吧，也就是说从节点 s 到节点 v 要经过一条最多只有(|V|-1)条边的路径，因为每遍松弛都是松弛所有边，那么肯定会松弛路径p中的所有边，我们可以保险地认为第 i 次循环就松弛边$$<v_{i-1}, v_{i}>$$，这样的话经过 k 次松弛遍历，我们肯定能够得到节点 v 的最短路径值，再根据这条路径最多只有(|V|-1)条边，也就说明了我们最多只要循环地对图中的所有边都松弛(|V|-1)遍就可以得到所有节点的最短路径值！上面的思路就是Bellman-Ford算法了，时间复杂度是$O(VE)$。

下面看下算法导论上的Bellman-Ford算法的示例图

![image](http://hujiaweibujidao.github.io/images/algos/bellmanford.png)

[上图的解释，需要注意的是，如果边的松弛顺序不同，可能中间得到的结果不同，但是最后的结果都是一样的：The execution of the Bellman-Ford algorithm. The source is vertex s. The d values are shown within the vertices, and shaded edges indicate predecessor values: if edge (u, v) is shaded, then π[v] = u. In this particular example, each pass relaxes the edges in the order (t, x), (t, y), (t, z), (x, t), (y, x), (y, z), (z, x), (z, s), (s, t), (s, y). (a) The situation just before the first pass over the edges. (b)-(e) The situation after each successive pass over the edges. The d and π values in part (e) are the final values. The Bellman-Ford algorithm returns TRUE in this example.]

上面的分析很好，但是我们漏考虑了一个关键问题，那就是如果图中存在负权回路的话不论我们松弛多少遍，该回路上的节点的最短路径值都还是会减小。所以，假设我们在 (|V|-1) 次遍历之后再遍历一次，如果还有节点的最短路径减小的话就说明图中存在负权回路！这就引出了Bellman-Ford算法的一个重要作用：判断图中是否存在负权回路。

```python
#Bellman-Ford算法
def bellman_ford(G, s):
    D, P = {s:0}, {}                            # Zero-dist to s; no parents
    for rnd in G:                               # n = len(G) rounds
        changed = False                         # No changes in round so far
        for u in G:                             # For every from-node...
            for v in G[u]:                      # ... and its to-nodes...
                if relax(G, u, v, D, P):        # Shortcut to v from u?
                    changed = True              # Yes! So something changed
        if not changed: break                   # No change in round: Done
    else:                                       # Not done before round n?
        raise ValueError('negative cycle')      # Negative cycle detected
    return D, P                                 # Otherwise: D and P correct

#测试代码
s, t, x, y, z = range(5)
W = {
    s: {t:6, y:7},
    t: {x:5, y:8, z:-4},
    x: {t:-2},
    y: {x:-3, z:9},
    z: {s:2, x:7}
    }
D, P = bellman_ford(W, s)
print [D[v] for v in [s, t, x, y, z]] # [0, 2, 4, 7, -2]
print s not in P # True
print [P[v] for v in [t, x, y, z]] == [x, y, s, t] # True
W[s][t] = -100
print bellman_ford(W, s)
# Traceback (most recent call last):
#         ...
# ValueError: negative cycle
```

前面我们在动态规划中介绍了一个DAG图中的最短路径算法，它的时间复杂度是$O(V+E)$的，下面我们用松弛的思路来快速回顾一下那个算法的迭代版本。因为它先对顶点进行了拓扑排序，所以它是一个典型的通过修改边松弛的顺序来提高算法运行速度的算法。也就是说，我们沿着拓扑排序得到的节点的顺序来进行松弛，怎么松弛呢？当我们到达一个节点时我们就松弛这个节点的出边，为什么这种方式能够奏效呢？

这里还是假设从源点 s 到节点 v 的最短路径是`p=<v0, v1, v2, v3 ... vk>`，此时v0=s, vk=v，如果我们到达了节点 v，那么说明源点 s 和节点 v 之间的那些点都已经经过了(节点是经过了拓扑排序的哟)，而且它们的边也都已经松弛过了，所以当我们到达节点 v 时我们能够直接得到源点 s 到节点 v 的最短路径值。

![image](http://hujiaweibujidao.github.io/images/algos/dagsp.png)

[上图的解释：The execution of the algorithm for shortest paths in a directed acyclic graph. The vertices are topologically sorted from left to right. The source vertex is s. The d values are shown within the vertices, and shaded edges indicate the π values. (a) The situation before the first iteration of the for loop of lines 3-5. (b)-(g) The situation after each iteration of the for loop of lines 3-5. The newly blackened vertex in each iteration was used as u in that iteration. The values shown in part (g) are the final values.]

接下来我们看下Dijkstra算法，它看起来非常像Prim算法，同样是基于贪心策略，每次贪心地选择松弛距离最近的“边缘节点”所在的那条边(另一个节点在已经包含的节点集合中)，那为什么这种方式也能奏效呢？因为算法导论给出了完整的证明，不信你去看看！呵呵，开玩笑的啦，如果光说有证明就用不着我来写文章咯，其实是因为Dijkstra算法隐藏了一个DAG最短路径算法，而DAG的最短路径问题我们上面已经介绍过了，仔细看也不难发现，它们的区别就是松弛的顺序不同，DAG最短路径算法是先进行拓扑排序然后松弛，而Dijkstra算法是每次直接贪心地选择一条边来松弛。那为什么Dijkstra算法隐藏了一个DAG？

----------

[**这里我想了好久怎么解释，但是还是觉得原文实在太精彩，我水平也实在有限难以说明白，故这里附上原文，前面部分作者解释了为什么DAG最短路径算法中边松弛的顺序和拓扑排序有关，然后作者继续解释(Dijkstra算法中)下一个要加入(到已包含的节点集合)的节点必须有正确的距离估计值，最后作者解释了这个节点肯定是那个具有最小距离估计值的节点！一切顺风顺水，但是有一个重点，那就是边不能有负权值，这是Dijkstra算法的重要前提条件**]

作者下面的解释中提到的图9-1

![image](http://hujiaweibujidao.github.io/images/algos/dijkstra0.png)

To get thing started, we can imagine that we already know the distances from the start node to each of the others. We don’t, of course, but this imaginary situation can help our reasoning. Imagine ordering the nodes, left to right, based on their distance. What happens? For the general case—not much. However, we’re assuming that we have no negative edge weights, and that makes all the difference.

Because all edges are positive, the only nodes that can contribute to a node’s solution will lie to its left in our hypothetical ordering. It will be impossible to locate a node to the right that will help us find a shortcut, because this node is further away, and could only give us a shortcut if it had a negative back edge. The positive back edges are completely useless to us, and aren’t part of the problem structure. What remains, then, is a DAG, and the topological ordering we’d like to use is exactly the hypothetical ordering we started with: nodes sorted by their actual distance. See Figure 9-1 for an illustration of this structure. (I’ll get back to the question marks in a minute.)

Predictably enough, we now hit the major gap in the solution: it’s totally circular. In uncovering the basic problem structure (decomposing into subproblems or finding the hidden DAG), we’ve assumed that we’ve already solved the problem. The reasoning has still been useful, though, because we now have something specific to look for. We want to find the ordering—and we can find it with our trusty workhorse, induction!

Consider, again, Figure 9-1. Assume that the highlighted node is the one we’re trying to identify in our inductive step (meaning that the earlier ones have been identified and already have correct distance estimates). Just like in the ordinary DAG shortest path problem, we’ll be relaxing all out-edges for each node, as soon as we’ve identified it and determined its correct distance. That means that we’ve relaxed the edges out of all earlier nodes. We haven’t relaxed the out-edges of later nodes, but as discussed, they can’t matter: the distance estimates of these later nodes are upper bounds, and the back-edges have positive weights, so there’s no way they can contribute to a shortcut.

This means (by the earlier relaxation properties or the discussion of the DAG shortest path algorithm in Chapter 8) that the next node must have a correct distance estimate. That is, the highlighted node in Figure 9-1 must by now have received its correct distance estimate, because we’ve relaxed all edges out of the first three nodes. This is very good news, and all that remains is to figure out which node it is. We still don’t really know what the ordering is, remember? We’re figuring out the topological sorting as we go along, step by step.

There is only one node that could possibly be the next one, of course:3 the one with the lowest distance estimate. We know it’s next in the sorted order, and we know it has a correct estimate; because these estimates are upper bounds, none of the later nodes could possibly have lower estimates. Cool, no? And now, by induction, we’ve solved the problem. We just relax all out-edges of the nodes of each node in distance order—which means always taking the one with the lowest estimate next.

----------

下图是算法导论中Dijkstra算法的示例图，可以参考下

![image](http://hujiaweibujidao.github.io/images/algos/dijkstra.png)

[上图的解释：The execution of Dijkstra's algorithm. The source s is the leftmost vertex. The shortest-path estimates are shown within the vertices, and shaded edges indicate predecessor values. Black vertices are in the set S, and white vertices are in the min-priority queue Q = V - S. (a) The situation just before the first iteration of the while loop of lines 4-8. The shaded vertex has the minimum d value and is chosen as vertex u in line 5. (b)-(f) The situation after each successive iteration of the while loop. The shaded vertex in each part is chosen as vertex u in line 5 of the next iteration. The d and π values shown in part (f) are the final values.]

下面是Dijkstra算法的实现

```
#Dijkstra算法
from heapq import heappush, heappop

def dijkstra(G, s):
    D, P, Q, S = {s:0}, {}, [(0,s)], set()      # Est., tree, queue, visited
    while Q:                                    # Still unprocessed nodes?
        _, u = heappop(Q)                       # Node with lowest estimate
        if u in S: continue                     # Already visited? Skip it
        S.add(u)                                # We've visited it now
        for v in G[u]:                          # Go through all its neighbors
            relax(G, u, v, D, P)                # Relax the out-edge
            heappush(Q, (D[v], v))              # Add to queue, w/est. as pri
    return D, P                                 # Final D and P returned

#测试代码
s, t, x, y, z = range(5)
W = {
    s: {t:10, y:5},
    t: {x:1, y:2},
    x: {z:4},
    y: {t:3, x:9, z:2},
    z: {x:6, s:7}
    }
D, P = dijkstra(W, s)
print [D[v] for v in [s, t, x, y, z]] # [0, 8, 9, 5, 7]
print s not in P # True
print [P[v] for v in [t, x, y, z]] == [y, t, s, y] # True
```

Dijkstra算法和Prim算法的实现很像，也和BFS算法实现很像，其实，如果我们把每条权值为 w 的边(u,v)想象成节点 u 和节点 v 中间有 (w-1) 个节点，且每条边都是权值为1的一条路径的话，BFS算法其实就和Dijkstra算法差不多了。

Dijkstra算法的时间复杂度和使用的优先队列有关，上面的实现用的是最小堆，所以时间复杂度是$O(m lg n)$，其中 m 是边数，n 是节点数。


