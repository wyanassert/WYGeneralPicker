//
//  WYGPickerDateBottomView.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerDateBottomView.h"

@interface WYGPickerDateBottomView()

@property (nonatomic, strong) UIDatePicker         *datePicker;

@end

@implementation WYGPickerDateBottomView

- (instancetype)init {
    if(self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
    }
    return self;
}


#pragma mark - Private
- (void)configView {
    [super configView];
    
    [self addSubview:self.datePicker];
}


#pragma mark - Getter
- (UIDatePicker *)datePicker {
    if(!_datePicker) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, 180)];
        _datePicker.locale = [NSLocale currentLocale];
        [_datePicker setMinimumDate:[NSDate date]];
        [_datePicker setMaximumDate:[NSDate dateWithTimeIntervalSinceNow:(3600 * 24 * 30)]];
        [_datePicker setDate:[NSDate date]];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    return _datePicker;
}

@end
