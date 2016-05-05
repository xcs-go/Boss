//
//  UIBarButtonItem+Extension.h
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(NSString *)image highlightImage:(NSString *)highlightImage target:(UIViewController *)viewController  action:(SEL)action title:(NSString *)title ;

@end
