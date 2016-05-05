//
//  XCSNavView.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/13.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSNavView.h"
#import "XCSNavBtn.h"

#define number 4
#define Btnwidth  (self.width / number)

/**
 按钮类型
 */
typedef enum {
    buttonTypeRecommand, // 推荐
    buttonTypeNew,       // 最新
    buttonTypeHot        // 最热
}buttonType;

@interface XCSNavView ()

/**
 *  按钮底部的view
 */
@property(nonatomic, weak)UIView * lineView;


@end


@implementation XCSNavView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
//        允许用户交互
        self.userInteractionEnabled = YES;
//        添加按钮
        [self addBtn];
        
//        添加按钮底部的蓝色view
        [self addLineView];
    }
    return self;
}

/**
 *  添加按钮
 */
- (void)addBtn{
//    推荐
    UIButton *recommandBtn = [XCSNavBtn buttonWithTitle:@"推荐" selectedTitle:@"推荐"];
    recommandBtn.tag = buttonTypeRecommand;
    [recommandBtn addTarget:self action:@selector(buttondidclick:) forControlEvents:UIControlEventTouchUpInside];
//    默认被选中
//    recommandBtn.selected = YES;
//    发送通知给外面说明自己被选中
    [[NSNotificationCenter defaultCenter] postNotificationName:@"RecommandDidClick" object:nil userInfo:nil];
    [self addSubview:recommandBtn];
    
//    最新
    UIButton *newBtn = [XCSNavBtn buttonWithTitle:@"最新" selectedTitle:@"最新"];
    newBtn.tag = buttonTypeNew;
    [newBtn addTarget:self action:@selector(buttondidclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:newBtn];
    
//    热门
    UIButton *hotBtn = [XCSNavBtn buttonWithTitle:@"热门" selectedTitle:@"热门"];
    hotBtn.tag = buttonTypeHot;
    [hotBtn addTarget:self action:@selector(buttondidclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:hotBtn];
}

/**
 *  添加按钮底部的蓝色的view
 */
- (void)addLineView{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor greenColor];
    lineView.height = 1;
//    隐藏显示
    lineView.hidden = YES;
    self.lineView = lineView;
    [self addSubview:lineView];
}

/**
 *  布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
//    宽度
    CGFloat btnWith = Btnwidth;
    CGFloat btnHeight = self.height;
    
    self.lineView.y = btnHeight - 1;
    self.lineView.width = btnWith;
    
    for (int i = 0; i<self.subviews.count; i++) {
        if ([self.subviews[i] isKindOfClass:[UIButton class]]) {
            UIButton *btn = self.subviews[i];
            btn.width = btnWith;
            btn.height = btnHeight;
            btn.x = i * btnWith;
            btn.y = 0;
        }
    }
}


- (void)buttondidclick:(UIButton *)btn{
//    通知代理
    if ([self.delegate respondsToSelector:@selector(navViewDidClickWithView:withButton:lineView:)]) {
        [self.delegate navViewDidClickWithView:self withButton:btn lineView:self.lineView];
    }
}
@end
