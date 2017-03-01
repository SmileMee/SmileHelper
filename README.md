# SmileHelper
---
>#工欲善其事，必先利其器

---

##No1、☆ UIAlertView+Block    ☆ 自定义Alert+Block 简单的自定义弹框封装

####UIAlertView+Block调用：
     
```
    [UIAlertView creat_AlertViewWithClickBlock:^(NSInteger buttonIndex) {
        NSLog(@"点击的按钮是第%ld个",buttonIndex);
    } title:@"标题" message:@"今天天气不错！！💗" cancelButtonStr:@"呵呵" otherButtonTitles:@"嗯嗯",@"思密达", nil];

```
####自定义Alert+Block调用
```
   [SmileAlert creat_AlertViewWithClickBlock:^(NSInteger buttonIndex) {
        
         NSLog(@"SmileAlert点击 第%ld个",buttonIndex);
        
    } title:@"SmileAlert" message:@"分层是表示将功能进行有序的分组：应用程序专用功能位于上层，跨越应用程序领域的功能位于中层，而配置环境专用功能位于低层。分层从逻辑上将子系统划分成许多集合，而层间关系的形成要遵循一定的规则。"
                              cancelButtonStr:@"🐘取消"
                              otherButtonTitle:@"💗确定"];
```
####效果：

![](http://upload-images.jianshu.io/upload_images/1902273-447ea424319902f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

----
##No2、☆ UINavigationController+Animation    ☆ UINavigationController+NavManager

####2.1 UINavigationController+Animation调用：
```
    [self.navigationController pushViewController:[[SmileButtonVC alloc]init] withTransition:UIViewAnimationTransitionFlipFromLeft];
```
动画效果：

```

//    UIViewAnimationTransitionNone    不使用动画
//    UIViewAnimationTransitionFlipFromLeft    从左向右旋转翻页
//    UIViewAnimationTransitionFlipFromRight    从右向左旋转翻页，与UIViewAnimationTransitionFlipFromLeft相反
//    UIViewAnimationTransitionCurlUp    卷曲翻页，从下往上
//    UIViewAnimationTransitionCurlDown    卷曲翻页，从上往下

```
####2.2 UINavigationController+NavManager：Push 、Pop 的时候更好的记录层次

---

##No3、☆ 简化常用控件初始化代码 - 工厂模式 MyControl
```
//工厂模式：传入参数，出来控件
#pragma mark 创建View
+(UIView*)createViewWithFrame:(CGRect)frame;
#pragma mark 创建label
+(UILabel*)createLabelWithFrame:(CGRect)frame Font:(float)font Text:(NSString*)text;
#pragma mark 创建button
+(UIButton*)createButtonWithFrame:(CGRect)frame target:(id)target SEL:(SEL)method title:(NSString*)title;
#pragma mark 创建imageView
+(UIImageView*)createImageViewFrame:(CGRect)frame imageName:(NSString*)imageName;
#pragma mark 创建textField
+(UITextField*)createTextFieldFrame:(CGRect)frame Font:(float)font textColor:(UIColor*)color leftImageName:(NSString*)leftImageName rightImageName:(NSString*)rightImageName bgImageName:(NSString*)bgImageName placeHolder:(NSString*)placeHolder sucureTextEntry:(BOOL)isOpen;
```

---
##No4、☆ UIButton+Category
####4.1 BtnClickBlock 
```
    [button01 add_BtnClickHandler:^(NSInteger tag) {
       //do something
    }];
```
####4.2 增大按钮点击范围，额外热度响应
```
  button03.touchAreaInsets=UIEdgeInsetsMake(30, 30, 30, 30);
``` 
####4.3 点赞动画
```
  [button04 start_ZanAnimation];

```
####4.4 倒计时按钮
```
 [button02 add_startTime:12 title:@"倒计时" waitTittle:@"S"];
```
####效果图
![](http://upload-images.jianshu.io/upload_images/1902273-efdd497615b79d7c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


