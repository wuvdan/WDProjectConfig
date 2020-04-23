//
//  UIView+WDExtra.h
//  
//
//  Created by wudan on 2018/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (WDExtra)

/** left: frame.origin.x */
@property (nonatomic) CGFloat left;
/** top: frame.origin.y */
@property (nonatomic) CGFloat top;
/** right: frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;
/** bottom: frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;
/** width: frame.size.width */
@property (nonatomic) CGFloat width;
/** height: frame.size.height */
@property (nonatomic) CGFloat height;
/** centerX: center.x */
@property (nonatomic) CGFloat centerX;
/** centerY: center.y */
@property (nonatomic) CGFloat centerY;
/** origin: frame.origin */
@property (nonatomic) CGPoint origin;
/** size: frame.size */
@property (nonatomic) CGSize  size;

#pragma mark - 字体、颜色相关
UIFont *kNormalFont(CGFloat size);
UIFont *kNormalWFont(CGFloat size, UIFontWeight weight);
UIColor *kHexColor(NSInteger hex);
UIColor *kHexAColor(NSInteger hex,CGFloat a);
UIColor *kRGBColor(CGFloat r, CGFloat g, CGFloat b);
UIColor *kRGBAColor(CGFloat r, CGFloat g, CGFloat b, CGFloat a);

#pragma mark - 图片加载
UIImage *kTemplateImage(NSString *named);

#pragma mark - 判断数据是否为空
// 字符串是否为空
BOOL kIsNullString(NSString *str);
// 数组是否为空
BOOL kIsNullArray(NSArray *array);
// 字典是否为空
BOOL kIsNullDict(NSDictionary *dic);
// 是否是空对象
BOOL kIsNullObject(id obj);

#pragma mark - 屏幕比例处理
//// 控件尺寸比例
CGFloat kSuitWidthSize(CGFloat value);
// 控件尺寸比例
CGFloat kSuitHeightSize(CGFloat value);
@end

NS_ASSUME_NONNULL_END
