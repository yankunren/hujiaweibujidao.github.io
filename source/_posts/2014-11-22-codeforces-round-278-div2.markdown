---
layout: post
title: "CodeForces Round 278 Div2"
date: 2014-11-22 11:57
comments: true
categories: oj codeforces
published: false
---

昨晚又熬夜参加CodeForces了，比赛拖延到1点半才开始，状态果然又是很糟糕，目前解决前面2道题


####[Giga Tower](http://codeforces.com/contest/488/problem/A)

这题的大意是给你一个数字，让你求最近的大于这个数字并且含有数字8的数字与这个数字的差值，比如数字9，找到的数字应该是18，差值就是18-9=9。这题我又想多了，心想直接求肯定不行，然后设计了一个看起来不错的得到大于或者小于(用于负数)一个数字的最近的含有数字8的数字，结果写了蛮久了还是有不少bug，没敢提交，后来看到那么多人做出来了，就觉得这题没准直接累加就行，因为毕竟遇到8很容易，一般情况下都能很快得到那个目标数字，结果一试还真是行！

```java
import java.util.Scanner;

public class Test278A2 {


    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        int b = 1;
        int a = cin.nextInt();
        String s = String.valueOf(++a);
        while (!s.contains("8")) {
            b++;
            s = String.valueOf(++a);
        }
        System.out.println(b);
    }

}

```


####[Candy Boxes](http://codeforces.com/contest/488/problem/B)

这题首先告诉我们4个盒子里面的糖果数目满足如下条件

$$x4-x1=\frac{x2+x3}/2$$





