---
layout: post
title: "Python Algorithms - Trees"
date: 2014-05-08 20:00
comments: true
categories: algorithm
published: true
---

参考内容：

1.[Problem Solving with Python](http://interactivepython.org/courselib/static/pythonds/index.html)

Chapter 6 Trees and Tree Algorithms   

2.[算法导论](http://en.wikipedia.org/wiki/Introduction_to_Algorithms)

#### 树的总结 

1.二叉搜索树 [on_wiki](http://zh.wikipedia.org/wiki/%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9)：一种特殊的二叉树，它满足下面的性质：任何一个节点的key值都比它左子树上的节点的key值要大，但是比它右子树上的节点的key值要小。节点插入，删除等操作的时间复杂度都是$O(log_{2}n)$

难点在于删除节点的操作：

![image](http://hujiaweibujidao.github.io/images/201405/bst_del_wiki.png)

**引用开始** [一份不错的讲解[来自博客园](http://www.cnblogs.com/Anker/archive/2013/01/28/2880581.html)]

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

参考内容1中在第三种情况下使用的是wiki中的第二种方案，并且是使用直接后继来代替要删除的节点。

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

如果原始的列表是基本有序的，那么得到的二叉树的高度会很高，变成一个扭曲的二叉树。

![image](http://hujiaweibujidao.github.io/images/201405/bst_worst.png)

8.平衡二叉查找树：为了避免得到前面提到的扭曲的二叉查找树，就有了平衡二叉查找树的概念

AVL是最先发明的平衡二叉树，它得名于它的发明者G.M. Adelson-Velsky和E.M. Landis，他们在1962年的论文《An algorithm for the organization of information》中发表了它。

[on_wiki](http://zh.wikipedia.org/wiki/AVL%E6%A0%91)

AVL树的基本操作的实现

![image](http://hujiaweibujidao.github.io/images/201405/avl_operations.png)

如何进行旋转

![image](http://hujiaweibujidao.github.io/images/201405/avl_rotate.png)

旋转的实现描述

![image](http://hujiaweibujidao.github.io/images/201405/avl_rotatedetails.png)

[参考内容1关于AVL树的讲解](http://interactivepython.org/courselib/static/pythonds/Trees/balanced.html) ---> [如果访问较慢可以点击这里下载](http://hujiaweibujidao.github.io/files/avltrees.pdf)

(1)平衡因子：左子树与右子树的高度之差

![image](http://hujiaweibujidao.github.io/images/201405/avl_bf.png)

(2)分析为什么AVL树能够对查找，插入，删除操作都达到$O(logn)$的效率

其中关于斐波那契数列在N很大的时候后项与前项之商接近黄金分割比可见[斐波那契数列on_wiki](http://zh.wikipedia.org/wiki/%E6%96%90%E6%B3%A2%E9%82%A3%E5%A5%91%E6%95%B8)

![image](http://hujiaweibujidao.github.io/images/201405/avl1.png)
![image](http://hujiaweibujidao.github.io/images/201405/avl2.png)

(3)左旋，右旋以及左右旋和右左旋

左旋：如果新的根节点有左孩子结点，那么左孩子结点就成为原来的根节点的右孩子结点

![image](http://hujiaweibujidao.github.io/images/201405/avl_left.png)

右旋：如果新的根节点有右孩子结点，那么右孩子结点就成为原来的根节点的左孩子结点

![image](http://hujiaweibujidao.github.io/images/201405/avl_right.png)

一种特殊的情况，单一的左旋和右旋都不行，不停地重复交替，所以需要左右旋(或者右左旋)

![image](http://hujiaweibujidao.github.io/images/201405/avl_leftright.png)

![image](http://hujiaweibujidao.github.io/images/201405/avl_leftright2.png)

(4)如何在不重新计算子树的高度情况下修改旋转前的根节点和旋转后的根节点的平衡因子值

下面是左旋的例子

![image](http://hujiaweibujidao.github.io/images/201405/avl_rebal1.png)
![image](http://hujiaweibujidao.github.io/images/201405/avl_rebal2.png)



