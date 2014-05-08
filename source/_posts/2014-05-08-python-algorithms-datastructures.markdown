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

Chapter 2 Algorithm Analysis   
Chapter 3 Basic Data Structures   
Chapter 6 Trees and Tree Algorithms   

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

![image](http://hujiaweibujidao.github.io/images/201405/queue.png)

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

![image](http://hujiaweibujidao.github.io/images/201405/deque.png)

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

5.二叉树：一个节点最多有两个孩子节点的树。如果是从0索引开始存储，那么对应于节点p的孩子节点是2p+1和2p+2两个节点，相反，节点p的父亲节点是(p-1)/2位置上的点

二叉树的应用很多，比如对算术表达式建立一颗二叉树可以清楚看出表达式是如何计算的(详情请见参考内容1)，二叉树的变种可以得到其他的有一定特性的数据结构，例如后面的二叉堆。二叉树的三种遍历方法(前序，中序，后序)同样有很多的应用，比较简单，略过。

![image](http://hujiaweibujidao.github.io/images/201405/bt2.png)

第一种，直接使用list来实现二叉树，可读性差

```python
def binary_tree(r):
    return [r, [], []]
def insert_left(root, new_branch):
    t = root.pop(1)
    if len(t) > 1:
        #new_branch becomes the left node of root, and original left
        #node t becomes left node of new_branch, right node is none
        root.insert(1, [new_branch, t, []])
    else:
        root.insert(1, [new_branch, [], []])
    return root
def insert_right(root, new_branch):
    t = root.pop(2)
    if len(t) > 1:
        root.insert(2, [new_branch, [], t])
    else:
        root.insert(2, [new_branch, [], []])
    return root
def get_root_val(root):
    return root[0]
def set_root_val(root, new_val):
    root[0] = new_val
def get_left_child(root):
    return root[1]
def get_right_child(root):
    return root[2]

r = binary_tree(3)
insert_left(r, 4)
insert_left(r, 5)
insert_right(r, 6)
insert_right(r, 7)
print(r)
l = get_left_child(r)
print(l)
set_root_val(l, 9)
print(r)
insert_left(l, 11)
print(r)
print(get_right_child(get_right_child(r)))
```

第二种，使用类的形式定义二叉树，可读性更好

![image](http://hujiaweibujidao.github.io/images/201405/btclass.png)

```
class BinaryTree:
    def __init__(self, root):
        self.key = root
        self.left_child = None
        self.right_child = None
    def insert_left(self, new_node):
        if self.left_child == None:
            self.left_child = BinaryTree(new_node)
        else:
            t = BinaryTree(new_node)
            t.left_child = self.left_child
            self.left_child = t
    def insert_right(self, new_node):
        if self.right_child == None:
            self.right_child = BinaryTree(new_node)
        else:
            t = BinaryTree(new_node)
            t.right_child = self.right_child
            self.right_child = t
    def get_right_child(self):
        return self.right_child
    def get_left_child(self):
        return self.left_child
    def set_root_val(self, obj):
        self.key = obj
    def get_root_val(self):
        return self.key

r = BinaryTree('a')
print(r.get_root_val())
print(r.get_left_child())
r.insert_left('b')
print(r.get_left_child())
print(r.get_left_child().get_root_val())
r.insert_right('c')
print(r.get_right_child())
print(r.get_right_child().get_root_val())
r.get_right_child().set_root_val('hello')
print(r.get_right_child().get_root_val())
```

6.二叉堆：根据堆的性质又可以分为最小堆和最大堆，是一种非常好的优先队列。在最小堆中孩子节点一定大于等于其父亲节点，最大堆反之。二叉堆实际上一棵完全二叉树，并且满足堆的性质。对于插入和查找操作的时间复杂度度都是$O(nlogn)$。

它的插入操作图示：

![image](http://hujiaweibujidao.github.io/images/201405/heapinsert.png)

去除根节点的操作图示：

![image](http://hujiaweibujidao.github.io/images/201405/heapdel.png)

注意，下面的实现中默认在初始的堆列表中插入了一个元素0，这样做可以保证堆的真实有效的元素个数和current_size值对应，而且最后一个元素的索引就对应了current_size。

```python
class BinHeap:
    def __init__(self):
        self.heap_list = [0]
        self.current_size = 0
    def perc_up(self, i):
        while i // 2 > 0: # >0 means this node is still available
            if self.heap_list[i] < self.heap_list[i // 2]:
                tmp = self.heap_list[i // 2]
                self.heap_list[i // 2] = self.heap_list[i]
                self.heap_list[i] = tmp
            i = i // 2
    def insert(self, k):
        self.heap_list.append(k)
        self.current_size = self.current_size + 1
        self.perc_up(self.current_size)
    def perc_down(self, i):
        while (i * 2) <= self.current_size:
            mc = self.min_child(i)
            if self.heap_list[i] > self.heap_list[mc]:
                tmp = self.heap_list[i]
                self.heap_list[i] = self.heap_list[mc]
                self.heap_list[mc] = tmp
            i = mc
    def min_child(self, i):
        if i * 2 + 1 > self.current_size:
            return i * 2
        else:
            if self.heap_list[i * 2] < self.heap_list[i * 2 + 1]:
                return i * 2
            else:
                return i * 2 + 1
    def del_min(self):
        ret_val = self.heap_list[1]
        self.heap_list[1] = self.heap_list[self.current_size]
        self.current_size = self.current_size - 1
        self.heap_list.pop()
        self.perc_down(1)
        return ret_val

    def build_heap(self, a_list):
        i = len(a_list) // 2
        self.current_size = len(a_list)
        self.heap_list = [0] + a_list[:] #append original list
        while (i > 0):
            #build the heap we only need to deal the first part!
            self.perc_down(i)
            i=i-1

a_list=[9, 6, 5, 2, 3];
bh=BinHeap();
bh.build_heap(a_list);
print(bh.heap_list)
print(bh.current_size)
bh.insert(10)
bh.insert(7)
print(bh.heap_list)
bh.del_min();
print(bh.heap_list)
print(bh.current_size)
```

7.二叉搜索树 [on_wiki](http://zh.wikipedia.org/wiki/%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9)：一种特殊的二叉树，它满足下面的性质：任何一个节点的key值都比它左子树上的节点的key值要大，但是比它右子树上的节点的key值要小。

难点在于删除节点的操作：

> From wiki 

> 在二叉查找树删去一个结点，分三种情况讨论：

> 1.若*p结点为叶子结点，即PL(左子树)和PR(右子树)均为空树。由于删去叶子结点不破坏整棵树的结构，则只需修改其双亲结点的指针即可。

> 2.若*p结点只有左子树PL或右子树PR，此时只要令PL或PR直接成为其双亲结点*f的左子树（当*p是左子树）或右子树（当*p是右子树）即可，作此修改也不破坏二叉查找树的特性。

> 3.若*p结点的左子树和右子树均不空。**在删去*p之后，为保持其它元素之间的相对位置不变，可按中序遍历保持有序进行调整**，可以有两种做法：其一是令*p的左子树为*f的左/右(依*p是*f的左子树还是右子树而定)子树，*s为*p左子树的最右下的结点，而*p的右子树为*s的右子树；其二是令*p的直接前驱（in-order predecessor）或直接后继（in-order successor）替代*p，然后再从二叉查找树中删去它的直接前驱（或直接后继）。
>

**引用开始** 一份不错的讲解[来自博客园](http://www.cnblogs.com/Anker/archive/2013/01/28/2880581.html)

----------

1.在二叉查找树中找某个节点的前驱和后继节点

给定一个二叉查找树中的结点，找出在中序遍历顺序下某个节点的前驱和后继。如果树中所有关键字都不相同，则某一结点x的前驱就是小于key[x]的所有关键字中最大的那个结点，后继即是大于key[x]中的所有关键字中最小的那个结点。根据二叉查找树的结构和性质，不用对关键字做任何比较，就可以找到某个结点的前驱和后继。

查找前驱步骤：先判断x是否有左子树，如果有则在left[x]中查找关键字最大的结点，即是x的前驱。如果没有左子树，则从x继续向上执行此操作，直到遇到某个结点是其父节点的右孩子结点，**此时该父节点就是前驱**。例如下图查找结点7的前驱结点6过程：

![image](http://hujiaweibujidao.github.io/images/201405/bst_pre.png)

伪代码

```cpp
TREE_SUCCESSOR(x)
    if right[x] != NULL
        then return TREE_MINMUM(right(x))
    y=parent[x]
    while y!= NULL and x ==left[y]
           do x = y
              y=parent[y]
    return y
```

查找后继步骤：先判断x是否有右子树，如果有则在right[x]中查找关键字最小的结点，即使x的后继。如果没有右子树，则从x的父节点开始向上查找，直到遇到某个结点是其父结点的左儿子的结点时为止，**此时该父节点就是后继**。例如下图查找结点13的后继结点15的过程：

![image](http://hujiaweibujidao.github.io/images/201405/bst_later.png)

伪代码

```cpp
TREE_PROCESSOR(x)
    if right[x] != NULL
        then return TREE_MINMUM(right(x))
    y=parent[x]
    while y!= NULL and x ==right[y]
           do x = y
              y=parent[y]
    return y
```

2.删除节点操作

(1)结点z没有左右子树，则修改其父节点p[z]，使其为NULL。

![image](http://hujiaweibujidao.github.io/images/201405/bst_del1.png)

(2)如果结点z只有一个子树（左子树或者右子树），通过在其子结点与父节点建立一条链来删除z。

![image](http://hujiaweibujidao.github.io/images/201405/bst_del2.png)

(3)如果z有两个子女，则先删除z的后继y（y没有左孩子），在用y的内容来替代z的内容。

![image](http://hujiaweibujidao.github.io/images/201405/bst_del3.png)

----------

**引用结束**

[wiki](http://zh.wikipedia.org/wiki/%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9)上的python代码实现节点删除操作，比后面的python代码更加简洁易懂

代码采用了递归的形式处理，相当于只需要考虑了要删除的节点就在当前位置该如何处理，然后，对于只有左孩子节点或者只有右孩子结点或者没有孩子节点的情况直接进行节点覆盖就行了，但是，对于复杂的第三种情况，在左右孩子节点都存在的情况下，只需从它的右孩子结点中找到最小的那个元素即为要删除节点的后继(同理，可以找到左孩子结点中找到最大的那个元素，即为要删除节点的前驱)，然后复制后继节点中的内容到要删除的节点，最后删除后继节点即可。

```python
def find_min(self):   # Gets minimum node (leftmost leaf) in a subtree
    current_node = self
    while current_node.left_child:
        current_node = current_node.left_child
    return current_node
 
def replace_node_in_parent(self, new_value=None):
    if self.parent:
        if self == self.parent.left_child:
            self.parent.left_child = new_value
        else:
            self.parent.right_child = new_value
    if new_value:
        new_value.parent = self.parent
 
def binary_tree_delete(self, key):
    if key < self.key:
        self.left_child.binary_tree_delete(key)
    elif key > self.key:
        self.right_child.binary_tree_delete(key)
    else: # delete the key here
        if self.left_child and self.right_child: # if both children are present
            successor = self.right_child.find_min()
            self.key = successor.key
            successor.binary_tree_delete(successor.key)
        elif self.left_child:   # if the node has only a *left* child
            self.replace_node_in_parent(self.left_child)
        elif self.right_child:  # if the node has only a *right* child
            self.replace_node_in_parent(self.right_child)
        else: # this node has no children
            self.replace_node_in_parent(None)
```

参考内容1中在第三种情况下使用的是第二种方案，并且是使用直接前驱来代替要删除的节点。

完整实现[参考内容1中的代码，相当冗余，但是可读性较好，个人认为如果要实现删除节点操作的话建议参考wiki上python代码的实现，也可以查看参考内容1中对代码的详细解释]

```python
class TreeNode:
    def __init__(self,key,val,left=None,right=None,parent=None):
        self.key = key
        self.payload = val
        self.leftChild = left
        self.rightChild = right
        self.parent = parent

    def hasLeftChild(self):
        return self.leftChild

    def hasRightChild(self):
        return self.rightChild

    def isLeftChild(self):
        return self.parent and self.parent.leftChild == self

    def isRightChild(self):
        return self.parent and self.parent.rightChild == self

    def isRoot(self):
        return not self.parent

    def isLeaf(self):
        return not (self.rightChild or self.leftChild)

    def hasAnyChildren(self):
        return self.rightChild or self.leftChild

    def hasBothChildren(self):
        return self.rightChild and self.leftChild

    def replaceNodeData(self,key,value,lc,rc):
        self.key = key
        self.payload = value
        self.leftChild = lc
        self.rightChild = rc
        if self.hasLeftChild():
            self.leftChild.parent = self
        if self.hasRightChild():
            self.rightChild.parent = self


class BinarySearchTree:

    def __init__(self):
        self.root = None
        self.size = 0

    def length(self):
        return self.size

    def __len__(self):
        return self.size

    def put(self,key,val):
        if self.root:
            self._put(key,val,self.root)
        else:
            self.root = TreeNode(key,val)
        self.size = self.size + 1

    def _put(self,key,val,currentNode):
        if key < currentNode.key:
            if currentNode.hasLeftChild():
                self._put(key,val,currentNode.leftChild)
            else:
                currentNode.leftChild = TreeNode(key,val,parent=currentNode)
        else:
            if currentNode.hasRightChild():
                self._put(key,val,currentNode.rightChild)
            else:
                currentNode.rightChild = TreeNode(key,val,parent=currentNode)

    def __setitem__(self,k,v):
        self.put(k,v)

    def get(self,key):
        if self.root:
            res = self._get(key,self.root)
            if res:
                return res.payload
            else:
                return None
        else:
            return None

    def _get(self,key,currentNode):
        if not currentNode:
            return None
        elif currentNode.key == key:
            return currentNode
        elif key < currentNode.key:
            return self._get(key,currentNode.leftChild)
        else:
            return self._get(key,currentNode.rightChild)

    def __getitem__(self,key):
        return self.get(key)

    def __contains__(self,key):
        if self._get(key,self.root):
            return True
        else:
            return False

    def delete(self,key):
        if self.size > 1:
            nodeToRemove = self._get(key,self.root)
            if nodeToRemove:
                self.remove(nodeToRemove)
                self.size = self.size-1
            else:
                raise KeyError('Error, key not in tree')
        elif self.size == 1 and self.root.key == key:
            self.root = None
            self.size = self.size - 1
        else:
            raise KeyError('Error, key not in tree')

    def __delitem__(self,key):
        self.delete(key)

    def spliceOut(self):
        if self.isLeaf():
            if self.isLeftChild():
                self.parent.leftChild = None
            else:
                self.parent.rightChild = None
        elif self.hasAnyChildren():
            if self.hasLeftChild():
                if self.isLeftChild():
                    self.parent.leftChild = self.leftChild
                else:
                    self.parent.rightChild = self.leftChild
                self.leftChild.parent = self.parent
            else:
                if self.isLeftChild():
                    self.parent.leftChild = self.rightChild
                else:
                    self.parent.rightChild = self.rightChild
                self.rightChild.parent = self.parent

    def findSuccessor(self):
        succ = None
        if self.hasRightChild():
            succ = self.rightChild.findMin()
        else:
            if self.parent:
                if self.isLeftChild():
                    succ = self.parent
                else:
                    self.parent.rightChild = None
                    succ = self.parent.findSuccessor()
                    self.parent.rightChild = self
        return succ

    def findMin(self):
        current = self
        while current.hasLeftChild():
            current = current.leftChild
        return current

    def remove(self,currentNode):
        if currentNode.isLeaf(): #leaf
            if currentNode == currentNode.parent.leftChild:
                currentNode.parent.leftChild = None
            else:
                currentNode.parent.rightChild = None
        elif currentNode.hasBothChildren(): #interior
            succ = currentNode.findSuccessor()
            succ.spliceOut()
            currentNode.key = succ.key
            currentNode.payload = succ.payload
        else: # this node has one child
            if currentNode.hasLeftChild():
                if currentNode.isLeftChild():
                    currentNode.leftChild.parent = currentNode.parent
                    currentNode.parent.leftChild = currentNode.leftChild
                elif currentNode.isRightChild():
                    currentNode.leftChild.parent = currentNode.parent
                    currentNode.parent.rightChild = currentNode.leftChild
                else:
                    currentNode.replaceNodeData(currentNode.leftChild.key,
                                                currentNode.leftChild.payload,
                                                currentNode.leftChild.leftChild,
                                                currentNode.leftChild.rightChild)
            else:
                if currentNode.isLeftChild():
                    currentNode.rightChild.parent = currentNode.parent
                    currentNode.parent.leftChild = currentNode.rightChild
                elif currentNode.isRightChild():
                    currentNode.rightChild.parent = currentNode.parent
                    currentNode.parent.rightChild = currentNode.rightChild
                else:
                    currentNode.replaceNodeData(currentNode.rightChild.key,
                                                currentNode.rightChild.payload,
                                                currentNode.rightChild.leftChild,
                                                currentNode.rightChild.rightChild)


mytree = BinarySearchTree()
mytree[3]="red"
mytree[4]="blue"
mytree[6]="yellow"
mytree[2]="at"

print(mytree[6])
print(mytree[2])

```
