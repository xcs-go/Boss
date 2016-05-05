//
//  XCSTestController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSTestController.h"
#import "XCSHomeViewController.h"
@interface XCSTestController ()

@end

@implementation XCSTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] forState:UIControlStateHighlighted];
    backBtn.size = backBtn.currentBackgroundImage.size;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    
//    监听按钮的点击事件
    [backBtn addTarget:self action:@selector(backBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backBtnDidClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
