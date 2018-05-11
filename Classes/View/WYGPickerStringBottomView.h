//
//  WYGPickerStringBottomView.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerBottomView.h"

@interface WYGPickerStringBottomView : WYGPickerBottomView

- (instancetype)initWithStringList:(NSArray<NSString *> *)strList;

@property (nonatomic, strong, readonly) NSArray<NSString *>  *strList;
@property (nonatomic, strong, readonly) UIPickerView         *pickerView;

@end
