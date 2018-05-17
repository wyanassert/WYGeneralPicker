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

@property (nonatomic, strong) UIView                      *shadowView;
@property (nonatomic, strong) WYGPickerBottomView         *bottomView;

@end

@implementation WYGPickerViewController

- (instancetype)initWithPickerType:(WYGPickerType)pickerType {
    if(self = [super init]) {
        _pickerType = pickerType;
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self configShowAnimate];
}

#pragma mark - Private
- (void)configView {
//    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    [self.view setFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:self.shadowView];
    [self.view addSubview:self.bottomView];
    
}

- (void)configShowAnimate {
    [UIView animateWithDuration:0.3 animations:^{
        self.shadowView.alpha = 0.3;
        
        self.bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 220, [UIScreen mainScreen].bounds.size.width, 220);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)configDismissAnimate:(void (^)(void))block {
    [UIView animateWithDuration:0.3 animations:^{
        self.shadowView.alpha = 0.0;
        
        self.bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 220);
    } completion:^(BOOL finished) {
        if(block) {
            block();
        }
    }];
}


#pragma mark - Action
- (void)userDidCancelPicker {
    
    __weak typeof(self)weakSelf = self;
    [self configDismissAnimate:^{
        __strong typeof(weakSelf)self = weakSelf;
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

- (void)userDidConfirmPicker {
    __weak typeof(self)weakSelf = self;
    [self configDismissAnimate:^{
        __strong typeof(weakSelf)self = weakSelf;
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}


#pragma mark - Getter
- (UIView *)shadowView {
    if(!_shadowView) {
        _shadowView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _shadowView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _shadowView.alpha = 0;
    }
    return _shadowView;
}

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
            ((WYGPickerDateBottomView *)_bottomView).datePicker.datePickerMode = self.datePickerMode;
        } else if ([self.pickerType isEqualToString:WYGPickerTypeString]) {
            _bottomView = [[WYGPickerStringBottomView alloc] initWithStringList:self.strList];
            if(self.initialSelectedIndex && self.initialSelectedIndex < self.strList.count) {
                [((WYGPickerStringBottomView *)_bottomView).pickerView selectRow:self.initialSelectedIndex inComponent:0 animated:NO];
            }
        }
        _bottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 220);
        _bottomView.title = self.pickerTitle;
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
