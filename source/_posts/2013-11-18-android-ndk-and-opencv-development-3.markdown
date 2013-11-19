---
layout: post
title: "android ndk and opencv development 3"
date: 2013-11-18 21:35
comments: true
categories: android opencv mobiledev
---

### Android NDK 和 OpenCV 整合开发总结(3)

终于写到第三节啦，虽然很累，但是还是要坚持，坚持写完这3篇文章。

这一节的主要内容是OpenCV在Android NDK开发中的应用，包括下面几个方面的内容：

* 如何实现Static Initialization从而不需要安装OpenCV Manager运行含opencv library的app
* 对十份论文和报告中的关于OpenCV和Android NDK开发的总结
* 如何使用Android中的摄像头，常见的问题? 
* OpenCV和Android NDK开发的一般途径


#### 1.实现Static Initialization

实现Static Initialization就是指将OpenCV Library添加到app package中，不需要安装OpenCV Manager这个app就能运行，[官方文档有介绍](http://docs.opencv.org/trunk/doc/tutorials/introduction/android_binary_package/dev_with_OCV_on_Android.html)，但是不详细，尤其是最后那句代码到底要放在什么地方大家都不清楚，其实并不需要向官方文档中介绍的那样配置，我想在这里介绍下如何修改FaceDetection项目的源码来做到这点。(最好是找一个包含jni代码的项目进行修改)

- [1]打开jni下的Android.mk文件，修改OpenCV的那一部分，将`off`设置为`on`，并设置`OPENCV_LIB_TYPE`为`SHARED`，结果如下：  

```
OPENCV_CAMERA_MODULES:=on
OPENCV_INSTALL_MODULES:=on
OPENCV_LIB_TYPE:=SHARED
include ${OPENCVROOT}/sdk/native/jni/OpenCV.mk
```

- [2]打开FdActivity.java文件，在其中添加一个静态初始化块代码，它是用来加载`opencv_java`库的，由于FaceDetection中还用了另一个库detection_based_tracker，所以要在`else`子句中加载进来：

```
static {
	Log.i(TAG, "opencv library load!");
	if (!OpenCVLoader.initDebug()) {
		Log.i(TAG, "OpenCV load not successfully");
	} else {
		System.loadLibrary("detection_based_tracker");// load other libraries
	}
}
```

- [3]删除FdActivity.java的OnResume()方法的最后那句，不让它去访问OpenCV Manager。

```
@Override
public void onResume() {
	super.onResume();
//OpenCVLoader.initAsync(OpenCVLoader.OPENCV_VERSION_2_4_3, this, mLoaderCallback);//
}
```

- [4]修改FdActivity.java的OnCreate()方法，从上面的`private BaseLoaderCallback mLoaderCallback = new BaseLoaderCallback(this)`代码块中拷贝`try-catch`块放到OnCreate的setContentView()之后，然后拷贝`mOpenCvCameraView.enableView();`放到`mOpenCvCameraView = (CameraBridgeViewBase) findViewById(R.id.fd_activity_surface_view);`之后，修改后的OnCreate()方法如下：

```
public void onCreate(Bundle savedInstanceState) {
	Log.i(TAG, "called onCreate");
	super.onCreate(savedInstanceState);
	getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

	setContentView(R.layout.face_detect_surface_view);

	//
	try {
		// load cascade file from application resources
		InputStream is = getResources().openRawResource(R.raw.lbpcascade_frontalface);
		File cascadeDir = getDir("cascade", Context.MODE_PRIVATE);
		mCascadeFile = new File(cascadeDir, "lbpcascade_frontalface.xml");
		FileOutputStream os = new FileOutputStream(mCascadeFile);

		byte[] buffer = new byte[4096];
		int bytesRead;
		while ((bytesRead = is.read(buffer)) != -1) {
			os.write(buffer, 0, bytesRead);
		}
		is.close();
		os.close();

		mJavaDetector = new CascadeClassifier(mCascadeFile.getAbsolutePath());
		if (mJavaDetector.empty()) {
			Log.e(TAG, "Failed to load cascade classifier");
			mJavaDetector = null;
		} else
			Log.i(TAG, "Loaded cascade classifier from " + mCascadeFile.getAbsolutePath());

		mNativeDetector = new DetectionBasedTracker(mCascadeFile.getAbsolutePath(), 0);// hujiawei

		cascadeDir.delete();

	} catch (IOException e) {
		e.printStackTrace();
		Log.e(TAG, "Failed to load cascade. Exception thrown: " + e);
	}

	//

	mOpenCvCameraView = (CameraBridgeViewBase) findViewById(R.id.fd_activity_surface_view);
	mOpenCvCameraView.enableView();//
	mOpenCvCameraView.setCvCameraViewListener(this);
}
```

- [5]OK，卸载安装好的OpenCV Manager，然后重新调试运行FaceDetection试试，它已经可以自行运行了！  

#### 2.对十份论文和报告中的关于OpenCV和Android NDK开发的总结


这10篇文献大部分[[下载地址](http://pan.baidu.com/s/19WOVq)]都还是停留如何在android开发中使用opencv library，没有牵涉到具体的实现领域。具体总结如下：

- _利用OpenCV实现在Android系统下的人脸检测

本文主要介绍了如何在底层通过opencv来对人脸部分进行检测，得到的人脸位置数据通过JNI传递给Java层，详细介绍了其中的JNI代码和共享库的构建过程，对图片是通过图片的路径来进行传递的，因为这里的检测只是对单张静态的图片进行检测。[这竟然是博士生的论文，它比我实习要做的简单多了！]

- _Tutorial-2-OpenCV-for-Android-Setup-Macintosh-API11

本文主要是介绍了OpenCV和Android NDK开发环境的搭建，以及基于示例程序Face-Detection的演示。使用的方式是将OpenCV Library Project作为库，然后调用OpenCV Android API。

- _Android application for Face Recognition

这是一份详细的项目介绍，实现了几种基于Android平台的人脸检测和识别，包括Google API和OpenCV的，但是OpenCV的由于需要Library Project，而且算法过于复杂，作者便自行开发了人脸检测库，有6大特性，其中包括了眼镜和嘴巴的检测。

- _ECCV-2012-OpenCV4Android

这份报告写得精简但是内容丰富，有几个重要点：  
(1) 使用opencv的android应用开发方式，对应不同的开发人群：Java developer / Native developer   
(2) OpenCV4Android目前的局限性，以及开发过程中对于提高性能和开发效率需要注意的事项

- _Introduction to OpenCV for Android devices

本文设计的内容都很基础，涉及到opencv和android开发的环境搭建，亮点是最后的Using C++ OpenCV code，这里是在android ndk中使用opencv本地代码的重要配置项。

- _opencv-facedetection

这份报告讲述了很多opencv的相关知识，另外还详细讲述了一个人脸检测的算法

- _OpenCV on Android Platforms
 
这份报告内容也比较多，但是都很基础。

- _BDTI_ARMTechCon_2012_OpenCV_Android

这份报告讲的是opencv在嵌入式设备中的应用，其中介绍了opencv在android上的开发，需要注意的是opencv2.4开始提供了native android camera support！

- _OpenCV Based Real-Time Video Processing  Using Android Smartphone

这篇论文介绍了利用opencv对实时的视频进行处理和纯android library进行处理的比较，发现利用opencv处理的结果更加准确，效率更快，而且更加省电。比较时使用的都是基本图像处理操作，例如灰度化，高斯模糊，Sobel边缘检测等等。[这篇论文貌似发在国际期刊上，我表示呵呵一下……到处都是水啊]

- _Realtime Computer Vision  with OpenCV

这篇文章比较有意思，大致看了下，介绍了opencv在移动终端的应用。


#### 3.Android的摄像头

- 关于如何使用android的摄像头：android设备一般有两个摄像头，前置摄像头和后置摄像头，在进行和摄像头相关的应用开发的时候很容易遇到各种问题，推荐以下几篇文章：  
[Android Developer中有对应的文档:Camera](https://developer.android.com/guide/topics/media/camera.html)  
[这位作者的总结：Android相机](http://blog.csdn.net/yinyuan1987/article/details/6969225)  
[StackOverflow上关于如何调用前置摄像头](http://stackoverflow.com/questions/2779002/how-to-open-front-camera-on-android-platform)  
[如何在Android中后台开启摄像头默默拍照](http://blog.csdn.net/yangzl2008/article/details/9262505)  
[关于Camera的三种Callback](http://blog.csdn.net/ocean20/article/details/8772196)

- 关于保存预览图片：Android中的`BitmapFactory.decodeByteArray`只支持一定的格式，Camara默认的previewformat格式为`NV21`(对于大多数的Android设备，即使修改CameraParameters的设置也还是不行)，所以在获得bitmap时，需要进行转换，通过YuvImage类来转换成JPEG格式，然后再保存到文件中。  
[Google Group上的讨论](http://www.cnblogs.com/liuan/archive/2012/01/10/2318300.html)  

- 关于如何在预览界面上添加一个矩形框，类似二维码扫描那样，原理很简单，一个使用SurfaceView，另一个使用ImageVIew(或者SurfaceView也行)，推荐文章：  
[Android摄像头中预览界面添加矩形框](http://blog.csdn.net/yanzi1225627/article/details/8580034)
  
- 关于如何进行和OpenCV有关的摄像头开发：有了OpenCV的library之后，关于摄像头的开发可谓是简单了很多，可以参见OpenCV for Android中的三个Tutorial(CameraPreview, MixingProcessing, CameraControl)，源码都在opencv-android sdk的samples目录下，这里简单介绍下：   
OpenCV Library中提供了两种摄像头，一种是Java摄像头-`org.opencv.android.JavaCameraView`，另一种是Native摄像头-`org.opencv.android.NativeCameraView` (可以运行CameraPreview这个项目来体验下两者的不同，其实差不多)。两者都继承自`CameraBridgeViewBase`这个抽象类，但是JavaCamera使用的就是Android SDK中的Camera，而NativeCamera使用的是OpenCV中的VideoCapture。    

- 关于OpenCV的Camera在Layout文件中的配置：`opencv:show_fps`在layout中如果设置为`true`的话显示界面中会出现当前摄像头帧率的信息以及图片的大小，`opencv:camera_id`的配置有三种`front`,`back`,`any`分别对应前置摄像头，后者摄像头和默认的摄像头(其实也就是后置摄像头)。  

- 关于`CvCameraViewListener2`接口：它可以方便的处理和摄像头的交互，该接口只有三个函数，分别在Camera打开(onCameraViewStarted)，关闭(onCameraViewStopped)和预览的图片帧到了的时候(onCameraFrame)调用。其中OnCameraFrame这个方法很重要，如果要对图片进行处理的话一般都是在这里面处理的，这个函数的输入参数是`CvCameraViewFrame`，需要注意的是，不要在这个方法的外面使用这个变量，因为这个对象没有它自己的状态，在回调方法的外面它是行为是不可预测的！它提供了两个有用的方法rgba()和gray()分别得到图像帧的RGBA格式和灰度图，OnCameraFrame的返回值是**RGBA格式**的图像，这个很重要！[来自OpenCV文档:Android Development with Android](http://docs.opencv.org/trunk/doc/tutorials/introduction/android_binary_package/dev_with_OCV_on_Android.html)     

`Note Do not save or use CvCameraViewFrame object out of onCameraFrame callback. This object does not have its own state and its behavior out of callback is unpredictable!`  

- 关于如何传递摄像头预览的图像数据给Native代码：这个很重要！我曾经试过很多的方式，大致思路有：   

①传递图片路径：这是最差的方式，我使用过，速度很慢   

②传递预览图像的字节数组到Native，然后将字节数组处理成RGB或者RGBA的格式[具体哪种格式要看你的图像处理函数能否处理RGBA，如果可以的话推荐转换成RGBA，因为返回的也是RGBA格式的。网上有很多的文章讨论如何转换：一种方式是使用一个自定义的函数进行编码转换，另一个种方式是使用OpenCV中的Mat和cvtColor函数进行转换]，接着调用图像处理函数，处理完成之后，将处理的结果保存在一个整形数组中(实际上就是RGB或者RGBA格式的图像数据)，最后调用Bitmap的方法将其转换成bitmap返回。这种方法速度也比较慢   

③使用OpenCV的摄像头：JavaCamera或者NativeCamera都行，好处是它进行了很多的封装，可以直接将预览图像的Mat结构传递给Native层，这种传递是使用Mat的内存地址(long型)，Native层只要根据这个地址将其封装成Mat就可以进行处理了，另外，它的回调函数的返回值也是Mat，非常方便！这种方式速度较快。[详细过程可以查看opencv-android sdk的samples项目中的Tutorial2-MixedProcessing] 

#### 3.OpenCV和Android NDK开发的一般途径


在进行这类开发的时候，需要考虑如何在android中使用opencv，并且如果需要调用摄像头的话，要考虑以下内容：  
首先，是否是在原有的C/C++代码上进行移植，如果是的话，那么尽量考虑使用ndk进行开发，否则使用opencv for android编写Java代码进行开发，效率不会比native代码低多少；   
其次，如果是需要opencv library，是否能够容忍运行应用还需要安装OpenCV Manager，如果不能的话，则在开发时要考虑将opencv binaries添加到应用中进行static initialization；   
接着，是否需要调用摄像头，如果需要的话，是使用原生Android的Camera还是使用OpenCV的Camera，如果是OpenCV Camera的话，是使用Java调用摄像头还是Native调用摄像头；  
最后，图片如何进行传递，如果是单张静态图片进行处理的话，只需要路径就行了，但是如果是在视频状态下对图片进行处理的话，那么就只能传递图像数据了，这里涉及到了android中如何获取预览的图像数据以及如何将其传递到底层，又如何进行转换(一般是YUV转成RGB)使得opencv可以进行处理，处理完了之后，又如何将处理得到的图片传递给Java层。

推荐一本书籍《Mastering OpenCV with Practical Computer Vision Projects》，电子书可以在[皮皮书屋](http://www.ppurl.com/2012/12/mastering-opencv-with-practical-computer-vision-projects.html)下载，[原书源码在Github上](https://github.com/MasteringOpenCV)。该书第一章介绍如何开发一个使用OpenCV的Android项目-`Cartoonifer and Skin Changer for Android`，这个项目涉及到了OpenCV在Android中的方方面面，采用的是第二种图像数据传递方式，其中他提出了很多可以优化的地方，包括：尽量使用Mat而不要使用IplImage，尽量保证你的图像处理函数能够处理RGBA格式的图像，如果可以先压缩图像大小再对图像进行处理，使用noise filter降低图像中的噪声。总之，极力推荐此书，我以后的文章中还会提到这本书，嘿嘿。


OK！终于完结了！多谢关注！

