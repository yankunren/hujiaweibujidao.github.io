---
layout: post
title: "LeetCode OJ Part1"
date: 2014-04-09 18:18
comments: true
categories: oj
published: false
---
为了找以后工作嘛，挑战下LeetCode OJ，顺序可能与OJ上的顺序不同哟，慢慢增加...

注，我附上的代码都包含了测试代码，提交的代码中不需要测试部分，我保留是因为某些题中有些测试样例比较特殊，为了提醒自己不要再犯同样的错！

1.Reverse Words in a String

字符串题，字符串分割再反转

```
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

注：在Java中`6/(-132)=0`但是在Python中`6/(-132)=-1`，OJ认为0是正解，所以Python中进行除法运算时使用`int(float(m)/float(n))`。

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

注：相同的点重复计算点个数




