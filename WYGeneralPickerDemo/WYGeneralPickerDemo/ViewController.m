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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lb = [UILabel new];
    lb.frame = CGRectMake(100, 100, 100, 100);
    lb.text = @"ksvbckjabc";
    lb.textColor = [UIColor redColor];
    lb.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lb];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [WYGeneralPicker showPickerWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDate selectedDate:[NSDate date] doneBlock:^(NSDate *date) {
            
        } cancelBlock:^{
            
        }];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
