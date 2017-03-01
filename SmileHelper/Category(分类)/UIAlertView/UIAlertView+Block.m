//
//  UIAlertView+Block.m
//  SmileHelper


#import "UIAlertView+Block.h"
#import <objc/runtime.h>

static NSString *UIAlertViewKey = @"UIAlertViewKey";

@implementation UIAlertView (Block)

+ (void)creat_AlertViewWithClickBlock:(UIAlertViewClickedBlock)alertViewClickBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonStr:(NSString *)cancelButtonStr otherButtonTitles:(NSString *)otherButtonTitles, ...NS_REQUIRES_NIL_TERMINATION{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonStr otherButtonTitles: otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [alert addButtonWithTitle:other];
        }
        va_end(args);
    }
    alert.delegate = alert;
    [alert show];
    alert.alertViewCallBackBlock = alertViewClickBackBlock;
    
}

- (void)setAlertViewCallBackBlock:(UIAlertViewClickedBlock)alertViewCallBackBlock {
    
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &UIAlertViewKey, alertViewCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
}

- (UIAlertViewClickedBlock)alertViewCallBackBlock {
    
    return objc_getAssociatedObject(self, &UIAlertViewKey);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.alertViewCallBackBlock) {
        self.alertViewCallBackBlock(buttonIndex);
    }
}


@end
