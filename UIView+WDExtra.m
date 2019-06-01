//
//  UIView+WDExtra.m
//  AFNetworking
//
//  Created by wudan on 2019/6/1.
//

#import "UIView+WDExtra.h"
#import <objc/runtime.h>
@implementation UIView (WDExtra)
+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)wd_gradientViewWithColors:(NSArray<UIColor *> *)colors
                            locations:(NSArray<NSNumber *> *)locations
                           startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    UIView *view = [[self alloc] init];
    [view wd_setGradientBackgroundWithColors:colors
                                   locations:locations
                                  startPoint:startPoint
                                    endPoint:endPoint];
    return view;
}

- (void)wd_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors
                                 locations:(NSArray<NSNumber *> *)locations
                                startPoint:(CGPoint)startPoint
                                  endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.wd_colors = [colorsM copy];
    self.wd_locations = locations;
    self.wd_startPoint = startPoint;
    self.wd_endPoint = endPoint;
}

#pragma mark- Getter&Setter

- (NSArray *)wd_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(wd_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.wd_colors];
    }
}

- (NSArray<NSNumber *> *)wd_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWd_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(wd_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.wd_locations];
    }
}

- (CGPoint)wd_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setWd_startPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(wd_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.wd_startPoint];
    }
}

- (CGPoint)wd_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setWd_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(wd_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.wd_endPoint];
    }
}

@end

@implementation UILabel (WDGradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end
