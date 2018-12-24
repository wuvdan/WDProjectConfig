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
#import "UIViewController+WDNavgationBar.h"
#import "UIViewController+WDTableView.h"

#pragma mark - 字体、颜色相关

///=============================================================================
/// @name 字体、颜色相关
///=============================================================================
#define FONT_SIZE(f)            [UIFont systemFontOfSize:(f)]
#define FONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define FONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define RGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define RandomColor             [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define ColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
///=============================================================================

#pragma mark - NSLog相关
/// @name NSLog相关
///=============================================================================
#ifdef DEBUG
#define WDLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif
///=============================================================================

#pragma mark - 判断数据是否为空
///=============================================================================
/// @name 判断数据是否为空
///=============================================================================
#define kStringIsEmpty(str)     ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define kArrayIsEmpty(array)    (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic)       (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
///=============================================================================

#pragma mark - Application相关
///=============================================================================
/// @name Application
///=============================================================================
#define APPLICATION         [UIApplication sharedApplication]
#define APPDLE              (AppDelegate*)[APPLICATION delegate]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
//获取temp
#define kPathTemp           NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache          [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
///=============================================================================

#pragma mark - 屏幕坐标、尺寸相关
///=============================================================================
/// @name 屏幕坐标、尺寸相关
///=============================================================================
//判断是否iPhone X
#define IS_iPhoneX              UIApplication.sharedApplication.statusBarFrame.size.height > 20 : YES : NO
// 屏幕高度
#define kScreenHeight           [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define kScreenWidth            [[UIScreen mainScreen] bounds].size.width
// 状态栏高度
#define kStatusBarHeight        (IS_iPhoneX ? 44.f : 20.f)
// 顶部导航栏高度
#define kNavigationBarHeight    44.f
// 顶部安全距离
#define kSafeAreaTopHeight      UIApplication.sharedApplication.statusBarFrame.size.height + 44
// 底部安全距离
#define kSafeAreaBottomHeight   (IS_iPhoneX ? 34.f : 0.f)
// Tabbar高度
#define kTabbarHeight           49.f
// 去除上下导航栏剩余中间视图高度
#define ContentHeight           (kScreenHeight - kSafeAreaTopHeight - kSafeAreaBottomHeight - kTabbarHeight)
///=============================================================================

///=============================================================================
/// @name Frame相关
///=============================================================================
// 控件尺寸比例
#define kScreenWidthRate         (kScreenWidth/375.f)
// 实际宽尺寸
#define kSuitWidthSize(size)      kScreenWidthRate * (size)

// 控件尺寸比例
#define kScreenHeightRate         (kScreenHeight/667.f)
// 实际高尺寸
#define kSuitHeightSize(size)      kScreenHeightRate * (size)
///=============================================================================


#endif /* WDExtraHeader_h */
