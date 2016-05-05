//
//  XCSLeftMenuViewController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/30.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSLeftMenuViewController.h"
#import "MJExtension.h"
#import "XCSLeftModel.h"
#import "XCSLeftMenuCell.h"
#import "XCSTestController.h"

@interface XCSLeftMenuViewController () <UITableViewDataSource,UITableViewDelegate>

/**
 *  蒙板遮罩
 */
@property(nonatomic, strong)UIView* cover;

/**
 *  UItableview
 */
@property(nonatomic, strong)UITableView* table;

/**
 *  模型数组
 */
@property(nonatomic, strong)NSArray* leftModel;

@end

@implementation XCSLeftMenuViewController

/**
 *  懒加载
 */
- (NSArray *)leftModel{
    if (!_leftModel) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"leftMenu.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:filePath];
        NSArray *leftMenuArr = [XCSLeftModel mj_objectArrayWithKeyValuesArray:dictArray];
        
        NSMutableArray *array = [NSMutableArray array];
        
        for (XCSLeftModel *model in leftMenuArr) {
            [array addObject:model];
        }
        
        _leftModel = array;
    }
    
    return _leftModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(-windowRect.size.width * 0.8, 0, windowRect.size.width * 0.8, windowRect.size.height);
//    self.view.backgroundColor = [UIColor redColor];
    [self leftModel];
    
//    设置相关的属性
    [self setView];
//    加载遮盖
    [self setCover];
    
//    设置view的显示动画
    [UIView animateWithDuration:1 animations:^{
        self.view.X = 0;
    }];
    
}

// 设置相关的属性
- (void)setView{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_default_big"]];
    imageView.centerX = self.view.width *0.5;
    imageView.Y = 20;
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxY(imageView.frame) + 10;
    
    CGFloat width = self.view.width * 0.8;
    CGFloat height = self.view.height - y;
    
//    创建tableView
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(x, y, width, height) style:UITableViewStylePlain];
//    设置tableView的代理
    self.table = table;
//    设置table的数据源和代理对象
    self.table.dataSource = self;
    table.delegate = self;
    
//    table.backgroundColor = [UIColor redColor];
    table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:table];
}



// 加载遮盖
- (void)setCover{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    UIView *cover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, windowRect.size.height)];
    cover.backgroundColor = [UIColor colorWithRed:180/256.0 green:180/256.0 blue:180/256.0 alpha:0.5];
    //    允许视图与视图进行交互
    cover.userInteractionEnabled = YES;
//    cover.backgroundColor = [UIColor greenColor];
    self.cover = cover;
    [window insertSubview:cover aboveSubview:self.view];
    
    //    监听按钮的手势点击事件
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizered)];
        [cover addGestureRecognizer:tapGestureRecognizer];
}

#pragma mark 手势点击事件
- (void)tapGestureRecognizered{
    [UIView animateWithDuration:1 animations:^{
//        让视图回到原来的位置
        self.view.X = -windowRect.size.width;
//        移除遮盖
        [self.cover removeFromSuperview];
    }];
}


#pragma mark  UITableViewDataSource方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"XCSLeftMenuCell";
    XCSLeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [XCSLeftMenuCell leftMenuCellWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
//    取出模型
    XCSLeftModel *leftModel = self.leftModel[indexPath.row];
    
//    传递模型
    cell.model = leftModel;
    return cell;
}

#pragma mark  UITableViewDelegate方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    新建一个控制器
    XCSTestController *controller = [[XCSTestController alloc] init];
    
//    用当前的控制器作为新创建的导航控制器的根控制器
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];
    
//    XCSLog(@"%f----%f",self.view.frame.size.width,self.view.height);≥nb fdcgb qg  bn
////    [navController pushViewController:controller animated:YES];
////    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
////    window.rootViewController = navController;
//    
}

- (void)dealloc{
    XCSLog(@"dealloc-----self.table");
}
@end
