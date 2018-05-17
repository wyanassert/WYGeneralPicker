[![Version](http://img.shields.io/cocoapods/v/WYGeneralPicker.svg)](https://cocoapods.org/pods/WYGeneralPicker)
[![License](https://img.shields.io/cocoapods/l/WYGeneralPicker.svg)](https://cocoapods.org/pods/WYGeneralPicker)
[![Platform](https://img.shields.io/cocoapods/p/WYGeneralPicker.svg)](http://cocoadocs.org/docsets/WYGeneralPicker)

## WYGeneralPicker
Support DatePicker, StringPicker and MultipleStringPicker.

A simple replacement of [ActionSheetPicker-3.0](!https://github.com/skywinder/ActionSheetPicker-3.0)

* Why not use `ActionSheetPicker-3.0`?
   see the issue [ActionSheetPicker popover selection is not working for iPad on iOS 11+](!https://github.com/skywinder/ActionSheetPicker-3.0/issues/384). So I just want to replace `ActionSheetPicker-3.0` easily if the issue not fixed.
---

### How To Use

1. first step

 `pod WYGeneralPicker`

    and then

 `#import "ViewController.h"`

2. present Picker using code below

```
    // DatePicker
    [WYGeneralPicker showPickerWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDateAndTime selectedDate:[NSDate date] minimumDate:[NSDate dateWithTimeIntervalSinceNow:-(3600*24 * 3)] maximumDate:[NSDate dateWithTimeIntervalSinceNow:(3600*24 * 3)] doneBlock:^(NSDate *date) {

    } cancelBlock:^{

    }];
```

```
    // StringPicker
    NSUInteger index = [[NSTimeZone knownTimeZoneNames] indexOfObject:[NSTimeZone localTimeZone].name];
    [WYGeneralPicker showPickerWithTitle:@"Time Zone" rows:[NSTimeZone knownTimeZoneNames] initialSelection:index doneBlock:^(NSString *selectedStr) {

    } cancelBlock:^{

    }];
```


```
    // MultipleStringPicker
    [WYGeneralPicker showPickerWithTitle:@"Multiple Title" multipleRows:@[@[@"row0", @"row1", @"row0", @"row1", @"row0", @"row1"],
                                                                          @[@"row2", @"row3", @"row4", @"row2", @"row3", @"row4"],
                                                                          @[@"row5", @"row6", @"row7", @"row8", @"row9", @"row0"]]
                       initialSelections:@[@(2), @(5), @(0)] doneBlock:^(NSArray<NSString *> *selectedStrArray) {

                       } cancelBlock:^{

                       }];
```
