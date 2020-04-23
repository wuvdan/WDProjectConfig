//
//  UIView+WDExtra.m
//  
//
//  Created by wudan on 2018/12/29.
//

#import "UIView+WDExtra.h"

@implementation UIView (WDExtra)

/// frame 快捷访问
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

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

//// 控件尺寸比例
CGFloat kSuitWidthSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.width / 375.f) * value;
}

// 控件尺寸比例
CGFloat kSuitHeightSize(CGFloat value) {
    return ([[UIScreen mainScreen] bounds].size.height / 667.f) * value;
}
///=============================================================================

@end
