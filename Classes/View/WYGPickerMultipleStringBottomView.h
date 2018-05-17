//
//  WYGPickerMultipleStringBottomView.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/17.
//

#import "WYGPickerBottomView.h"

@interface WYGPickerMultipleStringBottomView : WYGPickerBottomView

- (instancetype)initWithMultiStringList:(NSArray<NSArray<NSString *> *> *)mulStrList andInitialSelections:(NSArray<NSNumber *> *)selections;

@property (nonatomic, strong, readonly) NSArray<NSArray<NSString*> *> *mulStrList;
@property (nonatomic, strong, readonly) UIPickerView                  *pickerView;

@end
