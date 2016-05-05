//
//  XCSHomeViewController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSHomeViewController.h"
#import "XCSHomeModel.h"
#import "XCSWebViewController.h"
#import "XCSLeftMenuViewController.h"


@interface XCSHomeViewController ()

/**
 *  社交数据模型
 */
@property(nonatomic, strong)NSMutableArray* homeModel;

/**
 *  左侧视图控制器
 */
@property(nonatomic, strong)XCSLeftMenuViewController* leftMenuController;


@end

@implementation XCSHomeViewController

/**
 *  懒加载
 *
 *  @return 模型数组
 */
- (NSMutableArray *)homeModel{
    if (_homeModel == nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"home.plist" ofType:nil];
        NSArray *homeArray = [NSArray arrayWithContentsOfFile:filePath];
        
        NSMutableArray *array = [NSMutableArray array];
//        循环便利字典数组
        for (NSDictionary *homeDict in homeArray) {
            XCSHomeModel *home = [XCSHomeModel homeModelWithDictionary:homeDict];
            [array addObject:home];
        }
        self.homeModel = array;
    }
    return _homeModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航栏
    [self setNav];
    
    
}

/**
 *  设置导航栏
 */
- (void)setNav{
//    左边
    UIButton *leftNav = [UIButton buttonWithImage:@"navigationbar_friendsearch" highlightImage:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftNav];
    
//    监听按钮的点击事件
    [leftNav addTarget:self action:@selector(leftNavClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    右边
    UIButton *rightNav = [UIButton buttonWithImage:@"navigationbar_pop" highlightImage:@"navigationbar_pop_highlighted"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightNav];
    
//    [self.view addGestureRecognizer:<#(UIGestureRecognizer *)#>]
    
}

- (void)leftNavClick:(UIButton *)button{
//    创建一个新的控制器，将新的控制器的视图添加到window窗口上
    XCSLeftMenuViewController *leftMenu = [[XCSLeftMenuViewController alloc] init];
    
    self.leftMenuController = leftMenu;
    //    取出window窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window insertSubview:leftMenu.view aboveSubview:self.view];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
//    取出数据模型
    XCSHomeModel *home = self.homeModel[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:home.image];
    cell.detailTextLabel.text = home.text;
    cell.textLabel.text = home.name;
    cell.textLabel.numberOfLines = 3;
    
    return cell;
}

/**
 *  点击cell执行的操作
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    取出模型
    XCSHomeModel *home = self.homeModel[indexPath.row];
//    取出需要加载的url
    NSString *loadurl = home.url;
    
//    初始化网页请求控制器
    XCSWebViewController *webViewController = [[XCSWebViewController alloc] init];
    
//    发送请求
    [webViewController loadWebWithUrl:loadurl title:home.name];
    
//    push出网页控制器（XCSWebViewController）
    [self.navigationController pushViewController:webViewController animated:YES];
}
@end
