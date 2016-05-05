//
//  UIBarButtonItem+Extension.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(UIViewController *)viewController action:(SEL)action title:(NSString *)title{
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    
//    btn.titleLabel.text = title;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
//    计算文字的尺寸
    NSMutableDictionary *textDict = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                    NSForegroundColorAttributeName:[UIColor blackColor],
                                                                                    NSFontAttributeName:[UIFont systemFontOfSize:8.0]
                                                                                    }];
    CGRect textRect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
    
    
//    设置按钮的frame
    CGFloat ImageWidth = btn.currentImage.size.width;
    CGFloat imageHeight = btn.currentImage.size.height;
    CGFloat textWidth = textRect.size.width;
    CGFloat width = ImageWidth + textWidth;
    btn.frame = CGRectMake(0, 0, width, imageHeight);
//    让按钮的宽高自动适应
    [btn sizeToFit];
    
//    btn.size = btn.currentImage.size + textRect.size;
//    btn.size = btn.currentTitle.s
//    监听按钮的点击事件
    [btn addTarget:viewController action:action forControlEvents:UIControlEventTouchUpInside];
    
//    创建UIBarButtonItem
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return item;
}

@end
