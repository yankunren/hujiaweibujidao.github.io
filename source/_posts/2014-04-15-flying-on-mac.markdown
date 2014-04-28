---
layout: post
title: "Flying on Mac"
date: 2014-04-15 13:39
comments: true
categories: mac
---

该博文记录Mac使用中出现的一些问题，包括Mac中的一些软件出现异常的解决方案，使我们能够`Flying on Mac`，一直更新中...


1.如果Mou渲染Math公式有问题的话，尝试在第一行加上如下js，其src为：

```
<!-- import js for mathjax -->
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=default"></script>
```

该链接指向的是Mathjax的js，用来渲染Math公式，Mou支持Mathjax。为了减轻Octopress加载的负担，可以只在需要使用Mathjax的博文中添加一行js即可，不需要将它放在自定义的`head.html`文件中。

不知为何，最近加上了这句Math公式还是没有显示出来，貌似Mou并没有去加载这个js的样子，于是我尝试在浏览器中直接访问，将这个js中的所有内容复制进来，这样Mou有显示正常了，数学公式都没有问题！ :-) 如果你不能访问，放心，我已经将这个js的源码放在[这个Gist中](https://gist.github.com/hujiaweibujidao/11146289)。

如果还是不行的话，那么建议使用[stackedit](https://stackedit.io/ )，感谢@beader的建议！还有一个问题是stackedit是在线编辑的，图片要保存到Google Driver中(或者有个特定的网址)，另外，它和Mou中内置的MathJax的渲染解析工具略有不同，例如对于行内Math的插入上，这时候推荐按照[这位博主的方式修改](http://blog-jfttt.herokuapp.com/blog/2013/12/26/add-latex/)，添加下面的代码：

```
<!-- mathjax config similar to math.stackexchange -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  jax: ["input/TeX", "output/HTML-CSS"],
  tex2jax: {
    inlineMath: [ ['$', '$'] ],
    displayMath: [ ['$$', '$$']],
    processEscapes: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
  },
  messageStyle: "none",
  "HTML-CSS": { preferredFont: "TeX", availableFonts: ["STIX","TeX"] }
});
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>
```

测试：The *Gamma function* satisfying $\Gamma(n) = (n-1)!\quad\forall
n\in\mathbb N$ is via the Euler integral

$$
\Gamma(z) = \int_0^\infty t^{z-1}e^{-t}dt\,.
$$

另外，它还是存在些问题，关于inline Math公式的问题，推荐将Octopress中的Markdown引擎换成Kramdown，[参考教程](http://yanping.me/cn/blog/2012/03/10/octopress-with-latex/)，另外，使用inline Math和使用block Math一样，都是两个连着的美元符。

bug：我发现在Math公式中写入`|`，即取绝对值符号的话会影响排版，暂时想到的解决方案是转义，换成`\|`，它会换成双竖线，即取2范数的符号，不少情况下，不影响思考，嘿嘿。


<!-- mathjax config similar to math.stackexchange -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  jax: ["input/TeX", "output/HTML-CSS"],
  tex2jax: {
    inlineMath: [ ['$', '$'] ],
    displayMath: [ ['$$', '$$']],
    processEscapes: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
  },
  messageStyle: "none",
  "HTML-CSS": { preferredFont: "TeX", availableFonts: ["STIX","TeX"] }
});
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>
