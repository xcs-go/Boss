//
//  XCSTabBarViewController.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/1.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSTabBarViewController.h"
#import "XCSPositionViewController.h"
#import "XCSCompanyTableViewController.h"
#import "XCSMessageTableViewController.h"
#import "XCSProfileTableViewController.h"
#import "XCSMainNavViewController.h"


@interface XCSTabBarViewController ()

@end

@implementation XCSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    初始化控制器
    XCSPositionViewController *position = [[XCSPositionViewController alloc] init];
    UIImage *positionImage = [UIImage imageNamed:@"tab_main"];
    UIImage *positionHighlightImage = [UIImage imageNamed:@"tab_main_s"];
    NSString *positionName = @"职位";
    [self addChildViewController:position title:positionName image:positionImage highlightImage:positionHighlightImage];
    
    XCSCompanyTableViewController *company = [[XCSCompanyTableViewController alloc] init];
    UIImage *companyImage = [UIImage imageNamed:@"tab_company"];
    UIImage *companyHighlightImage = [UIImage imageNamed:@"tab_company_s"];
    NSString *companyName = @"公司";
    [self addChildViewController:company title:companyName image:companyImage highlightImage:companyHighlightImage];
    
    XCSMessageTableViewController *message = [[XCSMessageTableViewController alloc] init];
    UIImage *messageImage = [UIImage imageNamed:@"tab_contact"];
    UIImage *messageHighlightImage = [UIImage imageNamed:@"tab_contact_s"];
    NSString *messageName = @"消息";
    [self addChildViewController:message title:messageName image:messageImage highlightImage:messageHighlightImage];
    
    XCSProfileTableViewController *profile = [[XCSProfileTableViewController alloc] init];
    UIImage *profileImage = [UIImage imageNamed:@"tab_person"];
    UIImage *profileHighlightImage = [UIImage imageNamed:@"tab_person_s"];
    NSString *profileName = @"我的";
    [self addChildViewController:profile title:profileName image:profileImage highlightImage:profileHighlightImage];
    
    
    
}

/**
 *  添加子控制器
 */
- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(UIImage *)image highlightImage:(UIImage *)highlightImage{
//    设置控制器的相关属性
    childController.navigationItem.title = title;
//    设置图片以及调整图片的位子
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, -10, 0);
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = [highlightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    初始化导航控制器
    XCSMainNavViewController *nav = [[XCSMainNavViewController alloc] initWithRootViewController:childController];
//    将导航控制器作为tabBar的子控制器
    [self addChildViewController:nav];
    
}
@end
