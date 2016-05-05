//
//  UIView+Extension.m
//  weibo
//
//  Created by 谢朝森 on 16/3/1.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
/**
 *  x
 */
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

/**
 *  y
 */
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

/**
 *  width
 */
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/**
 *  height
 */
- (CGFloat)height{
    return self.frame.size.height;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

/**
 *  centerx
 */
- (CGFloat)centerx{
    return self.center.x;
}
- (void)setCenterx:(CGFloat)centerx{
    CGPoint center = self.center;
    center.x = centerx;
    self.center = center;
}

/**
 *  centery
 */
- (CGFloat)centery{
    return self.center.y;
}
- (void)setCentery:(CGFloat)centery{
    CGPoint center = self.center;
    center.y = centery;
    self.center = center;
}

/**
 *  size
 */
- (CGSize)size{
    return self.frame.size;
}
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

/**
 *  origin
 */
- (CGPoint)origin{
    return self.frame.origin;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
@end
