//
//  XCSBossModel.h
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/15.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCSBossModel : NSObject
/**
 *  职位名称
 */
@property(nonatomic, copy)NSString *positionName;

/**
 *  薪水
 */
@property(nonatomic, copy)NSString *salary;

/**
 *  公司地点
 */
@property(nonatomic, copy)NSString *companyPosition;

/**
 *  公司图片
 */
@property(nonatomic, copy)NSString *companyImage;

/**
 *  工作经验
 */
@property(nonatomic, copy)NSString *workExperiment;

/**
 *  工作经验图片
 */
@property(nonatomic, copy)NSString *workExperimentImage;

/**
 *  学历图片
 */
@property(nonatomic, copy)NSString *educationImage;

/**
 *  学历
 */
@property(nonatomic, copy)NSString *education;

/**
 *  boss图片
 */
@property(nonatomic, copy)NSString *bossimage;

/**
 *  boss姓名
 */
@property(nonatomic, copy)NSString *bossName;

/**
 *  公司名称
 */
@property(nonatomic, copy)NSString *companyName;

/**
 *  boss职位
 */
@property(nonatomic, copy)NSString *bossPosition;

/**
 *  公司规模
 */
@property(nonatomic, copy)NSString *companyPeople;

/**
 *  回复标签
 */
@property(nonatomic, copy)NSString *answer;

/**
 *  回复时间
 */
@property(nonatomic, copy)NSString *answeTime;

@end
