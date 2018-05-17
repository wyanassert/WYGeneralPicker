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

@end

@implementation ViewController

- (instancetype)init {
    if(self = [super init]) {
        self.view.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    {
        UILabel *lb = [UILabel new];
        lb.frame = CGRectMake(100, 100, 100, 100);
        lb.text = @"ksvbckjabc";
        lb.textColor = [UIColor redColor];
        lb.backgroundColor = [UIColor clearColor];
        [self.view addSubview:lb];
    }
    
    {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(100, 200, 100, 100);
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:@"Show picker" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    {
        UIButton *btn = [UIButton new];
        btn.frame = CGRectMake(100, 300, 100, 100);
        [btn setBackgroundColor:[UIColor blueColor]];
        [btn setTitle:@"Strings" forState:UIControlStateNormal];
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
        
    } cancelBlock:^{
        
    }];
}

- (void)showStrings {
//    NSUInteger index = [[NSTimeZone knownTimeZoneNames] indexOfObject:[NSTimeZone localTimeZone].name];
//    [WYGeneralPicker showPickerWithTitle:@"Time Zone" rows:[NSTimeZone knownTimeZoneNames] initialSelection:index doneBlock:^(NSDate *date) {
//
//    } cancelBlock:^{
//
//    }];
    [WYGeneralPicker showPickerWithTitle:@"Multiple Title" multipleRows:@[@[@"row0", @"row1", @"row0", @"row1", @"row0", @"row1"],
                                                                          @[@"row2", @"row3", @"row4", @"row2", @"row3", @"row4"],
                                                                          @[@"row5", @"row6", @"row7", @"row8", @"row9", @"row0"]] initialSelections:@[@(2), @(5), @(0)] doneBlock:^(NSArray<NSString *> *selectedStrArray) {
                                                                              
                                                                          } cancelBlock:^{
                                                                              
                                                                          }];
}

@end
