//
//  WYGPickerDateBottomView.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerBottomView.h"
#import "WYGeneralPicker.h"

@interface WYGPickerDateBottomView : WYGPickerBottomView

@property (nonatomic, strong, readonly) UIDatePicker         *datePicker;

@property (nonatomic, copy) WYGPickerDateBlock         userDoneBlock;
@property (nonatomic, copy) WYGPockerCancelBlock       userCancelBlock;

@end
