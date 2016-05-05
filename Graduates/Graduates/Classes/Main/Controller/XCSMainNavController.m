//
//  XCSMainNavController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSMainNavController.h"
#import "UMSocial.h"

@interface XCSMainNavController ()<UMSocialUIDelegate>

@end

@implementation XCSMainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写导航控制器的push方法
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    隐藏底部的tabBar
//     self.hidesBottomBarWhenPushed = YES;
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        //    创建按钮
        UIButton *backBtn = [UIButton buttonWithImage:@"navigationbar_back" highlightImage:@"navigationbar_back_highlighted"];
        //    监听按钮的点击事件
        [backBtn addTarget:self action:@selector(backBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        //    设置左边的控制器的导航栏的左边按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        
        
        UIButton *sharedBtn = [UIButton buttonWithImage:@"navigationbar_more" highlightImage:@"navigationbar_more_highlighted"];
        [sharedBtn addTarget:self action:@selector(sharedBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
        
        //    设置右边的控制器的导航栏的右按钮
        viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sharedBtn];
    }
    [super pushViewController:viewController animated:YES];
    
}

/**
 *  按钮的监听方法
 */
- (void)backBtnDidClick{
//    回到上一层级
    [self popViewControllerAnimated:YES];
}

- (void)sharedBtnDidClick{
//    集成分享功能
#warning TODO
    //注意：分享到微信好友,微信朋友圈,微信收藏,QQ空间,QQ好友,来往好友,来往朋友圈,易信好友,易信朋友圈,Facebook,Twitter,Instagram等平台需要参考各自的集成方法
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56faa89167e58eaf62001a67"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ,UMShareToRenren,UMShareToDouban,UMShareToEmail,UMShareToSms,UMShareToFacebook,UMShareToTwitter,nil]
                                       delegate:self];
}


@end
