//
//  XCSHomeModel.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSHomeModel.h"

@implementation XCSHomeModel

+ (XCSHomeModel *)homeModelWithDictionary:(NSDictionary *)dict{
//    实例化模型
    XCSHomeModel *homeModel = [[XCSHomeModel alloc] init];
    homeModel.name = dict[@"name"];
    homeModel.image = dict[@"image"];
    homeModel.text = dict[@"text"];
    homeModel.url = dict[@"url"];
    
    return homeModel;
}

@end
