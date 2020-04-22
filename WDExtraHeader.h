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

#pragma mark - 字体、颜色相关
UIFont *kNormalFont(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

UIFont *kNormalWFont(CGFloat size, UIFontWeight weight) {
    return [UIFont systemFontOfSize:size weight:weight];
}

UIColor *kHexColor(NSInteger hex) {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1];
}

UIColor *kHexAColor(NSInteger hex,CGFloat a) {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:a];
}

UIColor *kRGBColor(CGFloat r, CGFloat g, CGFloat b) {
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1];
}

UIColor *kRGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a) {
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a];
}
///=============================================================================

#pragma mark - 图片加载
// 加载图片
UIImage *kTemplateImage(NSString *named) {
    return [[UIImage imageNamed:named] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

///=============================================================================

#if DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif
///=============================================================================

#pragma mark - 判断数据是否为空
// 字符串是否为空
BOOL kIsNullString(NSString *str) {
    return ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO );
}
// 数组是否为空
BOOL kIsNullArray(NSArray *array) {
    return (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]]);
}
// 字典是否为空
BOOL kIsNullDict(NSDictionary *dic) {
    return (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]]);
}
// 是否是空对象
BOOL kIsNullObject(id obj) {
    return obj == nil
    || [obj isKindOfClass:[NSNull class]]
    || ([obj respondsToSelector:@selector(length)] && [(NSData *)obj length] == 0)
    || ([obj respondsToSelector:@selector(count)] && [(NSArray *)obj count] == 0);
}
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

// 控件尺寸比例
CGFloat kSuitWidthSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.width / 375.f) * value;
}

// 控件尺寸比例
CGFloat kSuitHeightSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.height / 667.f) * value;
}
///=============================================================================

#pragma mark - 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;
///=============================================================================

#endif /* WDExtraHeader_h */
