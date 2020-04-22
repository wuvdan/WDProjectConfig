//
//  UINavigationController+WDStatusBar.m
//  WDProjectCongureDemo
//
//  Created by wudan on 2018/12/26.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UINavigationController+WDStatusBar.h"

@implementation UINavigationController (WDStatusBar)

- (UIStatusBarStyle)preferredStatusBarStyle {
    return [[self topViewController] preferredStatusBarStyle];
}

- (BOOL)prefersStatusBarHidden {
    return [[self topViewController] prefersStatusBarHidden];
}

@end
