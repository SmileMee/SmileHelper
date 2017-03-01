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


