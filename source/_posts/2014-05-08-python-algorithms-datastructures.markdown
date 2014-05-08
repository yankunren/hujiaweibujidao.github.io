---
layout: post
title: "Python Algorithms - Data Structures"
date: 2014-05-08 10:00
comments: true
categories: algorithm
published: true
---

参考内容：

1.[Problem Solving with Python](http://interactivepython.org/courselib/static/pythonds/index.html)
Chapter5: Search and Sorting [online_link](http://interactivepython.org/courselib/static/pythonds/SortSearch/sorting.html)

2.[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)

#### 数据结构总结 

1.栈：LIFO结构，后进先出

栈能解决的问题很多，比如逆波兰表达式求值，得到一个十进制数的二进制表达，检查括号匹配问题以及图的深度搜索等等，都很简单，可查看参考内容1学习。

![image](http://hujiaweibujidao.github.io/images/201405/stack.png)

```python
# Completed implementation of a stack ADT
class Stack:
    def __init__(self):
       self.items = []
    def is_empty(self):
       return self.items == []
    def push(self, item):
       self.items.append(item)
    def pop(self):
       return self.items.pop()
    def peek(self):
       return self.items[len(self.items)-1]
    def size(self):
       return len(self.items)

s = Stack()
print(s.is_empty())
s.push(4)
s.push('dog')
print(s.peek())
s.push(True)
print(s.size())
print(s.is_empty())
s.push(8.4)
print(s.pop())
print(s.pop())
print(s.size())
```

2.队列：FIFO结构，先进先出

队列一般用于解决需要优先队列的问题或者进行广度优先搜索的问题，也很简单。

```python
# Completed implementation of a queue ADT
class Queue:
   def __init__(self):
      self.items = []
   def is_empty(self):
      return self.items == []
   def enqueue(self, item):
      self.items.insert(0,item)
   def dequeue(self):
      return self.items.pop()
   def size(self):
      return len(self.items)

q = Queue()
q.enqueue('hello')
q.enqueue('dog')
print(q.items)
q.enqueue(3)
q.dequeue()
print(q.items)
```

3.双向队列：左右两边都可以插入和删除的队列

下面的实现是以右端为front，左端为rear

```python
# Completed implementation of a deque ADT
class Deque:
   def __init__(self):
      self.items = []
   def is_empty(self):
      return self.items == []
   def add_front(self, item):
       self.items.append(item)
   def add_rear(self, item):
      self.items.insert(0,item)
   def remove_front(self):
      return self.items.pop()
   def remove_rear(self):
      return self.items.pop(0)
   def size(self):
      return len(self.items)

dq=Deque();
dq.add_front('dog');
dq.add_rear('cat');
print(dq.items)
dq.remove_front();
dq.add_front('pig');
print(dq.items)
```

