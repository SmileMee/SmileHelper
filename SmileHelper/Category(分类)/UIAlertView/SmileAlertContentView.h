//
//  SmileAlertContentView.h
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SmileAlertContentViewClickedBlock)(NSInteger buttonIndex);

@interface SmileAlertContentView : UIView
@property (nonatomic, copy) SmileAlertContentViewClickedBlock btnClickedCallBackBlock;

@property (weak, nonatomic) IBOutlet UILabel *titleStr;
@property (weak, nonatomic) IBOutlet UILabel *contentStr;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

- (void)returnbuttonIndex:(SmileAlertContentViewClickedBlock)block;

@end
