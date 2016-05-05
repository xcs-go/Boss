//
//  UIView+Extension.m
//  HW
//
//  Created by 谢朝森 on 15/10/22.
//  Copyright (c) 2015年 xcs. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setWidth:(CGFloat)width{
//    分类不会自动生成_变量，所以这里使用self.width不会循环错误
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY{
    return self.center.y;
}

- (void)setHeight:(CGFloat)height{
    
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.frame.size;
}

- (void)setX:(CGFloat)X{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
    
}

- (CGFloat)X{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)Y{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

- (CGFloat)Y{
    return self.frame.origin.y;
}
@end
