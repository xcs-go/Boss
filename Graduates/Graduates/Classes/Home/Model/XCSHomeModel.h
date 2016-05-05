//
//  XCSHomeModel.h
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCSHomeModel : NSObject

/**
 *  应用软件的名称
 */
@property(nonatomic, copy)NSString *name;

/**
 *  应用软件的图标
 */
@property(nonatomic, copy)NSString *image;

/**
 *  应用软件的描述信息
 */
@property(nonatomic, copy)NSString *text;

/**
 *  点击应用软件后需要跳转的url地址
 */
@property(nonatomic, copy)NSString *url;

+ (XCSHomeModel *)homeModelWithDictionary:(NSDictionary *)dict;
@end
