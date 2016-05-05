//
//  XCSTabBarController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSTabBarController.h"
#import "XCSHomeViewController.h"
#import "XCSLifeViewController.h"
#import "XCSUniversityTableViewController.h"
#import "XCSWorkPlaceTableViewController.h"
#import "XCSMainNavController.h"

@interface XCSTabBarController ()

@end

@implementation XCSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化子控制器
//    首页
    XCSHomeViewController *home = [[XCSHomeViewController alloc] init];
    [self addChildViewController:home title:@"社交" image:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
    
//    职业
    XCSWorkPlaceTableViewController *workePlace = [[XCSWorkPlaceTableViewController alloc] init];
    [self addChildViewController:workePlace title:@"职场" image:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNamed:@"tabbar_message_center_selected"]];
//    大学
    XCSUniversityTableViewController *university = [[XCSUniversityTableViewController alloc] init];
    [self addChildViewController:university title:@"大学" image:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNamed:@"tabbar_discover_selected"]];
//    生活
    XCSLifeViewController *life = [[XCSLifeViewController alloc] init];
    [self addChildViewController:life title:@"生活" image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
    
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
//    设置子控制器的相关属性
//    1、设置字体属性
    NSMutableDictionary *normalText = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                      NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                                                                      NSFontAttributeName:[UIFont systemFontOfSize:14.0]
                                                                                      }];
    [childController.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                        NSForegroundColorAttributeName:
                                                                                            [UIColor orangeColor],
                                                                                        NSFontAttributeName:[UIFont systemFontOfSize:14.0]
                                                                                        }];
    [childController.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
//    设置字体
    childController.title = title;
    
//    2、设置图片
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    3、初始化导航控制器,将传入进来的控制器作为导航控制器的根控制器
    XCSMainNavController *nav = [[XCSMainNavController alloc] initWithRootViewController:childController];
    
//    4、将导航控制器设置为tabBarController的子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
