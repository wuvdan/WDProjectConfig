//
//  UIImage+Extra.m
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import "UIImage+WDExtra.h"

@implementation UIImage (WDExtra)

#pragma mark - 设置图片读取模式
+ (UIImage *)wd_initWithName:(NSString *)name renderingMode:(UIImageRenderingMode)mode {
    UIImage *image = [[UIImage imageNamed:name] imageWithRenderingMode:mode];
    return image;
}

#pragma mark - 用颜色返回一张图片
+ (UIImage *)wd_imageWithColor:(UIColor *)color {
    return [self wd_imageWithColor:color size:CGSizeMake(1, 1)];
}

#pragma mark - 用颜色返回一张图片
+ (UIImage *)wd_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 高效添加圆角图片
- (UIImage *)wd_imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(ctx,path.CGPath);
    CGContextClip(ctx);
    [self drawInRect:rect];
    CGContextDrawPath(ctx, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
