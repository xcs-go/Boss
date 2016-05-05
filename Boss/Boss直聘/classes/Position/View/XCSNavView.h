//
//  XCSNavView.h
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/13.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCSNavView;
@protocol XCSNavViewDelegate <NSObject>
- (void)navViewDidClickWithView:(XCSNavView *)view withButton:(UIButton *)button lineView:(UIView *)lineView;
@end

@interface XCSNavView : UIView
@property(nonatomic, weak)id<XCSNavViewDelegate> delegate;

@end
