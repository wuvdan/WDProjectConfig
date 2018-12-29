//
//  UIView+WDExtra.h
//  
//
//  Created by wudan on 2018/12/29.
//



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

@end

NS_ASSUME_NONNULL_END
