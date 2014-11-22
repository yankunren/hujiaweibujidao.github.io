---
layout: post
title: "CodeForces Round 277.5 Div2"
date: 2014-11-18 10:22
comments: true
categories: oj codeforces
---


昨晚熬夜刷了CodeForces Round 277.5 Div2，哎，果然很难适应这么晚做题，不在状态，一个小时后才进入状态了，结果比赛完了整个人就睡不着了。。。

这次写解题报告的人很靠谱啊，直接附上关键代码，哈哈哈

####[489A - SwapSort](http://codeforces.com/contest/489/problem/A)

这题很简单，大致就是让你通过不超过n次的数据交换排序一个长度为n的数组，其实用选择排序就行了嘛，我比赛的时候不知怎么搞的，首先想到快排，结果撸了两种快排，终于有一种快排过了pretests，但是后面的system tests就挂了。。。


```java
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

//http://codeforces.com/contest/489/problem/A

//选择排序，最多只需要n次交换

public class SwapSort2775A {

    private static ArrayList<ASwap2> swaps;

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        int n = cin.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = cin.nextInt();
        }
        swaps = new ArrayList<ASwap2>();
        int t;
        for (int i = 0; i < n; i++) {
            t = i;
            for (int k = i; k < n; k++) {
                if (a[k] < a[t]) t = k;//
            }
            if (t != i) {
                swaps.add(new ASwap2(t, i));
                int s = a[i];
                a[i] = a[t];
                a[t] = s;
            }
        }
        System.out.println(swaps.size());
        for (ASwap2 swap : swaps) {
            System.out.println(swap.x + " " + swap.y);
        }
    }

    static class ASwap2 {//

        int x, y;

        ASwap2(int x, int y) {
            this.x = x;
            this.y = y;
        }
    }

}
```

####[489B - BerSU Ball](http://codeforces.com/contest/489/problem/B)

这题大意是n个男孩m个女孩的舞蹈技能不同，匹配时要满足他们的技能差值不超过1，求最大匹配。我一看完了慌了，这么快就要二分图匹配了？可是当我快速复习二分图匹配(大神请尽情鄙视新手吧...)时发现，尼玛这题贪心就行了啊，结果一分钟一撸就过了！核心代码就像是在做合并排序的合并操作，用两个指针分别指向两个数组的当前元素下标，如果它们能满足配对就配对，然后两个指针都向后移动，不能的话数据较小的对应的指针向后移动就行了。


```
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Scanner;

//http://codeforces.com/contest/489/problem/B

//贪心

public class BerSUBall2775B {

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        int n = cin.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = cin.nextInt();
        }
        int m = cin.nextInt();
        int[] b = new int[m];
        for (int i = 0; i < m; i++) {
            b[i] = cin.nextInt();
        }
        Arrays.sort(a);
        Arrays.sort(b);
        int count = 0;
        int i = 0, j = 0;
        while (i < n && j < m) {
            if (Math.abs(a[i] - b[j]) <= 1) {
                i++;
                j++;
                count++;
            } else {
                if (a[i] < b[j]) {
                    i++;
                } else {
                    j++;
                }
            }
        }
        System.out.println(count);
    }

}
```

####[489C - Given Length and Sum of Digits...](http://codeforces.com/contest/489/problem/C)

这题大意是求由`m`位数字组成的且各位数字之和为`s`的最大数和最小数，最大数我们可以通过贪心的方式来得到，也就是从高位往低位开始设置每位的值，当前位总是取它能取的最大的那个数字，如果最终得到的最大数的最后一个数字不是`1`的话，那么翻转最大数就是最小数了，否则将最小数视为第一位数字是`1`，后面是满足由`m-1`位数字组成的且各位数字之和为`s-1`的最大数的翻转数，注意`m=1`的情况(被这个坑坑了好几次...)


```
import java.util.Scanner;

//http://codeforces.com/contest/489/problem/C

//贪心

public class GivenLengthandSumofDigits2775C {

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);

        int m = cin.nextInt();
        int s = cin.nextInt();

        if ((9 * m < s) || (s < 1 && m > 1)) {
            System.out.println("-1 -1");
            return;
        }

        String max = findMax(m, s);
        String min = "";

        //求最小值
        if (max.charAt(max.length() - 1) != '0') {
            min = new StringBuilder(max).reverse().toString();
            System.out.println(min + " " + max);
            return;
        }

        //特殊情况
        if (m == 1) {
            min = "" + s;
        } else {
            min = findMax(m - 1, s - 1);
            min = "1" + new StringBuilder(min).reverse().toString();
        }

        System.out.println(min + " " + max);
    }

    //求最大值
    static String findMax(int m, int s) {
        int k = 1;//当前第几位
        int r = s;//剩余的总和

        String max = "";
        while (k <= m) {
            if (r >= 9) {
                max = max + "9";
                r = r - 9;
            } else {
                max = max + r;
                r = 0;
            }
            k++;
        }
        return max;
    }

}
```

####[489D - Unbearable Controversy of Being](http://codeforces.com/contest/489/problem/D)

这题内容比较长，大致就是说给你一些节点和某些节点之间的边的信息，求出该图中有多少个如题目中图示给出的那样的菱形，即节点a可以通过节点b也可以通过节点d到达节点c。这道题目解题报告给出的解法就是枚举，遍历任何两个节点a和c，求出它们中间的候选节点b和d，简单的方法是考虑与a相邻的节点是否也与节点c相邻，如果是的话那么该节点算是一个候选节点。最后由于节点a和节点c之间的任何两个候选节点的组合都能得到所需的菱形，那么就是C(r,2)，所有的这些组合相加就是最终的解。

比较郁闷的是本题如果用Java来完成的话貌似一定需要精简代码，最好不要使用ArrayList等，而是使用原始的数组，以一定的空间来换时间，否则很容易超时。


```
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

//http://codeforces.com/contest/489/problem/D

//组合题，空间换时间

public class UnbearableControversyofBeing2775D {

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);

        int n = cin.nextInt();
        int[] s = new int[n];//s[i]=j表示节点i有j个邻居
        int[][] v = new int[n][n];//v[i][j]=1 表示节点i和节点j相连
        int[][] t = new int[n][n];//t[i][j]=k表示节点i第j个邻居是k

        int m = cin.nextInt();
        int a, b;
        for (int i = 0; i < m; i++) {
            a = cin.nextInt();
            b = cin.nextInt();
            v[a - 1][b - 1] = 1;
            t[a - 1][s[a - 1]] = b - 1;
            s[a - 1]++;
        }

        //
        int count = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i != j) {//not the same node
                    int r = 0, n1;
                    for (int k = 0; k < s[i]; k++) {
                        n1 = t[i][k];
                        if (n1 != i && n1 != j && v[n1][j] == 1) {//nodes.get(n1).contains(j)
                            r++;
                        }
                    }
                    count += r * (r - 1) / 2;//combination
                }
            }
        }
        System.out.println(count);
    }

}
```



后面的等做了再附上。



