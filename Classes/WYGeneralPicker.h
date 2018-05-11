//
//  WYGeneralPicker.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WYGeneralPicker : NSObject

+ (void)showPickerWithTitle:(NSString *)title datePickerMode:(UIDatePickerMode)pickerMode selectedDate:(NSDate *)date doneBlock:(void (^)(NSDate *date))doneBlock cancelBlock:(void (^)(void))cancelBlock;

@end
