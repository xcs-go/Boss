//
//  XCSMainNavViewController.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/1.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSMainNavViewController.h"

@interface XCSMainNavViewController ()

@end

@implementation XCSMainNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count == 0) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"head_camera"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"head_camera"] forState:UIControlStateHighlighted];
        btn.size = btn.currentImage.size;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    [super pushViewController:viewController animated:YES];
    
//    设置导航条的背景
    [viewController.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsCompact];
    viewController.navigationController.navigationBar.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"preRegister"] stretchableImageWithLeftCapWidth:1 topCapHeight:1]];

    
}

@end
