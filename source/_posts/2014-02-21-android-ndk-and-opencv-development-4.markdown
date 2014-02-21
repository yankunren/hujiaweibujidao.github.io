---
layout: post
title: "android ndk and opencv development 4"
date: 2014-02-21 10:15
comments: true
categories: mobiledev android opencv
---
#### Android NDK与OpenCV的整合开发环境搭建

以XFace项目为例，虚拟机的操作系统为64位的Ubuntu 12.04，用户名和密码都是xface  

##### 第一部分 搭建环境
--------------------

***[注：以下所有下载的sdk工具都保存在虚拟机的`/home/xface/tools`目录下，也可以到我共享的百度网盘中直接下载，地址是[http://pan.baidu.com/s/1mg3BSZQ](http://pan.baidu.com/s/1mg3BSZQ)]***

1.配置Java环境

①下载[Oracle JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html)，虚拟机中下载的版本是JDK1.7.0_40，保存在`/home/xface/tools`目录下

②下载之后解压即可，解压路径为`/home/xface/android/jdk1.7.0`

③打开终端，输入`sudo gedit /etc/profile`，在文件末尾添加下面内容

```
JAVA_HOME=/home/xface/android/jdk1.7.0
export PATH=$JAVA_HOME/bin:$PATH
```

④重启虚拟机，打开终端输入`java -version`进行测试

{% img /images/201402/javaversion.png %}


2.配置Android SDK环境

①下载[Android Developer Tools](https://developer.android.com/sdk/index.html)，虚拟机中下载的是20130729版本，保存在`/home/xface/tools`目录下

②下载之后解压即可，解压路径为`/home/xface/android/adt-bundle`

③打开终端，输入`sudo gedit /etc/profile`，在文件末尾添加下面内容

```
ANDROID_SDK_ROOT=/home/xface/android/adt-bundle/sdk
export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools:${ANDROID_SDK_ROOT}/tools
```

④因为Android SDK是32位的，而Ubuntu系统是64位的，需要添加ia32-libs库，在终端中执行下面命令

```
sudo apt-get update
sudo apt-get install ia32-libs
```

⑤重启虚拟机，打开终端输入`adb version`进行测试

{% img /images/201402/adbversion.png %}


3.配置Android NDK环境

①下载[Android NDK](https://developer.android.com/tools/sdk/ndk/index.html)，虚拟机中下载的是r9c版本，保存在`/home/xface/tools`目录下

②下载之后解压即可，解压路径为`/home/xface/android/adt-bundle/ndk`

③打开终端，输入`sudo gedit /etc/profile`，在文件末尾添加下面内容

```
ANDROID_NDK_ROOT=/home/xface/android/adt-bundle/ndk
export PATH=${PATH}:${ANDROID_NDK_ROOT}
```

④重启虚拟机，打开终端输入`ndk-build -v`进行测试

{% img /images/201402/ndkversion.png %}


4.配置OpenCV环境

①下载[OpenCV for Android](http://sourceforge.net/projects/opencvlibrary/files/opencv-android/)，虚拟机中使用的是2.4.4版本，保存在`/home/xface/tools`目录下

②下载之后解压即可，解压路径为`/home/xface/android/opencv_sdk`


5.配置ADT开发环境

①运行`%adt-bundle%/eclipse`目录中的eclipse程序，设置默认的工作空间，虚拟机中设置的路径为`/home/xface/android/workspace`

②打开`window->preferences`，查看Android SDK和NDK的配置，如果路径有问题则需要修改过来

③打开`window->preferences`，找到左侧的`C/C++ Build->Environment`添加下面两个环境变量：

```
NDKROOT=/home/xface/android/adt-bundle/ndk
OPENCVROOT=/home/xface/android/opencv_sdk
```

④为了提高编写代码的速度，打开`window->preferences`，找到左侧`Java->Editor->Content Assist`，在`Auto activation triggers for Java`中添加26个英文字母，这样，在编写Java代码时任何一个字母被按下的话都会出现智能代码提示。

***[注1：以上重启虚拟机的步骤可以合成一次进行，即先配置所有内容然后重启一次即可]***

***[注2：为了验证环境没有问题，可以尝试新建一个Android Project并运行于移动设备上]***

##### 第二部分 运行XFace
----------------------

第一种方式是使用Git方式获取源代码然后运行

1.运行Eclipse，在`window->view`中找到并打开`Git Repositories`视图，然后选择`clone a git repository`，在弹出的窗口中输入下面的内容 (注：下面内容是我在GitHub上的一个项目，可以选择fork一份项目或者我添加teamworker)

{% img /images/201402/gitclone.png %}

2.在得到的XFace Git Repository的`Working Directory`中便可以看到XFace项目现有的所有源码，首先导出项目`OpenCV Library-2.4.4`，如果提示`Unable to resolve target 'android-17'`则只要修改修改项目属性中的Android Platform的版本为系统中已安装的版本，例如4.3。然后导出项目XFace，它是当前XFace项目最新的源码，项目导入之后会自动进行一次编译，如果编译成功则表示环境没有问题。

第二种方式是直接下载源码然后导入到Eclipse中

下载地址是：[https://github.com/hujiaweibujidao/XFace.git](https://github.com/hujiaweibujidao/XFace.git)

导入项目以及导入之后的配置和第一种方式差不多

##### 第三部分 参考内容
--------------------

其他的参考内容：

①[关于在Ubuntu12.04下搭建android开发环境的教程](http://bujingyun23.blog.163.com/blog/static/181310243201210293950303/?suggestedreading&wumii)

②[关于在windows平台搭建android开发环境的教程](http://hujiaweiyinger.diandian.com/post/2013-10-30/setup_android_ndk_environment_and_solve_some_problems) 

【不推荐使用Windows进行开发】

③[关于android ndk和opencv整合开发以及实例项目运行的教程](http://hujiaweibujidao.github.io/blog/2013/11/18/android-ndk-and-opencv-developement/)

④[关于android ndk开发中的各种细节和问题的总结](http://hujiaweibujidao.github.io/blog/2013/11/18/android-ndk-and-opencv-development-2/)
