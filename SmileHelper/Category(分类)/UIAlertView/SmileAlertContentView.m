//
//  SmileAlertContentView.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import "SmileAlertContentView.h"
#import "Macros.h"
@implementation SmileAlertContentView

-(void)awakeFromNib{
    [super awakeFromNib];
    ViewRadius(self.cancelBtn, 3);
    ViewRadius(self.sureBtn, 3);
}


- (IBAction)cancelClick:(UIButton *)sender {
    if (self.btnClickedCallBackBlock) {
           self.btnClickedCallBackBlock(0);
    }

    
}
- (IBAction)sureClick:(UIButton *)sender {
    
    if (self.btnClickedCallBackBlock) {
        self.btnClickedCallBackBlock(1);
    }
    
}
- (void)returnbuttonIndex:(SmileAlertContentViewClickedBlock)block{
    self.btnClickedCallBackBlock = block;
}

@end
