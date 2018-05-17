//
//  ViewController.m
//  WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//  Copyright © 2018年 wyan assert. All rights reserved.
//

#import "ViewController.h"
#import "WYGeneralPicker.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel         *label;

@end

@implementation ViewController

- (instancetype)init {
    if(self = [super init]) {
        self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    {
        UILabel *lb = [UILabel new];
        lb.frame = CGRectMake(100, 100, 200, 100);
        lb.text = @"WYGeneralPicker";
        lb.textColor = [UIColor redColor];
        lb.backgroundColor = [UIColor clearColor];
        lb.textAlignment = NSTextAlignmentCenter;
        self.label = lb;
        [self.view addSubview:lb];
    }
    
    {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(100, 200, 200, 100);
        [btn setTitle:@"Date picker" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(100, 300, 200, 100);
        [btn setTitle:@"String Picker" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showString) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(100, 400, 200, 100);
        [btn setTitle:@"Multiple String" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showStrings) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action
- (void)showAction {
    [WYGeneralPicker showPickerWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDateAndTime selectedDate:[NSDate date] minimumDate:[NSDate dateWithTimeIntervalSinceNow:-(3600*24 * 3)] maximumDate:[NSDate dateWithTimeIntervalSinceNow:(3600*24 * 3)] doneBlock:^(NSDate *date) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd, yyyy hh:mm:ss"];
        NSString *timeText = [formatter stringFromDate:date];
        self.label.text = timeText;
    } cancelBlock:^{
        
    }];
}

- (void)showString {
        NSUInteger index = [[NSTimeZone knownTimeZoneNames] indexOfObject:[NSTimeZone localTimeZone].name];
    [WYGeneralPicker showPickerWithTitle:@"Time Zone" rows:[NSTimeZone knownTimeZoneNames] initialSelection:index doneBlock:^(NSString *selectedStr) {
        self.label.text = selectedStr;
    } cancelBlock:^{
        
    }];
}

- (void)showStrings {
    [WYGeneralPicker showPickerWithTitle:@"Multiple Title" multipleRows:@[@[@"row0", @"row1", @"row0", @"row1", @"row0", @"row1"],
                                                                          @[@"row2", @"row3", @"row4", @"row2", @"row3", @"row4"],
                                                                          @[@"row5", @"row6", @"row7", @"row8", @"row9", @"row0"]]
                       initialSelections:@[@(2), @(5), @(0)] doneBlock:^(NSArray<NSString *> *selectedStrArray) {
                           __block NSString *str = @"";
                           [selectedStrArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                               str = [str stringByAppendingString:obj];
                           }];
                           self.label.text = str;
                       } cancelBlock:^{
                           
                       }];
}

@end
