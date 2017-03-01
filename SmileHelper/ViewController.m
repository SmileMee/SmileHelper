//
//  ViewController.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import "ViewController.h"
#import "Macros.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}
#pragma mark - AlertView
- (IBAction)AlertBlockClick:(id)sender {
    [UIAlertView creat_AlertViewWithClickBlock:^(NSInteger buttonIndex) {
        
        NSLog(@"点击的按钮是第%ld个",buttonIndex);
        
    } title:@"标题" message:@"今天天气不错！！💗"
                                 cancelButtonStr:@"呵呵"
                                 otherButtonTitles:@"嗯嗯",@"思密达", nil];
    
}
- (IBAction)CustomAlertView:(id)sender {
    
    [SmileAlert creat_AlertViewWithClickBlock:^(NSInteger buttonIndex) {
        
         NSLog(@"SmileAlert点击 第%ld个",buttonIndex);
        
    } title:@"SmileAlert" message:@"分层是表示将功能进行有序的分组：应用程序专用功能位于上层，跨越应用程序领域的功能位于中层，而配置环境专用功能位于低层。分层从逻辑上将子系统划分成许多集合，而层间关系的形成要遵循一定的规则。"
                              cancelButtonStr:@"🐘取消"
                              otherButtonTitle:@"💗确定"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
