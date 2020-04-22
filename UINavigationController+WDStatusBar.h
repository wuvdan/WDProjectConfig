//
//  UINavigationController+WDStatusBar.h
//  WDProjectCongureDemo
//
//  Created by wudan on 2018/12/26.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (WDStatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle;

- (BOOL)prefersStatusBarHidden;

@end

NS_ASSUME_NONNULL_END
