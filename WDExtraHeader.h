//
//  WDExtraHeader.h
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#ifndef WDExtraHeader_h
#define WDExtraHeader_h

#import "UIImage+WDExtra.h"
#import "UIFont+WDExtra.h"
#import "UIView+WDExtra.h"
#import "UIViewController+WDNavgationBar.h"
#import "UIScrollView+WDNoData.h"
#import "UINavigationController+WDStatusBar.h"


#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
///=============================================================================

#pragma mark - Application相关
// APP对象 （单例对象）
#define kApplication         [UIApplication sharedApplication]
// NSUserDefaults实例化
#define kUserDefaults        [NSUserDefaults standardUserDefaults]
// 通知中心 （单例对象）
#define kNotificationCenter  [NSNotificationCenter defaultCenter]
//获取temp
#define kPathTemp            NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache           [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
///=============================================================================

#pragma mark - 屏幕坐标、尺寸相关
// 判断是否iPhone X
#define kIS_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

// 判断是否Plus系列
#define kIS_iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)

// 屏幕高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
// 状态栏高度
#define kStatusBarHeight        UIApplication.sharedApplication.statusBarFrame.size.height
// 顶部导航栏高度
#define kNavigationBarHeight    44.f
// 状态栏高度 + 顶部导航栏高度
#define kSafeAreaTopHeight      (UIApplication.sharedApplication.statusBarFrame.size.height + 44)
// 底部安全距离
#define kSafeAreaBottomHeight   (kIS_iPhoneX ? 34.f : 0.f)
// Tabbar高度
#define kTabbarHeight           49.f

#pragma mark - 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;
///=============================================================================

#endif /* WDExtraHeader_h */
