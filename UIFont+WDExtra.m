//
//  UIFont+Extra.m
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIFont+WDExtra.h"
#import <objc/runtime.h>

@interface NSObject (WDExtra)
// 交换类方法
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

@end


@implementation NSObject (WDExtra)

#pragma mark - 交换方法
+ (BOOL)swizzleClassMethod:(SEL)originalSel with:(SEL)newSel {
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

@end

@implementation UIFont (WDExtra)

+ (void)load {
    [self swizzleClassMethod:@selector(systemFontOfSize:) with:@selector(wd_systemFontOfSize:)];
    [self swizzleClassMethod:@selector(boldSystemFontOfSize:) with:@selector(wd_boldSystemFontOfSize:)];
    [self swizzleClassMethod:@selector(fontWithName:size:) with:@selector(wd_fontWithName:size:)];
    [self swizzleClassMethod:@selector(italicSystemFontOfSize:) with:@selector(wd_italicSystemFontOfSize:)];
}

+ (UIFont *)wd_systemFontOfSize:(CGFloat)pxSize {
    UIFont *font = [UIFont wd_systemFontOfSize:pxSize*[UIScreen mainScreen].bounds.size.width/375.0];
    return font;
}

//粗体
+ (UIFont *)wd_boldSystemFontOfSize:(CGFloat)pxSize {
    UIFont *font = [UIFont wd_boldSystemFontOfSize:pxSize*[UIScreen mainScreen].bounds.size.width/375.0];
    return font;
}

// 字体名称 + 大小
+ (UIFont *)wd_fontWithName:(NSString *)fontFamilyName size:(CGFloat)pxSize {
    UIFont *font = [UIFont wd_fontWithName:fontFamilyName size:pxSize*[UIScreen mainScreen].bounds.size.width/375.0];
    return font;
}

// 斜体
+ (UIFont *)wd_italicSystemFontOfSize:(CGFloat)pxSize {
    UIFont *font = [UIFont wd_italicSystemFontOfSize:pxSize*[UIScreen mainScreen].bounds.size.width/375.0];
    return font;
}

@end
