//
//  WYGPickerStringBottomView.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerStringBottomView.h"

@interface WYGPickerStringBottomView() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSArray<NSString *>           *strList;
@property (nonatomic, assign) NSUInteger                    selectIndex;

@property (nonatomic, strong) UIPickerView                  *pickerView;

@end

@implementation WYGPickerStringBottomView

- (instancetype)initWithStringList:(NSArray<NSString *> *)strList andInitialIndex:(NSUInteger)index {
    if(self = [super init]) {
        _strList = strList;
        _selectIndex = index;
    }
    return self;
}

#pragma mark - Private
- (void)configView {
    [super configView];
    
    [self addSubview:self.pickerView];
}

- (void)doneAction {
    [super doneAction];
    
    if(self.userDoneBlock) {
        NSString *result = @"";
        if(self.selectIndex < self.strList.count) {
            result  = self.strList[self.selectIndex];
        }
        self.userDoneBlock(result);
    }
}

- (void)cancelAction {
    [super cancelAction];
    
    if(self.userCancelBlock) {
        self.userCancelBlock();
    }
}


#pragma mark - UIPickerViewDataSource
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.strList.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.strList[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectIndex = row;
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
