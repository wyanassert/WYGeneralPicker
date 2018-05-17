//
//  WYGPickerBottomView.m
//  Pods-WYGeneralPickerDemo
//
//  Created by wyan assert on 2018/5/11.
//

#import "WYGPickerBottomView.h"

#define WYGPickerButtonWidth 70

@interface WYGPickerBottomView()

@property (nonatomic, strong) UIView   *lineView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *doneButton;
@property (nonatomic, strong) UILabel  *titleLabel;

@end

@implementation WYGPickerBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self configView];
    }
    return self;
}

- (instancetype)init {
    if(self = [super initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 220, [UIScreen mainScreen].bounds.size.width, 220)]) {
        [self configView];
    }
    return self;
}

#pragma mark - Private
- (void)configView {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.lineView];
    [self addSubview:self.doneButton];
    [self addSubview:self.cancelButton];
    [self addSubview:self.titleLabel];
}


#pragma mark - Action
- (void)doneAction {
    if(self.doneBlock) {
        self.doneBlock();
    }
}

- (void)cancelAction {
    if(self.cancelBlock) {
        self.cancelBlock();
    }
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}


#pragma mark - Getter
- (UIView *)lineView {
    if(!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0.5)];
        _lineView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
    }
    return _lineView;
}

- (UIButton *)cancelButton {
    if(!_cancelButton) {
        UIButton *btn = [UIButton new];
        [btn setFrame:CGRectMake(16, 10, WYGPickerButtonWidth, 24)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitle:NSLocalizedString(@"CANCEL", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [btn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton = btn;
    }
    return _cancelButton;
}

- (UIButton *)doneButton {
    if(!_doneButton) {
        UIButton *btn = [UIButton new];
        [btn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 16 - WYGPickerButtonWidth, 10, WYGPickerButtonWidth, 24)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitle:NSLocalizedString(@"DONE", nil) forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [btn addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];
        _doneButton = btn;
    }
    return _doneButton;
}

- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100, 10, 200, 24)];
        _titleLabel.text = NSLocalizedString(@"", nil);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

@end
