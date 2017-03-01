//
//  SmileButtonVC.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/3/1.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import "SmileButtonVC.h"
#import "Macros.h"
@interface SmileButtonVC ()

@end

@implementation SmileButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self creatButtonList];
}
#pragma mark 创建不同的按钮
-(void)creatButtonList{
    
    //BtnClickBlock
    UIButton * button01  = [MyControl createButtonWithFrame:CGRectMake(100, 100, 200, 44) target:self SEL:nil title:@"BtnClickBlock"  ];
    [button01 setBackgroundColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button01 add_BtnClickHandler:^(NSInteger tag) {
    
    [SmileAlert creat_AlertViewWithClickBlock:^(NSInteger buttonIndex) {
            
                                                                                                }
                                                                                                 title:@"按钮点击"
                                                                                                  message:@"点击点击"
                                                                                                  cancelButtonStr:@"知道了"
                                                                                                  otherButtonTitle:@"消失吧"];
    }];
    [self.view addSubview:button01];
    
    //倒计时按钮
    UIButton * button02  = [MyControl createButtonWithFrame:CGRectMake(100, 180, 200, 44)
                                                     target:self SEL:nil
                                                    title:@""  ];
    [button02 setBackgroundColor:[UIColor redColor] forState:UIControlStateNormal];
    [button02 add_startTime:12 title:@"倒计时"
                                                         waitTittle:@"S"];
    
    [self.view addSubview:button02];
    
    //按钮额外热区
    UIButton * button03  = [MyControl createButtonWithFrame:CGRectMake(100, 270, 200, 44)
                                                     target:self SEL:nil
                                                      title:@"按钮额外热区"  ];
    [button03 setBackgroundColor:[UIColor yellowColor] forState:UIControlStateNormal];
    button03.touchAreaInsets=UIEdgeInsetsMake(30, 30, 30, 30);
    [button03 add_BtnClickHandler:^(NSInteger tag) {
        [UIAlertView creat_AlertViewWithClickBlock:nil
                                             title:@"按钮点击"
                                              message:@"点击边缘区域也响应"
                                              cancelButtonStr:@"知道了"
                                              otherButtonTitles:nil, nil];
    }];
    [self.view addSubview:button03];
    
    UIButton * button04  = [MyControl createButtonWithFrame:CGRectMake(100, 370, 44, 44) target:self SEL:nil title:@"💗"  ];
    [button04 add_BtnClickHandler:^(NSInteger tag) {
        [button04 start_ZanAnimation];
    }];
    [self.view addSubview:button04];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
