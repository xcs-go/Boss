//
//  XCSRecommandTableViewHeadView.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/15.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSRecommandTableViewHeadView.h"

@implementation XCSRecommandTableViewHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)recommandTableViewHeadView{
    XCSRecommandTableViewHeadView *view = [[[NSBundle mainBundle] loadNibNamed:@"XCSRecommandTableViewHeadView" owner:nil options:nil] lastObject];
    return view;
}
@end
