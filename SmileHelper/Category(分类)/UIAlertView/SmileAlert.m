//
//  SmileAlert.m
//  SmileHelper
//
//  Created by 微笑吧阳光 on 2016/2/28.
//  Copyright © 2016年 www.imee.vc. All rights reserved.
//

#import "SmileAlert.h"
#import <Accelerate/Accelerate.h>
#import "AppDelegate.h"
#import "Macros.h"
#import "SmileAlertContentView.h"

#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]

#define KiOS7OrLater ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)

@interface SmileAlert()

@property (nonatomic, strong) UIImageView *screenShotView;
@property (nonatomic, strong) UIImageView *alertPopView;

@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, copy) NSString *messageStr;
@property (nonatomic, copy) NSString *cancelBtnStr;
@property (nonatomic, copy) NSString *sureBtnStr;

@end

@implementation SmileAlert

+ (void)creat_AlertViewWithClickBlock:(SmileAlertClickedBlock)alertViewClickBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonStr:(NSString *)cancelButtonStr otherButtonTitle:(NSString *)otherButtonTitle{
    
    SmileAlert * alert = [[SmileAlert alloc]initWithTitle:title message:message cancelButtonStr:cancelButtonStr otherButtonTitle:otherButtonTitle AndClickBlock:alertViewClickBackBlock];
    [alert showAlert];
}

-(instancetype)initWithTitle:(NSString*)title  message:(NSString *)message  cancelButtonStr:(NSString *)cancelButtonStr otherButtonTitle:(NSString *)otherButtonTitle AndClickBlock:(SmileAlertClickedBlock)alertViewClickBackBlock
{
    self=[super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
    self.titleStr = title;
    self.messageStr = message;
    self.cancelBtnStr = cancelButtonStr;
    self.sureBtnStr = otherButtonTitle;
    [self creatUi];
    self.alertViewCallBackBlock = alertViewClickBackBlock;
    }
    return self;
}

-(void)creatUi{
    
    [self addScreenShot];
    [self addPopAlertView];
    
}

-(void)addPopAlertView{
    
    SmileAlertContentView * contentView = [[[NSBundle mainBundle]loadNibNamed:@"SmileAlertContentView" owner:self options:nil]lastObject];
    contentView.frame = CGRectMake(0, 0, self.alertPopView.frame.size.width, self.alertPopView.frame.size.height);
    contentView.center = CGPointMake(self.alertPopView.frame.size.width/2, self.alertPopView.frame.size.height/2);
    contentView.titleStr.text = self.titleStr;
    contentView.contentStr.text = self.messageStr;
    [contentView.cancelBtn setTitle:self.cancelBtnStr forState:UIControlStateNormal];
    [contentView.sureBtn setTitle:self.sureBtnStr forState:UIControlStateNormal];
    
    [contentView returnbuttonIndex:^(NSInteger buttonIndex) {
//        NSLog(@"💗💗----%ld",(long)buttonIndex);
        if (self.alertViewCallBackBlock != nil) {
             self.alertViewCallBackBlock(buttonIndex);
        }
        [self hideAlert];
    }];
    [self.alertPopView addSubview:contentView];
    [self addSubview:self.alertPopView];
}

#pragma mark - 出来吧，弹出框
- (void)showAlert{

    AppDelegate*app=kAppDelegate;
    [app.window addSubview:self];
    self.backgroundColor = [UIColor blackColor];
    CGFloat duration = 0.3;
    
//    for (UIButton *btn in self.alertView.subviews) {
//        btn.userInteractionEnabled = NO;
//    }
    
    self.alertPopView.alpha = 0;
    self.alertPopView.alpha = 0;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.screenShotView.alpha = 1;
        self.alertPopView.alpha = 1.0;
    } completion:^(BOOL finished) {
        for (UIButton *btn in self.subviews) {
            btn.userInteractionEnabled = YES;
        }
    }];
    
    if (KiOS7OrLater) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
        animation.values = @[@(0.8), @(1.05), @(1.1), @(1)];
        animation.keyTimes = @[@(0), @(0.3), @(0.5), @(1.0)];
        animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        animation.duration = duration;
        [self.alertPopView.layer addAnimation:animation forKey:@"bouce"];
    } else {
        self.alertPopView.transform = CGAffineTransformMakeScale(0.8, 0.8);
        [UIView animateWithDuration:duration * 0.3 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.alertPopView.transform = CGAffineTransformMakeScale(1.05, 1.05);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:duration * 0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
               self.alertPopView.transform = CGAffineTransformMakeScale(1.1, 1.1);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:duration * 0.5 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                  self.alertPopView.transform = CGAffineTransformMakeScale(1, 1);
                } completion:nil];
            }];
        }];
    }
}

