//
//  XCSRecommandTableViewHeadView.h
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/15.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCSRecommandTableViewHeadView : UITableViewHeaderFooterView
/**
 *  右上角的图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *rightIconImageView;


/**
 *  快速创建xib
 */
+ (instancetype)recommandTableViewHeadView;
@end
