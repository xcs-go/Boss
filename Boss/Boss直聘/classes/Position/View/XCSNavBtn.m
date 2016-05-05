//
//  XCSNavBtn.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/13.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSNavBtn.h"

@implementation XCSNavBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (UIButton *)buttonWithTitle:(NSString *)title selectedTitle:(NSString *)selectedTitle{
    UIButton *btn = [[self alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    //    选中状态
    [btn setTitle:selectedTitle forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    return btn;
}

@end
