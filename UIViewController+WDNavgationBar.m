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
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_showImage attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:_showImage attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:_showImage attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:_showImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:0.5],
                               ]];
    }
    return _showImage;
}

- (UIButton *)centerButton {
    if (!_centerButton) {
        _centerButton = [self setupButton];
        _centerButton.tag = 100;
        _centerButton.translatesAutoresizingMaskIntoConstraints = false;
        _centerButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_centerButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0],
                               [NSLayoutConstraint constraintWithItem:_centerButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-22],
                               ]];
    }
    return _centerButton;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [self setupButton];
        _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _leftButton.tag = 101;
        _leftButton.translatesAutoresizingMaskIntoConstraints = false;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_leftButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1 constant:15],
                               [NSLayoutConstraint constraintWithItem:_leftButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-22],
                               ]];
    }
    return _leftButton;
}

- (UIButton *)leftSecondButton {
    if (!_leftSecondButton) {
        _leftSecondButton = [self setupButton];
        _leftSecondButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _leftSecondButton.tag = 102;
        _leftSecondButton.translatesAutoresizingMaskIntoConstraints = false;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_leftSecondButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.leftButton attribute:NSLayoutAttributeTrailing multiplier:1 constant:10],
                               [NSLayoutConstraint constraintWithItem:_leftSecondButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-22],
                               [NSLayoutConstraint constraintWithItem:_leftSecondButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeLeading multiplier:1 constant:-5]
                               ]];
    }
    return _leftSecondButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [self setupButton];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _rightButton.tag = 103;
        _rightButton.translatesAutoresizingMaskIntoConstraints = false;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_rightButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1 constant:-15],
                               [NSLayoutConstraint constraintWithItem:_rightButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-22],
                               ]];
        [_rightButton layoutIfNeeded];
    }
    return _rightButton;
}

- (UIButton *)rightSecondButton {
    if (!_rightSecondButton) {
        _rightSecondButton = [self setupButton];
        _rightSecondButton.tag = 104;
        _rightSecondButton.translatesAutoresizingMaskIntoConstraints = false;
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:_rightSecondButton attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.rightButton attribute:NSLayoutAttributeLeading multiplier:1 constant:-10],
                               [NSLayoutConstraint constraintWithItem:_rightSecondButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:-22],
                               [NSLayoutConstraint constraintWithItem:_rightSecondButton attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.centerButton attribute:NSLayoutAttributeTrailing multiplier:1 constant:5]
                               ]];
    }
    return _rightSecondButton;
}


- (UIButton *)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
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
        
        [self.view addConstraints:@[
                                    [NSLayoutConstraint constraintWithItem:navigationBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0],
                                    [NSLayoutConstraint constraintWithItem:navigationBar attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0],
                                    [NSLayoutConstraint constraintWithItem:navigationBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0],
                                    [NSLayoutConstraint constraintWithItem:navigationBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:44 + UIApplication.sharedApplication.statusBarFrame.size.height],
                                    ]];
        objc_setAssociatedObject(self, wdNavigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navigationBar;
}

- (void)setNavigationBar:(WDNavgationBar *)navigationBar {
    objc_setAssociatedObject(self, wdNavigationBarKey, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
