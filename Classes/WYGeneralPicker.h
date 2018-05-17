//
//  WYGeneralPicker.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^WYGPickerDateBlock)(NSDate *date);
typedef void(^WYGPickerStringBlock)(NSString *selectedStr);
typedef void(^WYGPickerMulStringBlock)(NSArray<NSString *> *selectedStrArray);
typedef void(^WYGPockerCancelBlock)(void);

@interface WYGeneralPicker : NSObject


#pragma mark - DatePicker
+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date doneBlock:(WYGPickerDateBlock)doneBlock cancelBlock:(WYGPockerCancelBlock)cancelBlock;
+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date minimumDate:(NSDate *)minimumDate maximumDate:(NSDate *)maximumDate doneBlock:(WYGPickerDateBlock)doneBlock cancelBlock:(WYGPockerCancelBlock)cancelBlock;

#pragma mark - Strings
+ (void)showPickerWithTitle:(NSString *)title rows:(NSArray<NSString *> *)rows initialSelection:(NSUInteger)selection doneBlock:(WYGPickerStringBlock)doneBlock cancelBlock:(WYGPockerCancelBlock)cancelBlock;

#pragma mark - Multiple Strings
+ (void)showPickerWithTitle:(NSString *)title multipleRows:(NSArray<NSArray<NSString *> *> *)mulRows initialSelections:(NSArray<NSNumber *> *)selections doneBlock:(WYGPickerMulStringBlock)doneBlock cancelBlock:(WYGPockerCancelBlock)cancelBlock;


@end
