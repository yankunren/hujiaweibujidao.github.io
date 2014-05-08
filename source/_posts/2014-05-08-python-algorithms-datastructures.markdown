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
Chapter 2 and Chapter 3

2.[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)

#### 数据结构总结 

1.Python内置数据结构的性能分析

(1)List

List的各个操作的时间复杂度

![image](http://hujiaweibujidao.github.io/images/201405/listoptime.png)

同样是执行1000次创建一个包含1-1000的列表，四种方式使用的时间差距很大！使用append比逐次增加要快很多，另外，使用python的列表产生式比append要快，而第四种方式更加快！

```python
def test1():
   l = []
   for i in range(1000):
      l = l + [i]
def test2():
   l = []
   for i in range(1000):
      l.append(i)
def test3():
   l = [i for i in range(1000)]
def test4():
   l = list(range(1000))

# Import the timeit module -> import timeit
# Import the Timer class defined in the module
from timeit import Timer
# If the above line is excluded, you need to replace Timer with
# timeit.Timer when defining a Timer object
t1 = Timer("test1()", "from __main__ import test1")
print("concat ",t1.timeit(number=1000), "milliseconds")
t2 = Timer("test2()", "from __main__ import test2")
print("append ",t2.timeit(number=1000), "milliseconds")
t3 = Timer("test3()", "from __main__ import test3")
print("comprehension ",t3.timeit(number=1000), "milliseconds")
t4 = Timer("test4()", "from __main__ import test4")
print("list range ",t4.timeit(number=1000), "milliseconds")

# ('concat ', 1.7890608310699463, 'milliseconds')
# ('append ', 0.13796091079711914, 'milliseconds')
# ('comprehension ', 0.05671119689941406, 'milliseconds')
# ('list range ', 0.014147043228149414, 'milliseconds')
```

`timeit`模块的解释：

![image](http://hujiaweibujidao.github.io/images/201405/timeit.png)

测试pop操作：从结果可以看出，pop最后一个元素的效率远远高于pop第一个元素

```
x = list(range(2000000))
pop_zero = Timer("x.pop(0)","from __main__ import x")
print("pop_zero ",pop_zero.timeit(number=1000), "milliseconds")
x = list(range(2000000))
pop_end = Timer("x.pop()","from __main__ import x")
print("pop_end ",pop_end.timeit(number=1000), "milliseconds")

# ('pop_zero ', 1.9101738929748535, 'milliseconds')
# ('pop_end ', 0.00023603439331054688, 'milliseconds')
```

(2)Dictionary

Dictionary的各个操作的性能

![image](http://hujiaweibujidao.github.io/images/201405/dictionary.png)

Dictionary和List的性能比较：list基本上随着其元素的数目呈线性增长，而dictionary一直维持在很短很短的时间内(我的机子测试的结果都是`0.001ms`)。

```
import timeit
import random

for i in range(10000,1000001,20000):
    t = timeit.Timer("random.randrange(%d) in x"%i,"from __main__ import random,x")
    x = list(range(i))
    lst_time = t.timeit(number=1000)
    x = {j:None for j in range(i)}
    d_time = t.timeit(number=1000)
    print("%d,%10.3f,%10.3f" % (i, lst_time, d_time))
```

结果图

![image](http://hujiaweibujidao.github.io/images/201405/compare.png)

2.栈：LIFO结构，后进先出

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

3.队列：FIFO结构，先进先出

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

4.双向队列：左右两边都可以插入和删除的队列

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

