//
//  UIViewController+WDNavgationBar.m
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIViewController+WDNavgationBar.h"

@implementation WDNavgationBar

- (void)setIsShowBottomLine:(BOOL)isShowBottomLine {
    _isShowBottomLine = isShowBottomLine;
    self.showImage.hidden = !isShowBottomLine;
}

- (UIView *)showImage {
    if (!_showImage) {
        _showImage = [[UIView alloc] init];
        _showImage.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
        [self addSubview:_showImage];
        _showImage.translatesAutoresizingMaskIntoConstraints = false;
        [[_showImage.leadingAnchor constraintEqualToAnchor:self.leadingAnchor] setActive:true];
        [[_showImage.trailingAnchor constraintEqualToAnchor:self.trailingAnchor] setActive:true];
        [[_showImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:true];
        [[_showImage.heightAnchor constraintEqualToConstant:0.5] setActive:true];
    }
    return _showImage;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [self setupButton];
        _centerButton.tag = 100;
        _centerButton.translatesAutoresizingMaskIntoConstraints = false;
        [[_centerButton.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:true];
        [[_centerButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-22] setActive:true];
    }
    return _centerButton;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [self setupButton];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _leftButton.tag = 101;
        _leftButton.translatesAutoresizingMaskIntoConstraints = false;
        [[_leftButton.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15] setActive:true];
        [[_leftButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-22] setActive:true];
    }
    return _leftButton;
}

- (UIButton *)leftSecondButton {
    if (!_leftSecondButton) {
        _leftSecondButton = [self setupButton];
        _leftSecondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _leftSecondButton.tag = 102;
        _leftSecondButton.translatesAutoresizingMaskIntoConstraints = false;
        [[_leftSecondButton.leadingAnchor constraintEqualToAnchor:self.leftButton.trailingAnchor constant:10] setActive:true];
        [[_leftSecondButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-22] setActive:true];
        [[_leftSecondButton.trailingAnchor constraintEqualToAnchor:self.centerButton.leadingAnchor constant:-10] setPriority:UILayoutPriorityDefaultLow];
    }
    return _leftSecondButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [self setupButton];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _rightButton.tag = 103;
        _rightButton.translatesAutoresizingMaskIntoConstraints = false;
        [[_rightButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15] setActive:true];
        [[_rightButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-22] setActive:true];
        [_rightButton layoutIfNeeded];
    }
    return _rightButton;
}

- (UIButton *)rightSecondButton {
    if (!_rightSecondButton) {
        _rightSecondButton = [self setupButton];
        _rightSecondButton.tag = 104;
        _rightSecondButton.translatesAutoresizingMaskIntoConstraints = false;
        [[_rightSecondButton.trailingAnchor constraintEqualToAnchor:self.rightButton.leadingAnchor constant:-10] setActive:true];
        [[_rightSecondButton.centerYAnchor constraintEqualToAnchor:self.bottomAnchor constant:-22] setActive:true];
        [[_rightSecondButton.leadingAnchor constraintEqualToAnchor:self.centerButton.trailingAnchor constant:-10] setPriority:UILayoutPriorityDefaultLow];
    }
    return _rightSecondButton;
}


- (UIButton *)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.adjustsImageWhenHighlighted = NO;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - Private

- (void)buttonTouched:(UIButton *)sender {
    
    switch (sender.tag) {
        case 100:
        {
            if (self.centerButtonBlock) {
                self.centerButtonBlock();
            }
        }
            break;
        case 101:
        {
            [self.viewController.navigationController popViewControllerAnimated:YES];
            if (self.leftButtonBlock) {
                self.leftButtonBlock();
            }
        }
            break;
        case 102:
        {
            if (self.leftSecondButtonBlock) {
                self.leftSecondButtonBlock();
            }
        }
            break;
        case 103:
        {
            if (self.rightButtonBlock) {
                self.rightButtonBlock();
            }
        }
            break;
        case 104:
        {
            if (self.rightSecondButtonBlock) {
                self.rightSecondButtonBlock();
            }
        }
            break;
        default:
            break;
    }
}


@end

#import <objc/runtime.h>
const char *wdNavigationBarKey = "wdNavigationBarKey";

@implementation UIViewController (WDNavgationBar)

- (WDNavgationBar *)navigationBar {
    WDNavgationBar *navigationBar = objc_getAssociatedObject(self, wdNavigationBarKey);
    if (!navigationBar) {
        navigationBar = [[WDNavgationBar alloc] init];
        navigationBar.backgroundColor = UIColor.whiteColor;
        navigationBar.isShowBottomLine = true;
        [self.view addSubview:navigationBar];
        navigationBar.translatesAutoresizingMaskIntoConstraints = false;
        [[navigationBar.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:true];
        [[navigationBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:true];
        [[navigationBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:true];
        [[navigationBar.heightAnchor constraintEqualToConstant:44 + UIApplication.sharedApplication.statusBarFrame.size.height] setActive:true];
        objc_setAssociatedObject(self, wdNavigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationBar;
}

- (void)setNavigationBar:(WDNavgationBar *)navigationBar {
    objc_setAssociatedObject(self, wdNavigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
