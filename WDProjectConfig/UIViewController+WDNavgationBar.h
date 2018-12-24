//
//  UIViewController+WDNavgationBar.h
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDNavgationBar : UIView

@property (nonatomic, assign) BOOL isShowBottomLine;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *leftSecondButton;
@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIButton *rightSecondButton;

@property (nonatomic, copy) void (^ leftButtonBlock)(void);
@property (nonatomic, copy) void (^ leftSecondButtonBlock)(void);
@property (nonatomic, copy) void (^ centerButtonBlock)(void);
@property (nonatomic, copy) void (^ rightButtonBlock)(void);
@property (nonatomic, copy) void (^ rightSecondButtonBlock)(void);

@end

@interface UIViewController (WDNavgationBar)

/**
    使用自定义View代替系统导航栏
    1、使用系统手势返回
    2、方便修改透明度
    3、默认是布局设置了为 {0, 0, 屏幕宽， 44 + 状态栏高度}
    4、使用时：无需添加，可以直接设置按钮的样式，如果不显示，则有可能是被当前设置的控件覆盖了；self.view的子控件直接设置其top布局是self.navigationBar的底部视图
 */
@property (nonatomic, strong, nullable) WDNavgationBar *navigationBar;

@end

NS_ASSUME_NONNULL_END
