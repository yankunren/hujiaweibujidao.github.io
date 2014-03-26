---
layout: post
title: "develop with opencv on mac"
date: 2014-03-13 19:23
comments: true
categories: opencv
---

今天大部分时间都是在琢磨如何在Mac OS X上进行OpenCV项目的开发，最终选择的开发工具是Xcode(版本是4.6.1)，使用的OpenCV版本是2.4.6。

#### 1.安装CMake

安装CMake可以使用MacPorts，也可以使用Homebrew，如果以前安装过两者中的任何一个就用那个进行安装吧，我用的是Homebrew，命令如下：

```
sudo port install cmake //macports
sudo brew install cmake //homebrew
```

#### 2.编译OpenCV

OpenCV下载地址：[http://sourceforge.net/projects/opencvlibrary/](http://sourceforge.net/projects/opencvlibrary/)

目前最新版本是2.4.8，我使用的是2.4.6，下载后解压，执行下面代码：

```
cd <path-to-opencv-source>
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. 
make
sudo make install
```
[完成之后在`/usr/local/include`目录下便有了`opencv`和`opencv2`两个目录，在`/usr/local/lib`目录下有很多的`opencv`相关的动态库，例如`libopencv_core.dylib`等等]

其他参考内容：[Building OpenCV from Source Using CMake, Using the Command Line](http://docs.opencv.org/trunk/doc/tutorials/introduction/linux_install/linux_install.html#linux-installation)


#### 3.使用Xcode进行OpenCV项目开发


1.Open Xcode, choose `New  -> New Project -> Command Line Tool`

2.Name it and select `C++` for type

3.Click on your project from the left menu. Click the `build settings` tab from the top. Filter all. Scroll to `Search Paths`. Under `header search paths`, for debug and release, set the path to `/usr/local/include`. Under `library search paths`, set the path to `$(PROJECT_DIR)`. Finally, check if `C++ standard library` is `libstdc++` or not, if not, change it to this!

4.Click on your project from the left menu. `File->New->New Group`, Name the group `OpenCV Frameworks`. 

5.Select the folder (group) you just labeled, `OpenCV Frameworks` in the left menu. Go to `File -> add Files`, Type `/`, which will allow you to manually go to a folder. Go to -> `/usr/local/lib`

6.Select both of these files, `libopencv_core.dylib`, `libopencv_highgui.dylib`, and click `Add`. (you may need to add other library files from this folder to run other code.)

7.You must include this line of code in the beginning of your main.cpp file:
`#include <opencv2/opencv.hpp>`

可以修改main.cpp，代码如下，运行结果就是显示一张指定的图片。

```
#include <opencv2/opencv.hpp>
using namespace cv;
int main(int argc, char** argv) {
	Mat image;
	image = imread("/Users/hujiawei/Pictures/others/other_naicha/naicha.jpg", 1);
    namedWindow("Display Image", WINDOW_AUTOSIZE);
	imshow("Display Image", image);
	waitKey(0);
	return 0;
}
```

其他参考内容：[Installing OpenCV](https://sites.google.com/site/learningopencv1/installing-opencv)


#### 4.其他问题

如果使用Eclipse开发的，首先要安装CDT插件，其次需要在opencv项目属性的`C/C++ General -> Paths and Symbols`中添加其他的路径，包括OpenCV所需的头文件，类似`<opencv_sdk>/sdk/native/jni/include`，此外，关于编译器GCC，我本机只是安装了Command Line Tools，但是该工具在系统升级到Maverick(10.9)时会出现一个链接问题，10.8及以下版本应该是没有问题。

```
There are two implementations of the standard C++ library available on OS X: libstdc++ and libc++. They are not binary compatible and libMLi3 requires libstdc++.
On 10.8 and earlier libstdc++ is chosen by default, on 10.9 libc++ is chosen by default. To ensure compatibility with libMLi3, we need to choose libstdc++ manually.
To do this, add -stdlib=libstdc++ to the linking command.
```

如果遇到问题`ld: symbol(s) not found for architecture x86_64`，检查代码中是否需要包含还没有添加的库文件。

更多相关内容参考：

[C++ linking error after upgrading to Mac OS X 10.9 / Xcode 5.0.1](http://stackoverflow.com/questions/19637164/c-linking-error-after-upgrading-to-mac-os-x-10-9-xcode-5-0-1)

[MathLink linking error after OS X 10.9 (Mavericks) upgrade](http://mathematica.stackexchange.com/questions/34692/mathlink-linking-error-after-os-x-10-9-mavericks-upgrade)

