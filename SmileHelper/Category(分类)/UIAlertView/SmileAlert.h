//
//  SmileAlert.h
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import <UIKit/UIKit.h>
//点以一个点击回调Block
typedef void(^SmileAlertClickedBlock)(NSInteger buttonIndex);

@interface SmileAlert : UIView

@property (nonatomic, copy) SmileAlertClickedBlock alertViewCallBackBlock;

+ (void)creat_AlertViewWithClickBlock:(SmileAlertClickedBlock)alertViewClickBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonStr:(NSString *)cancelButtonStr otherButtonTitle:(NSString *)otherButtonTitle;


@end
