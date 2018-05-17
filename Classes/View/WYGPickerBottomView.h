//
//  WYGPickerBottomView.h
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import <UIKit/UIKit.h>

@interface WYGPickerBottomView : UIView

@property (nonatomic, copy) void(^doneBlock)(void);
@property (nonatomic, copy) void(^cancelBlock)(void);

@property (nonatomic, strong) NSString  *title;

- (void)configView;
- (void)cancelAction;
- (void)doneAction;

@end
