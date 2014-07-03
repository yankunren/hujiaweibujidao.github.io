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





[编写中]







