//
//  SmileTextViewVC.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2017/3/1.
//  Copyright © 2017年 www.imee.vc. All rights reserved.
//

#import "SmileTextViewVC.h"
#import "Macros.h"
@interface SmileTextViewVC ()<UITextViewDelegate>

@end

@implementation SmileTextViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatTextView];
    
}

-(void)creatTextView{
    
    UITextView * textView =[[UITextView alloc]initWithFrame:CGRectMake(30, 100, KScreenWidth-60, 250)];
    textView.backgroundColor = [UIColor lightGrayColor];
    textView.font = [UIFont systemFontOfSize:18];
    [textView add_PlaceHolder:@"请输入内心独白（20字以内）~"];
    [self.view addSubview:textView];
    
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
