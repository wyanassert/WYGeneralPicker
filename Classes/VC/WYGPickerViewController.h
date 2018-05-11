//
//  WYGPickerViewController.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import <UIKit/UIKit.h>

typedef NSString* WYGPickerType;

extern WYGPickerType const WYGPickerTypeDate;
extern WYGPickerType const WYGPickerTypeString;

@interface WYGPickerViewController : UIViewController

- (instancetype)initWithPickerType:(WYGPickerType)pickerType;

@property (nonatomic, assign, readonly) WYGPickerType         pickerType;

//String
@property (nonatomic, strong) NSArray<NSString *>         *strList;
@property (nonatomic, strong) NSString                    *initialSelectedStr;

//Date
@property (nonatomic, assign) UIDatePickerMode            datePickerMode;
@property (nonatomic, strong) NSDate                      *currentDate;
@property (nonatomic, strong) NSDate                      *minimumDate;
@property (nonatomic, strong) NSDate                      *maximumDate;

@end
