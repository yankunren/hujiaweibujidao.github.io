---
layout: post
title: "Python Algorithms - C5 Traversal"
date: 2014-07-01 10:50
comments: true
categories: algorithm
published: true
---

**<center>Python算法设计篇(5)</center>**
**<center>逸夫图书馆, 2014/7/1</center>**

### <center>Chapter 5: Traversal</center>

> You are in a narrow hallway. This continues for several metres and ends in a doorway. Halfway along the passage you can see an archway where some steps lead downwards. Will you go forwards to the door (turn to 5), or creep down the steps (turn to 344)?      
  ——Steve Jackson, Citadel of Chaos

本节主要介绍图的遍历算法BFS和DFS，以及DFS衍生出的寻找图的(强)连通分量的算法

Traversal就是遍历，主要是对图的遍历，也就是遍历图中的每个节点。对一个节点的遍历有两个阶段，首先是发现(discover)，然后是访问(visit)。遍历的重要性自然不必说，图中有几个算法和遍历没有关系？！

[算法导论对于发现和访问区别的非常明显，对图的算法讲解地特别好，在遍历节点的时候给节点标注它的发现节点时间d[v]和结束访问时间f[v]，然后由这些时间的一些规律得到了不少实用的定理，感兴趣不妨阅读下]

图的连通分量是图的一个最大子图，在这个子图中任何两个节点之间都是相互可达的。我们本节的重点就是想想怎么找到一个图的连通分量呢？

一个很明显的想法是，我们从一个顶点出发，沿着边一直走，慢慢地扩大子图，直到子图不能再扩大了停止，我们就得到了一个连通分量对吧，我们怎么确定我们真的是找到了一个完整的连通分量呢？可以看下作者给出的解释，类似上节的Induction，我们思考从 i-1 到 i 的过程，只要我们保证增加了这个节点后子图仍然是连通的就对了。

Let’s look at the following related problem. Show that you can order the nodes in a connected graph, V1, V2, ... Vn, so that for any i = 1...n, the subgraph over V1, ... , Vi is connected. If we can show this and we can figure out how to do the ordering, we can go through all the nodes in a connected component and know when they’re all used up.

How do we do this? Thinking inductively, we need to get from i -1 to i. We know that the subgraph over the i -1 first nodes is connected. What next? Well, because there are paths between any pair of nodes, consider a node u in the first i -1 nodes and a node v in the remainder. On the path from u to v, consider the last node that is in the component we’ve built so far, as well as the first node outside it. Let’s call them x and y. Clearly there must be an edge between them, so adding y to the nodes of our growing component keeps it connected, and we’ve shown what we set out to show.

经过上面的一番思考，我们就知道了如何找连通分量：从一个顶点开始，沿着它的边找到其他的节点(或者说站在这个节点上看，看能够发现哪些节点)，然后就是不断地向已有的连通分量中添加节点，使得连通分量内部依然满足连通性质。如果我们按照上面的思路一直做下去，我们就得到了一棵树，一棵遍历树，它也是我们遍历的分量的一棵生成树。这个算法的具体实现时，我们要记录“边缘节点”，也就是那些和已得到的连通分量中的节点相连的节点，这就像是一个待办事项(to-do list)一样，而前面加入的节点就是标记为已完成的(checked off)。

这里作者举了一个很有意思的例子，一个角色扮演的游戏，如下图所示，我们可以将房间看作是节点，将房间的门看作是节点之间的边，走过的轨迹就是遍历树。这么看的话，房间就分成了三种：(1)我们已经经过的房间；(2)我们已经经过的房间附近的房间，也就是马上可以进入的房间；(3)“黑屋”，我们甚至都不知道它们是否存在，存在的话也不知道在哪里。

