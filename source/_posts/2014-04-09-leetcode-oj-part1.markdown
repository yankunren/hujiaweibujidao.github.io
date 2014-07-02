---
layout: post
title: "LeetCode OJ Part1"
date: 2014-04-09 18:18
comments: true
categories: algorithm
published: true
---

为了找以后工作嘛，挑战下LeetCode OJ，顺序可能与OJ上的顺序不同哟，慢慢增加...

```
注：我附上的代码都包含了测试代码，提交的代码中不需要测试部分，我保留是因为某些题中有些测试样例比较特殊，为了提醒自己不要再犯同样的错！
```

1.Reverse Words in a String

字符串题，字符串分割再反转

```python
class Solution:
    # @param s, a string
    # @return a string
    def reverseWords(self, s):
        l = s.strip().split()
        l.reverse()
        return ' '.join(l)
if __name__ == '__main__':
    teststrs = ('helo world', ' hel hj ')
    so = Solution()
    for test in teststrs:
        print so.reverseWords(test)    
```

2.Evaluate Reverse Polish Notation

栈的利用，逆波兰表达式求值

**注：在Java中`6/(-132)=0`但是在Python中`6/(-132)=-1`，OJ认为0是正解，所以Python中进行除法运算时使用`int(float(m)/float(n))`。**

```
class Solution:
    # @param tokens, a list of string
    # @return an integer
    def evalRPN(self, tokens):
        stack = []
        result = 0
        for token in tokens:
            if (token in '+-*/'):
                result = self.calculate(token, int(stack.pop()), int(stack.pop()))
                stack.append(result)
            else:
                stack.append(int(token))
        return stack.pop()
    def calculate(self, token, n, m):
        if token.__eq__('+'):
            return n + m
        elif token.__eq__('-'):
            return m - n
        elif token.__eq__('*'):
            return n * m
        elif token.__eq__('/'):
            return int(float(m) / float(n))
if __name__ == '__main__':
    tests = [["18"],["10","6","9","3","+","-11","*","/","*","17","+","5","+"]];
    so = Solution()
    for test in tests:
        print so.evalRPN(test)  
```

3.Max Points on a Line

在平面上的点集合中找到在同一条线上最多的点集合的个数

注：1.[相同的点重复计算点个数](http://oj.leetcode.com/discuss/1023/input-3-10-0-2-0-2-3-10-output-3-expected-4)

2.可以使用计算直线的斜率的办法，个人觉得可能精度不对导致误差所以不是很好，但是OJ通过测试没有问题，如果仔细来算的话，我觉得应该采用下面的式子来判断点$$P(x_{3},y_{3})$$在由点$$P(x_{1},y_{1})$$和点$$P(x_{2},y_{2})$$组成的直线上，要注意该直线可能是垂直于x轴的哟。

$$
(y_{2}-y_{1})(x_{3}-x_{1})=(y_{3}-y_{1})(x_{2}-x_{1})
$$

AC的代码修改自[这里](http://oj.leetcode.com/discuss/3899/python-solution)，将j的范围进行了修改，稍微提高了原来代码的性能。

```
# Definition for a point
class Point:
    def __init__(self, a=0, b=0):
        self.x = a
        self.y = b

class Solution:
    # @param points, a list of Points
    # @return an integer
    def maxPoints(self, points):
        lines={}
        if points==[]: return 0
        if len(points)==1: return 1
        maxPoints=2 #init points 2
        for i in range(len(points)):
            countlist={}
            duplicate=0

            #point i and point j form a line!
            for j in range(i+1,len(points)):
                if i==j: continue
                if points[i].x==points[j].x and points[i].y==points[j].y:
                    duplicate+=1 #duplicate point! not count here!
                    continue
                deltax=points[j].x-points[i].x
                deltay=points[j].y-points[i].y
                if (deltax==0): #vertical line, use x to be the key!
                    key=(deltax)
                else:
                    key=float(deltay)/deltax
                if key not in countlist.keys():
                    countlist[key]=2 # not exist this line, so add 2
                else: countlist[key]+=1 #line exists, so add only 1

            #if point i is in that final line, what's its max points?
            if countlist.values() !=[]:
                #add duplicate here!
                maxPoints=max(maxPoints,max(countlist.values())+duplicate)
            else: #if countlist.values() ==[] that is to say all points are duplicated!
                return max(maxPoints,duplicate+1)

        return maxPoints

if __name__=='__main__':
    # [(3,10),(0,2),(0,2),(3,10)]
    points=[Point(3,10),Point(0,2),Point(0,2),Point(3,10)]
    print(Solution().maxPoints(points))
```

4.Sort List

数据结构题，在常数空间复杂度以及$O(nlogn)$的空间复杂度情况下对一个单链表进行排序

注：1.有不少人用快排超时了，因为快排在最坏的情况下时间复杂度是$O(n^2)$，所以不能通过，但是如果是[使用一种特别的partition函数的话可以通过](http://oj.leetcode.com/discuss/584/think-the-complexity-of-my-method-is-nlogn-why-still-gets-tle)，具体为啥未考究，[这个也可以参考](http://oj.leetcode.com/discuss/3344/anyone-solve-this-in-python)。

2.我用的是合并排序，时间肯定能过，但是用了递归，空间不能满足。[提交的话要把ListNode类注释掉，不然会报错]

```
# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # @param head, a ListNode
    # @return a ListNode
    def sortList(self, head):
        pointer=head
        len=0
        while pointer: #calculate the length
            len=len+1
            pointer=pointer.next
        head=self.mergesort(head,len)
        pointer=head
        while len>1:
            pointer=pointer.next
            len=len-1
        if pointer:
            pointer.next=None
        return head

    def mergesort(self,node,len):
        if len<= 1:
            return node
        mid=len//2
        pointer=node
        fh=node #fisrt head
        fl=mid #first len
        t=mid
        while t>0:
            t=t-1
            pointer=pointer.next
        #fisrt: mid (head to mid) second: len-mid (mid+1 to tail)
        sh=pointer #second head
        sl=len-mid #second len
        fh=self.mergesort(fh,fl)
        sh=self.mergesort(sh,sl)
        newlist=ListNode(0) #
        pointer=newlist
        while fl>0 and sl>0: #do not use `fh and sh`, fh.next is not None!
            if fh.val < sh.val:
                pointer.next=fh
                pointer=pointer.next
                fh=fh.next
                fl=fl-1
            else:
                pointer.next=sh
                pointer=pointer.next
                sh=sh.next
                sl=sl-1
        while fl>0:
            pointer.next=fh
            pointer=pointer.next
            fh=fh.next
            fl=fl-1
        while sl>0:
            pointer.next=sh
            pointer=pointer.next
            sh=sh.next
            sl=sl-1
        if newlist.next:
            return newlist.next
        else:
            return None

if __name__=='__main__':
    head=ListNode(2)
    head.next=ListNode(9)
    head.next.next=ListNode(5)
    head.next.next.next=ListNode(4)
    head=Solution().sortList(head)
    while head:
        print(head.val)
        head=head.next
    pass
```


To be continued......


