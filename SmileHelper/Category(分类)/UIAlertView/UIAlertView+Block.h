//
//  UIAlertView+Block.h
//  SmileHelper


#import <UIKit/UIKit.h>

//点以一个点击回调Block
typedef void(^UIAlertViewClickedBlock)(NSInteger buttonIndex);

@interface UIAlertView (Block)<UIAlertViewDelegate>

@property (nonatomic, copy) UIAlertViewClickedBlock alertViewCallBackBlock;

+ (void)creat_AlertViewWithClickBlock:(UIAlertViewClickedBlock)alertViewClickBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonStr:(NSString *)cancelButtonStr otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION;

@end