![image](http://hujiaweibujidao.github.io/images/algos/dungeon.png)

根据上面的分析可以写出下面的遍历函数`walk`，其中参数`S`暂时没有用，它在后面求强连通分量时需要，表示的是一个“禁区”(forbidden zone)，也就是不要去访问这些节点。

注意下面的`difference`函数的使用，参数可以是多个，也就是说返回的集合中的元素在参数中都没有存在，此外，参数也不一定是set，也可以是dict或者list，只要是可迭代的(iterables)即可。

```python
# Walking Through a Connected Component of a Graph Represented Using Adjacency Sets
def walk(G, s, S=set()):                        # Walk the graph from node s
    P, Q = dict(), set()                        # Predecessors + "to do" queue
    P[s] = None                                 # s has no predecessor
    Q.add(s)                                    # We plan on starting with s
    while Q:                                    # Still nodes to visit
        u = Q.pop()                             # Pick one, arbitrarily
        for v in G[u].difference(P, S):         # New nodes?
            Q.add(v)                            # We plan to visit them!
            P[v] = u                            # Remember where we came from
    return P                                    # The traversal tree
```

我们可以用下面代码来测试下，得到的结果没有问题

```
def some_graph():
    a, b, c, d, e, f, g, h = range(8)
    N = [
        [b, c, d, e, f],    # a
        [c, e],             # b
        [d],                # c
        [e],                # d
        [f],                # e
        [c, g, h],          # f
        [f, h],             # g
        [f, g]              # h
    ]
    return N

G = some_graph()
for i in range(len(G)): G[i] = set(G[i])
print list(walk(G,0)) #[0, 1, 2, 3, 4, 5, 6, 7]
```

上面的`walk`函数只适用于无向图，而且只能找到一个从参数`s`出发的连通分量，要想得到全部的连通分量需要修改下

```
def components(G):                              # The connected components
    comp = []
    seen = set()                                # Nodes we've already seen
    for u in G:                                 # Try every starting point
        if u in seen: continue                  # Seen? Ignore it
        C = walk(G, u)                          # Traverse component
        seen.update(C)                          # Add keys of C to seen
        comp.append(C)                          # Collect the components
    return comp
```

用下面的代码来测试下，得到的结果没有问题

```
G = {
    0: set([1, 2]),
    1: set([0, 2]),
    2: set([0, 1]),
    3: set([4, 5]),
    4: set([3, 5]),
    5: set([3, 4])
    }

print [list(sorted(C)) for C in components(G)]  #[[0, 1, 2], [3, 4, 5]]
```

至此我们就完成了一个时间复杂度为$\Theta(E+V)$的求无向图的连通分量的算法，因为每条边和每个顶点都要访问一次。[这个时间复杂度会经常看到，例如拓扑排序，强连通分量都是它]

[中间部分作者介绍了欧拉回路和哈密顿回路：前者是经过图中的所有边一次，然后回到起点；后者是经过图中的所有顶点一次，然后回到起点。网上资料甚多，感兴趣自行了解]

下面我们看下迷宫问题，如下图所示，原始问题是一个人在公园中走路，结果走不出来了，即使是按照“左手准则”(也就是但凡遇到交叉口一直向左转)走下去，如果走着走着回到了原来的起点，那么就会陷入无限的循环中！有意思的是，左边的迷宫可以通过“左手准则”转换成右边的树型结构。

[**注：具体的转换方式我还未明白，下面是作者给出的构造说明**]

Here the “keep one hand on the wall” strategy will work nicely. One way of seeing why it works is to observe that the maze really has only one inner wall (or, to put it another way, if you put wallpaper inside it, you could use one continuous strip). Look at the outer square. As long as you’re not allowed to create cycles, any obstacles you draw have to be connected to the it in exactly one place, and this doesn’t create any problems for the left-hand rule. Following this traversal strategy, you’ll discover all nodes and walk every passage twice (once in either direction).

![image](http://hujiaweibujidao.github.io/images/algos/maze.png)

上面的迷宫实际上就是为了引出深度优先搜索(DFS)，每次到了一个交叉口的时候，可能我们可以向左走，也可以向右走，选择是有不少，但是我们要向一直走下去的话就只能选择其中的一个方向，如果我们发现这个方向走不出去的话，我们就回溯回来，选择一个刚才没选过的方向继续尝试下去。

基于上面的想法可以写出下面递归版本的DFS

```
def rec_dfs(G, s, S=None):
    if S is None: S = set()                     # Initialize the history
    S.add(s)                                    # We've visited s
    for u in G[s]:                              # Explore neighbors
        if u in S: continue                     # Already visited: Skip
        rec_dfs(G, u, S)                        # New: Explore recursively
    return S # For testing

G = some_graph()
for i in range(len(G)): G[i] = set(G[i])
print list(rec_dfs(G, 0))   #[0, 1, 2, 3, 4, 5, 6, 7]
```

很自然的我们想到要将递归版本改成迭代版本的

```
def iter_dfs(G, s):
    S, Q = set(), []                            # Visited-set and queue
    Q.append(s)                                 # We plan on visiting s
    while Q:                                    # Planned nodes left?
        u = Q.pop()                             # Get one
        if u in S: continue                     # Already visited? Skip it
        S.add(u)                                # We've visited it now
        Q.extend(G[u])                          # Schedule all neighbors
        yield u                                 # Report u as visited

G = some_graph()
for i in range(len(G)): G[i] = set(G[i])
print list(iter_dfs(G, 0))  #[0, 5, 7, 6, 2, 3, 4, 1]
```




[编写中]







