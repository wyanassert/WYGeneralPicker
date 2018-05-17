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
extern WYGPickerType const WYGPickerTypeMultipleString;

@interface WYGPickerViewController : UIViewController

- (instancetype)initWithPickerType:(WYGPickerType)pickerType;

@property (nonatomic, assign, readonly) WYGPickerType    pickerType;
@property (nonatomic, strong          ) NSString         *pickerTitle;
@property (nonatomic, copy            ) id               doneBlock;
@property (nonatomic, copy            ) id               cancelBlock;

//Date
@property (nonatomic, assign          ) UIDatePickerMode datePickerMode;
@property (nonatomic, strong          ) NSDate           *currentDate;
@property (nonatomic, strong          ) NSDate           *minimumDate;
@property (nonatomic, strong          ) NSDate           *maximumDate;

//String
@property (nonatomic, strong          ) NSArray<NSString *> *strList;
@property (nonatomic, assign          ) NSUInteger          initialSelectedIndex;

//Multiple String
@property (nonatomic, strong          ) NSArray<NSArray<NSString*> *> *mulStrList;
@property (nonatomic, strong          ) NSArray<NSNumber           *> *mulSelections;

@end
