//
//  SmileMainViewController.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/3/1.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import "SmileMainViewController.h"
#import "Macros.h"
#import "SmileButtonVC.h"

@interface SmileMainViewController ()

@end

@implementation SmileMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"SmileHelper";
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
#pragma mark - Button
- (IBAction)bottonList:(id)sender {
    
//    [self.navigationController pushViewController: [[SmileButtonVC alloc]init] animated:YES];

    
    
//    UIViewAnimationTransitionNone    不使用动画
//    UIViewAnimationTransitionFlipFromLeft    从左向右旋转翻页
//    UIViewAnimationTransitionFlipFromRight    从右向左旋转翻页，与UIViewAnimationTransitionFlipFromLeft相反
//    UIViewAnimationTransitionCurlUp    卷曲翻页，从下往上
//    UIViewAnimationTransitionCurlDown    卷曲翻页，从上往下
    
    
    [self.navigationController pushViewController:[[SmileButtonVC alloc]init] withTransition:UIViewAnimationTransitionFlipFromLeft];
    
    
    
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
