//
//  UIButton+Extension.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/29.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (UIButton *)buttonWithImage:(NSString *)image highlightImage:(NSString *)highlightImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    设置按钮的背景图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    //    设置其宽高
    btn.size = btn.currentBackgroundImage.size;
    return btn;
}

//+ (UIButton *)buttonWithViewController:(UIViewController *)controller action:(SEL)action image:(NSString *)image highlightImage:(NSString *)highlightImage{
//    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    //    设置按钮的背景图片
//    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
//    //    设置其宽高
//    btn.size = btn.currentBackgroundImage.size;
//    
////    监听按钮的点击事件
//    [btn addTarget:controller action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
//    
//    return btn;
//}
@end
