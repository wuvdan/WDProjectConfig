//
//  NSString+WDExtra.h
//  AFNetworking
//
//  Created by wudan on 2019/6/1.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (WDExtra)
- (CGFloat)wd_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)wd_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
@end

NS_ASSUME_NONNULL_END
