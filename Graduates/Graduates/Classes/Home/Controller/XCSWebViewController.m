//
//  XCSWebViewController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/29.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSWebViewController.h"

@interface XCSWebViewController ()

@end

@implementation XCSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 开始加载网页请求
- (void)loadWebWithUrl:(NSString *)url title:(NSString *)title{
//    1、初始化WebView
    UIWebView *webView = [[UIWebView alloc] init];
    
//   2、 设置webView的frame
    webView.frame = CGRectMake(0, 0, windowRect.size.width, windowRect.size.height);
    
    [self.view addSubview:webView];
    
//    3、发送请求
    NSURL *requstUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:requstUrl];
    [webView loadRequest:request];
    
//    4、设置导航条的的titleView
    self.navigationItem.title = title;

    
}
@end
