//
//  UIImage+Extra.h
//  iOS-Project
//
//  Created by wudan on 2018/12/24.
//  Copyright © 2018 wudan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WDExtra)

/** 设置图片的读取模式 */
+ (nullable UIImage *)wd_initWithName:(NSString *)name renderingMode:(UIImageRenderingMode)mode;

/** 用颜色返回一张图片 */
+ (nullable UIImage *)wd_imageWithColor:(UIColor *)color;

/** 用颜色返回指定尺寸的一张图片 */
+ (nullable UIImage *)wd_imageWithColor:(UIColor *)color size:(CGSize)size;

/** 设置圆角 */
- (nullable UIImage *)wd_imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
