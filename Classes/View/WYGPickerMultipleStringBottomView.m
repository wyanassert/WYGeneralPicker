//
//  WYGPickerMultipleStringBottomView.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/17.
//

#import "WYGPickerMultipleStringBottomView.h"

@interface WYGPickerMultipleStringBottomView() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray<NSString *>           *strList;
@property (nonatomic, strong) NSMutableArray<NSNumber *>    *selections;

@property (nonatomic, strong) UIPickerView                  *pickerView;

@end

@implementation WYGPickerMultipleStringBottomView

- (instancetype)initWithMultiStringList:(NSArray<NSArray<NSString *> *> *)mulStrList andInitialSelections:(NSArray<NSNumber *> *)selections {
    if(self = [super init]) {
        _mulStrList = mulStrList;
        _selections = [NSMutableArray array];
        for(NSUInteger i = 0; i < mulStrList.count; i++) {
            if(i < selections.count) {
                [_selections addObject:selections[i]];
            } else {
                [_selections addObject:@(0)];
            }
        }
    }
    return self;
}

#pragma mark - Private
- (void)configView {
    [super configView];
    
    [self addSubview:self.pickerView];
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.mulStrList.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component < self.mulStrList.count) {
        return self.mulStrList[component].count;
    } else {
        return 0;
    }
}

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component < self.mulStrList.count && row < self.mulStrList[component].count) {
        return self.mulStrList[component][row];
    } else {
        return @"";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component < self.selections.count) {
        [self.selections replaceObjectAtIndex:component withObject:@(row)];
    }
}

#pragma mark - Getter
- (UIPickerView *)pickerView {
    if(!_pickerView) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 180)];
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
    }
    return _pickerView;
}

@end
