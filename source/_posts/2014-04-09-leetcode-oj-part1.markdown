---
layout: post
title: "LeetCode OJ Part1"
date: 2014-04-09 18:18
comments: true
categories: algorithm
published: false
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

2.可以使用计算直线的斜率的办法，个人觉得可能精度不对导致误差所以不是很好，但是OJ通过测试没有问题，如果仔细来算的话，我觉得应该采用下面的式子来判断点$P(x_{3},y_{3})$在由点$P(x_{1},y_{1})$和点$P(x_{2},y_{2})$组成的直线上，要注意该直线可能是垂直于x轴的哟。

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




To be continued......


