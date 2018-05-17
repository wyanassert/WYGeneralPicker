//
//  WYGeneralPicker.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGeneralPicker.h"
#import "WYGPickerViewController.h"

@implementation WYGeneralPicker

+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date doneBlock:(void (^)(NSDate *))doneBlock cancelBlock:(void (^)(void))cancelBlock {
    WYGPickerViewController *vc = [[WYGPickerViewController alloc] initWithPickerType:WYGPickerTypeDate];
    vc.currentDate = date;
    vc.datePickerMode = pickerMode;
    vc.pickerTitle = title;
    
    UIViewController *topVC = [WYGeneralPicker getTopMostVC];
    
    UIGraphicsBeginImageContextWithOptions(topVC.view.frame.size, NO, 0);
    [topVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc.view.backgroundColor = [UIColor colorWithPatternImage:image];

    
    [[WYGeneralPicker getTopMostVC] presentViewController:vc animated:NO completion:nil];
}

+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate doneBlock:(void (^)(NSDate *))doneBlock cancelBlock:(void (^)(void))cancelBlock {
    WYGPickerViewController *vc = [[WYGPickerViewController alloc] initWithPickerType:WYGPickerTypeDate];
    vc.currentDate = date;
    vc.datePickerMode = pickerMode;
    vc.pickerTitle = title;
    vc.maximumDate = maximumDate;
    vc.minimumDate = minimumDate;
    
    UIViewController *topVC = [WYGeneralPicker getTopMostVC];
    
    UIGraphicsBeginImageContextWithOptions(topVC.view.frame.size, NO, 0);
    [topVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    [[WYGeneralPicker getTopMostVC] presentViewController:vc animated:NO completion:nil];
}


#pragma mark - String
+ (void)showPickerWithTitle:(NSString *)title rows:(NSArray<NSString *> *)rows initialSelection:(NSUInteger)selection doneBlock:(void (^)(NSDate *))doneBlock cancelBlock:(void (^)(void))cancelBlock {
    WYGPickerViewController *vc = [[WYGPickerViewController alloc] initWithPickerType:WYGPickerTypeString];
    vc.pickerTitle = title;
    vc.strList = rows;
    vc.initialSelectedIndex = selection;
    
    UIViewController *topVC = [WYGeneralPicker getTopMostVC];
    
    UIGraphicsBeginImageContextWithOptions(topVC.view.frame.size, NO, 0);
    [topVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    vc.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    [[WYGeneralPicker getTopMostVC] presentViewController:vc animated:NO completion:nil];
}


#pragma mark - Private
+ (UIViewController *)getTopMostVC {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    
    while (topVC.presentedViewController)
        topVC = topVC.presentedViewController;
    if (topVC != nil)
        return topVC;
    
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
