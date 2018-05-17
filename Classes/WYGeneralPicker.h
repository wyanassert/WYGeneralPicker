//
//  WYGeneralPicker.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WYGeneralPicker : NSObject


#pragma mark - DatePicker
+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date doneBlock:(void (^)(NSDate *date))doneBlock cancelBlock:(void (^)(void))cancelBlock;
+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate doneBlock:(void (^)(NSDate *date))doneBlock cancelBlock:(void (^)(void))cancelBlock;

#pragma mark - Strings
+ (void)showPickerWithTitle:(NSString *)title rows:(NSArray<NSString *> *)rows initialSelection:(NSUInteger)selection doneBlock:(void (^)(NSDate *date))doneBlock cancelBlock:(void (^)(void))cancelBlock;


@end
