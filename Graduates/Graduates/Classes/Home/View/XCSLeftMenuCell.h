//
//  XCSTableViewCell.h
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XCSLeftModel;
@interface XCSLeftMenuCell : UITableViewCell
/**
 *  左侧cell的模型数据
 */
@property(nonatomic, strong)XCSLeftModel* model;

/**
 *  创建cell
 */
+ (XCSLeftMenuCell *)leftMenuCellWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
