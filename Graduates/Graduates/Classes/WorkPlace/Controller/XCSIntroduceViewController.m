//
//  XCSIntroduceViewController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/31.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSIntroduceViewController.h"

@interface XCSIntroduceViewController ()

@end

@implementation XCSIntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, windowRect.size.height)];
    imageView.image = [UIImage imageNamed:@"new_feature_4"];
    
    [self.view addSubview:imageView];
}

+ (XCSIntroduceViewController *)introduceViewControllerWithTitle:(NSString *)title{
    XCSIntroduceViewController *introduce = [[XCSIntroduceViewController alloc] init];
    introduce.navigationItem.title = title;
    
    return introduce;
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
