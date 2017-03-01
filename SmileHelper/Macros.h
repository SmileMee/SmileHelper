//
//  Macros.h
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///  View加边框
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;


#import "UIAlertView+Block.h"
#import "SmileAlert.h"
#import "UINavigationController+Animation.h"
#import "UIButton+Category.h"
#import "MyControl.h"
#import "UITextView+Category.h"
#import "UIViewController+DDPopUpViewController.h"

#endif /* Macros_h */
