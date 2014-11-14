---
layout: post
title: "BestCoder Round 17"
date: 2014-11-09 20:16
comments: true
categories: bestcoder oj
---

最近终于确定了接下来要做什么，为了明年能够顺利拿到offer，我要从平时开始多做题了，多思考，不再接什么项目了。搜索了一番发现了一些好的比赛，比如CodeForces和BestCoder，哈哈哈，说练就练！

下面是昨天注册参加的BestCoder Round 17，总共四道题，只搞定了两道，后面那道还被别人hack掉了，当时想过可能会超过int的表示范围，但是时间不多就没多想了，菜鸟阶段暂时只能如此了。

[Chessboard](http://acm.hdu.edu.cn/showproblem.php?pid=5100)

第一题是说用大小为 k*1 的方砖来填充 n*n 的棋盘，问棋盘中最多能够有多少个方格能够被覆盖。

[Matrix67](http://www.matrix67.com/blog/archives/5900) 在他的博客中具体地介绍过这个问题的解法，其实就是两种情况，一个是可以直观地尽可能多地覆盖，另一个是以风车形式覆盖，这题代码很好写，但是思路不好想。

BestCoder题解：

首先，若n<k，则棋盘连一个1×k的矩形都放不下，输出0。        
我们只需要考虑n≥k的情况。将棋盘类似于黑白染色，按(i+j)模k划分等价类，给每个格子标一个号。标号之后，会注意到每条从左下到右上的斜线数字都是相同的，那么对于s×s的格子，其内部数字有且恰好有2s−1种，所以当 $$s<=\frac{k}{2}$$ 的时候，内部数字有 $$floor(\frac{k}{2})*2−1<k$$ 种，所以不能有更佳的方案。从而证明最优的方案一定是仅剩下一个s×s的正方形区域没有被覆盖到，其中 $$s<=\frac{k}{2}$$。       
而令l=n mod k之后，根据l大小的不同，可以构造出中心为l×l或(k−l)×(k−l)的风车形图案，又通过上面证明这个l（或k−l）就是之前的s，所以是最优的。所以令l=n mod k，如果 $$l<=\frac{k}{2}$$，最多可覆盖的格子数即为 $$n^2−l^2$$，否则为 $$n^2−(k−l)^2$$，显然这样的方案是可以构造出来的（风车形）。


```java

import java.util.Scanner;

//http://acm.hdu.edu.cn/showproblem.php?pid=5100

//思路，根据n%k和k/2的大小关系来判断如何覆盖

public class Cheeseboard17A {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        while (t-- > 0) {
            int n = scanner.nextInt();
            int k = scanner.nextInt();
            if (k > n) {
                System.out.println("0");
                continue;
            }
            int m = n % k;
            if (m > k / 2) {
                System.out.println(n * n - (k - m) * (k - m));
            } else {
                System.out.println(n * n - m * m);
            }
        }
    }

}

```


[Select](http://acm.hdu.edu.cn/showproblem.php?pid=5101)

题目大意就是给定一些集合，选择两个来自不同集合的数，加和大于k，问有多少种选择方案。

思路：答案=从所有数中选择的两个加和大于k的数的方案数-在同一个集合中选择的两个加和大于k的数的方案数，而对于同一个集合中选择的两个加和大于k的方案数是可以直接排序然后利用单调性快速统计出来的。

实现：将满足条件的所有组合减去每个班级中满足条件的所有组合，求解时可以将所有学生视为一个新的班，先对所有班级的学生IQ值排序，某个班满足条件的组合数目类似二分策略的插入排序，就是要找到数组的某个子序列中大于等于某个数的所有数字的个数。


```
import java.util.Arrays;
import java.util.Scanner;

//http://acm.hdu.edu.cn/showproblem.php?pid=5101

public class Select17B2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        while (t-- > 0) {
            int n = scanner.nextInt();
            int s = scanner.nextInt();
            int[][] vs = new int[n][];
            int allm = 0;
            for (int i = 0; i < n; i++) {//获取数据
                int m = scanner.nextInt();
                allm += m;
                vs[i] = new int[m];
                for (int j = 0; j < m; j++) {
                    vs[i][j] = scanner.nextInt();
                }
            }
            //排序每个班级
            for (int i = 0; i < n; i++) {
                Arrays.sort(vs[i]);
            }
            //排序所有学生
            int offset = 0;
            int[] all = new int[allm];
            for (int i = 0; i < n; i++) {
                System.arraycopy(vs[i], 0, all, offset, vs[i].length);
                offset += vs[i].length;
            }
            Arrays.sort(all);

            long sum = getCount(all, s);
            //System.out.println(sum);
            for (int i = 0; i < n; i++) {
                sum -= getCount(vs[i], s);
            }
            System.out.println(sum);
        }
    }

    //得到一个数组中满足两个元素之和大于s的组合数
    private static long getCount(int[] all, int s) {
        long res = 0;
        for (int i = 0, l = all.length; i < l; i++) {
            if (all[i] >= s) {//这个数比s+1更大，那么后面的数都可以和它组合
                res += l - i - 1;//
            } else {//否则的话找到从后面哪个数字开始可以和它进行组合
                int r = s + 1 - all[i];
                res += bs(all, r, i + 1, l-1);
            }
        }
        return res;
    }

    //得到一个数组从from到end之间满足大于等于r的数字的个数 [二分查找]
    private static int bs(int[] vs, int r, int from, int end) {
        int len = end - from + 1;//
        if (len <= 0) return 0;
        int left = from, right = end, mid = 0;
        while (left <= right) {
            mid = (left + right) / 2;
            if (r <= vs[mid]) {
                right = mid - 1;
            } else if (r > vs[mid]) {
                left = mid + 1;
            }
        }
        return end - left + 1;
    }

}

```

后面的等我写好了再附上，嘿嘿嘿。





