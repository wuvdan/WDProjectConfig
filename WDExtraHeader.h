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
#import "UIScrollView+WDNoData.h"
#import "UINavigationController+WDStatusBar.h"
#import "UIView+WDExtra.h"
#import "NSString+WDExtra.h"

#pragma mark - 字体、颜色相关
#define kFONT_SIZE(f)            [UIFont systemFontOfSize:(f)]
#define kFONT_BOLD_SIZE(f)       [UIFont boldSystemFontOfSize:(f)]
#define kFONT_ITALIC_SIZE(f)     [UIFont italicSystemFontOfSize:(f)]
#define kRGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]
#define kRGBACOLOR(r,g,b,a)      [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)]
#define kRandomColor             [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
#define kColorWithHex(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
///=============================================================================

#pragma mark - 图片加载
// 加载图片
#define kGetImage(imageName)                        [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
// 读取本地图片 （文件名，后缀名）
#define kGetBundleImage(__FILENAME__,__EXTENSION__) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:__FILENAME__ ofType:__EXTENSION__]]
///=============================================================================

#pragma mark - 控制台打印
#ifdef DEBUG
#define kLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
///=============================================================================

#pragma mark - 判断数据是否为空
// 字符串是否为空
#define kISNullString(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// 数组是否为空
#define kISNullArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])
// 字典是否为空
#define kISNullDict(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0 || [dic isEqual:[NSNull null]])
// 是否是空对象
#define kISNullObject(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
///=============================================================================

#pragma mark - Application相关
// APP对象 （单例对象）
#define kApplication         [UIApplication sharedApplication]
// APP对象
#define kAppDelegate         (AppDelegate*)[[UIApplication sharedApplication] delegate]
// 主窗口 （keyWindow）
#define kKeyWindow           [UIApplication sharedApplication].keyWindow
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
#define kIS_iPhoneX             (UIApplication.sharedApplication.statusBarFrame.size.height > 20 ? YES : NO)
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
#define kScreenWidthRate        ([[UIScreen mainScreen] bounds].size.width / 375.f)
// 实际宽尺寸
#define kSuitWidthSize(size)    kScreenWidthRate * (size)
// 控件尺寸比例
#define kScreenHeightRate       ([[UIScreen mainScreen] bounds].size.height / 667.f)
// 实际高尺寸
#define kSuitHeightSize(size)   kScreenHeightRate * (size)
///=============================================================================

#pragma mark - 强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type)  __strong typeof(type) type = weak##type;
///=============================================================================

#endif /* WDExtraHeader_h */
