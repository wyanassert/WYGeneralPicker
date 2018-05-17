//
//  WYGPickerStringBottomView.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerBottomView.h"
#import "WYGeneralPicker.h"

@interface WYGPickerStringBottomView : WYGPickerBottomView

- (instancetype)initWithStringList:(NSArray<NSString *> *)strList andInitialIndex:(NSUInteger)index;

@property (nonatomic, strong, readonly) NSArray<NSString *>  *strList;
@property (nonatomic, strong, readonly) UIPickerView         *pickerView;

@property (nonatomic, copy) WYGPickerStringBlock         userDoneBlock;
@property (nonatomic, copy) WYGPockerCancelBlock         userCancelBlock;

@end