//消失吧，提示框
- (void)hideAlert{
    
    CGFloat duration = 0.2;
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.screenShotView.alpha = 0;
        self.alertPopView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.screenShotView removeFromSuperview];
        [self removeFromSuperview];
     
    }];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alertPopView.transform = CGAffineTransformMakeScale(0.4, 0.4);
    } completion:^(BOOL finished) {
        self.alertPopView.transform = CGAffineTransformMakeScale(1, 1);
    }];

}

//添加一个模糊的效果
- (void)addScreenShot{
    UIWindow *screenWindow = [UIApplication sharedApplication].windows.firstObject;
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *originalImage = nil;
    if (KiOS7OrLater) {
        originalImage = viewImage;
    } else {
        originalImage = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(viewImage.CGImage, CGRectMake(0, 20, 320, 460))];
    }
    
    CGFloat blurRadius = 4;
    UIColor *tintColor = [UIColor clearColor];
    CGFloat saturationDeltaFactor = 1;
    UIImage *maskImage = nil;
    
    CGRect imageRect = { CGPointZero, originalImage.size };
    UIImage *effectImage = originalImage;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
        UIGraphicsBeginImageContextWithOptions(originalImage.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectInContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(effectInContext, 1.0, -1.0);
        CGContextTranslateCTM(effectInContext, 0, -originalImage.size.height);
        CGContextDrawImage(effectInContext, imageRect, originalImage.CGImage);
        
        vImage_Buffer effectInBuffer;
        effectInBuffer.data	 = CGBitmapContextGetData(effectInContext);
        effectInBuffer.width	= CGBitmapContextGetWidth(effectInContext);
        effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
        effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
        
        UIGraphicsBeginImageContextWithOptions(originalImage.size, NO, [[UIScreen mainScreen] scale]);
        CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
        vImage_Buffer effectOutBuffer;
        effectOutBuffer.data	 = CGBitmapContextGetData(effectOutContext);
        effectOutBuffer.width	= CGBitmapContextGetWidth(effectOutContext);
        effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
        effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
        
        if (hasBlur) {
            CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
            uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
            if (radius % 2 != 1) {
                radius += 1;
            }
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
            vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        }
        BOOL effectImageBuffersAreSwapped = NO;
        if (hasSaturationChange) {
            CGFloat s = saturationDeltaFactor;
            CGFloat floatingPointSaturationMatrix[] = {
                0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                0,					0,					0,  1,
            };
            const int32_t divisor = 256;
            NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
            int16_t saturationMatrix[matrixSize];
            for (NSUInteger i = 0; i < matrixSize; ++i) {
                saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
            }
            if (hasBlur) {
                vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
                effectImageBuffersAreSwapped = YES;
            }
            else {
                vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
            }
        }
        if (!effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        if (effectImageBuffersAreSwapped)
            effectImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContextWithOptions(originalImage.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -originalImage.size.height);
    
    CGContextDrawImage(outputContext, imageRect, originalImage.CGImage);
    
    if (hasBlur) {
        CGContextSaveGState(outputContext);
        if (maskImage) {
            CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
        }
        CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
        CGContextRestoreGState(outputContext);
    }
    
    if (tintColor) {
        CGContextSaveGState(outputContext);
        CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
        CGContextFillRect(outputContext, imageRect);
        CGContextRestoreGState(outputContext);
    }
    
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.screenShotView = [[UIImageView alloc] initWithImage:outputImage];
    self.screenShotView.frame =[UIScreen mainScreen].bounds;
    [self addSubview:self.screenShotView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
    [self.screenShotView addGestureRecognizer:tap];

}
#pragma mark - 点击事件
- (void)dismiss:(UITapGestureRecognizer *)tap {
    [self hideAlert];
}

#pragma mark 懒加载初始化
- (UIImageView *)alertPopView {
    if (_alertPopView == nil) {
//        _alertPopView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"share_分享背景"]];
        _alertPopView = [[UIImageView alloc]initWithImage:nil];
        _alertPopView.backgroundColor = [UIColor whiteColor];
        _alertPopView.frame = CGRectMake(0, 0, KScreenWidth-60, KScreenHeight/4);
        _alertPopView.center = CGPointMake( KScreenWidth/ 2, KScreenHeight / 2);
        ViewRadius(_alertPopView, 5);
    }
    return _alertPopView;
}



@end
