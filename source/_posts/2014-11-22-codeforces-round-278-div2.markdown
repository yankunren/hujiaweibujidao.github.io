---
layout: post
title: "CodeForces Round 278 Div2"
date: 2014-11-22 11:57
comments: true
categories: oj codeforces
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

$$x4-x1=\frac{x2+x3}{2}=\frac{x1+x2+x3+x4}{4}, x1 \le x2 \le x3 \le x4$$

也就是说这四个数字的range，median和average都相同，现在只告诉你其中
n($$0 \le n \le 4$$)个数字，让你求其他的数字，如果有很多的解只需要输出其中的一个即可，如果任何数字都不能满足的话输出NO。

这题其实很简单，首先从上面的连等式中很快能够得到下面的结果

$$x1=\frac{x2+x3}{4}, x4=3*x1$$

其中x4是x1的3倍是很关键的信息，然后分n分别为0，1，2，3，4这5种情况讨论就行了，难点在于n=2和n=3。

当n=2时，先对这两个已知数排序，然后分别假设它们是(x1, x2)或者(x1, x3)等等所有可能的组合，根据条件求出剩下的两个数字，然后判断这四个数字是否满足条件，如果满足的话那就输出，否则输出NO。

同理，当n=3时，分别假设剩下的那个数字是x1或者x2或者x3或者x4，求出来之后验证即可。

```
import java.util.Arrays;
import java.util.Scanner;

/**
 * hujiawei - 14/11/22.
 */
public class Test278B {


    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);

        int n = cin.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = cin.nextInt();
        }

        if (n == 0) {
            System.out.println("YES");
            System.out.println("1");
            System.out.println("2");
            System.out.println("2");
            System.out.println("3");
        } else if (n == 1) {
            System.out.println("YES");
            System.out.println(2 * a[0]);
            System.out.println(2 * a[0]);
            System.out.println(3 * a[0]);
        } else if (n == 4) {
            Arrays.sort(a);
            if (check(a[0], a[1], a[2], a[3])) {
                System.out.println("YES");
            } else {
                System.out.println("NO");
            }
        } else if (n == 3) {
            Arrays.sort(a);
            int a1 = a[2] / 3;
            if (check(a1, a[0], a[1], a[2])) {
                System.out.println("YES");
                System.out.println(a1);
                return;
            }
            int a4 = a[0] * 3;
            if (check(a[0], a[1], a[2], a4)) {
                System.out.println("YES");
                System.out.println(a4);
                return;
            }
            int a2 = 4 * a[0] - a[1];
            if (check(a[0], a2, a[1], a[2])) {
                System.out.println("YES");
                System.out.println(a2);
                return;
            }
            int a3 = 4 * a[0] - a[1];
            if (check(a[0], a[1], a3, a[2])) {
                System.out.println("YES");
                System.out.println(a3);
                return;
            }
            System.out.println("NO");
        } else {
            Arrays.sort(a);
            int a1, a2, a3, a4;
            //a1,a4
            a1 = a[0];
            a4 = a[1];
            if (a4 == 3 * a1) {
                a2 = (a1 + a4) / 2;
                a3 = (a1 + a4) / 2;
                if (check(a1, a2, a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a2);
                    System.out.println(a3);
                    return;
                }
            }
            //a1,a2
            a1 = a[0];
            a2 = a[1];
            if (4 * a1 > a2) {
                a3 = 4 * a1 - a2;
                a4 = 3 * a1;
                if (check(a1, a2, a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a3);
                    System.out.println(a4);
                    return;
                }
            }
            //a1,a3
            a1 = a[0];
            a3 = a[1];
            if (4 * a1 > a3) {
                a2 = 4 * a1 - a3;
                a4 = 3 * a1;
                if (check(a1, a2, a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a2);
                    System.out.println(a4);
                    return;
                }
            }
            //a2,a3
            a2 = a[0];
            a3 = a[1];
            if ((a2 + a3) % 4 == 0) {
                a1 = (a2 + a3) / 4;
                a4 = 3 * a1;
                if (check(a1, a2, a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a1);
                    System.out.println(a4);
                    return;
                }
            }
            //a2,a4 and a3,a4
            a2 = a[0];
            a4 = a[1];
            if (a4 % 3 == 0) {
                a1 = a4 / 3;
                a3 = 4 * a1 - a2;
                if (check(a1, a2,a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a1);
                    System.out.println(a3);
                    return;
                }
            }
            //a3,a4
            a3 = a[0];
            a4 = a[1];
            if (a4 % 3 == 0) {
                a1 = a4 / 3;
                a2 = 4 * a1 - a3;
                if (check(a1, a2,a3, a4)) {
                    System.out.println("YES");
                    System.out.println(a1);
                    System.out.println(a2);
                    return;
                }
            }
            //
            System.out.println("NO");
        }
    }

    private static boolean check(int a1, int a2, int a3, int a4) {
        if (a1 <= a2 && a2 <= a3 && a3 <= a4 && (a4 - a1) == (a2 + a3) / 2 && (a4 - a1) == (a1 + a2 + a3 + a4) / 4) {
            return true;
        }
        return false;
    }

}
```
