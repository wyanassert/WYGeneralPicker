//
//  WYGPickerViewController.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerViewController.h"
#import "WYGPickerBottomView.h"
#import "WYGPickerDateBottomView.h"
#import "WYGPickerStringBottomView.h"

WYGPickerType const WYGPickerTypeDate = @"WYGPickerTypeDate";
WYGPickerType const WYGPickerTypeString = @"WYGPickerTypeString";

@interface WYGPickerViewController ()

@property (nonatomic, assign) WYGPickerType         pickerType;

@property (nonatomic, strong) WYGPickerBottomView         *bottomView;

@end

@implementation WYGPickerViewController

- (instancetype)initWithPickerType:(WYGPickerType)pickerType {
    if(self = [super init]) {
        _pickerType = pickerType;
        self.view.backgroundColor = [UIColor clearColor];
        self.modalPresentationStyle = UIModalPresentationCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (void)configView {
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [self.view setFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:self.bottomView];
    
}


#pragma mark - Action
- (void)userDidCancelPicker {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)userDidConfirmPicker {
    [self dismissViewControllerAnimated:NO completion:nil];
}


#pragma mark - Getter
- (WYGPickerBottomView *)bottomView {
    if(!_bottomView) {
        if([self.pickerType isEqualToString:WYGPickerTypeDate]) {
            _bottomView = [[WYGPickerDateBottomView alloc] init];
            if(self.currentDate) {
                ((WYGPickerDateBottomView *)_bottomView).datePicker.date = self.currentDate;
            }
            if(self.maximumDate) {
                ((WYGPickerDateBottomView *)_bottomView).datePicker.maximumDate = self.maximumDate;
            }
            if(self.minimumDate) {
                ((WYGPickerDateBottomView *)_bottomView).datePicker.minimumDate = self.minimumDate;
            }
            if(self.datePickerMode) {
                ((WYGPickerDateBottomView *)_bottomView).datePicker.datePickerMode = self.datePickerMode;
            }
        } else if ([self.pickerType isEqualToString:WYGPickerTypeString]) {
            _bottomView = [[WYGPickerStringBottomView alloc] initWithStringList:self.strList];
            if(self.initialSelectedStr) {
                NSUInteger index = [self.strList indexOfObject:self.initialSelectedStr];
                if(index && index != NSNotFound) {
                    [((WYGPickerStringBottomView *)_bottomView).pickerView selectRow:index inComponent:0 animated:NO];
                }
            }
        }
        _bottomView = [[WYGPickerBottomView alloc] init];
        __weak typeof(self)weakSelf = self;
        _bottomView.cancelBlock = ^{
            __strong typeof(weakSelf)self = weakSelf;
            [self userDidCancelPicker];
        };
        _bottomView.doneBlock = ^{
            __strong typeof(weakSelf)self = weakSelf;
            [self userDidConfirmPicker];
        };
    }
    return _bottomView;
}

@end
