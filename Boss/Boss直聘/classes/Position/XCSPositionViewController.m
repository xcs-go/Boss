//
//  XCSPositionViewController.m
//  Boss直聘
//
//  Created by 谢朝森 on 16/4/1.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSPositionViewController.h"
#import "XCSNavView.h"
#import "XCSRecommandTableViewHeadView.h"
#import "XCSBossModel.h"
#import "MJExtension.h"
#import "XCSPositionCell.h"



@interface XCSPositionViewController ()<UIScrollViewDelegate,XCSNavViewDelegate,UITableViewDataSource,UITableViewDelegate>

/**
 *  导航栏下的view
 */
@property(nonatomic, weak)UIView * navView;


/**
 *  纪录当前被选中的按钮
 */
@property(nonatomic, weak)UIButton * selectedButton;

/**
 *  包装的UISCrollView
 */
@property(nonatomic, weak)UIScrollView* backScrollView;

/**
 *  推荐tableview
 */
@property(nonatomic, weak)UITableView* recommandTableView;

/**
 *  最新的tableView
 */
@property(nonatomic, weak)UITableView * moreNewTableView;

/**
 *  最热tableView
 */
@property(nonatomic, weak)UITableView * hotTableView;


/**
 *  招聘信息模型
 */
@property(nonatomic, strong)NSMutableArray* bossArray;



@end

@implementation XCSPositionViewController

/**
 *  懒加载
 */
- (NSMutableArray *)bossArray{
    if (!_bossArray) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"bossList.plist" ofType:nil];
//        通过plist的文件路径转换为模型数组
        _bossArray = [XCSBossModel mj_objectArrayWithFile:filePath];
    }
    return _bossArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XCSColor(200, 200, 200);
    
//    设置导航栏下的view
    [self setNavView];
    
//    接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationMessage:) name:@"RecommandDidClick" object:nil];
//    设置内容视图
    [self setTableView];
    
}

/**
 *  设置内容视图
 */
- (void)setTableView{
//    背景的内容scrollview
    UIScrollView *backScrollView = [[UIScrollView alloc] init];
    CGFloat backScrollViewY = CGRectGetMaxY(self.navView.frame) + 10;
    backScrollView.frame = CGRectMake(0, backScrollViewY, self.view.width, self.view.height - backScrollViewY);
    backScrollView.backgroundColor = [UIColor clearColor];
//    设置相关的属性
    backScrollView.contentSize = CGSizeMake(self.view.width * 3, self.view.height);
    backScrollView.delegate = self;
    backScrollView.pagingEnabled = YES;
    backScrollView.bounces = NO;
    
    self.backScrollView = backScrollView;
    [self.view addSubview:backScrollView];
    
//    推荐tableView
    UITableView *recommandTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, backScrollView.width - 20, backScrollView.height) style:UITableViewStylePlain];
//    设置相关的属性
    recommandTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//    设置tableHeadView
    recommandTable.tableHeaderView = [XCSRecommandTableViewHeadView recommandTableViewHeadView];
//    清除背景颜色
    recommandTable.backgroundColor = [UIColor clearColor];
    
//    设置代理和数据源
    recommandTable.delegate = self;
    recommandTable.dataSource = self;
    
    [backScrollView addSubview:recommandTable];
    self.recommandTableView = recommandTable;
    
    //    最新tableView
    CGFloat moreNewTableX = CGRectGetMaxX(recommandTable.frame);
    UITableView *moreNewTable = [[UITableView alloc] initWithFrame:CGRectMake(moreNewTableX, 0, backScrollView.width, backScrollView.height) style:UITableViewStylePlain];
    [backScrollView addSubview:moreNewTable];
    self.moreNewTableView = moreNewTable;
    
    //    最热tableView
    CGFloat hotTableX = CGRectGetMaxX(moreNewTable.frame);
    UITableView *hotTable = [[UITableView alloc] initWithFrame:CGRectMake(hotTableX, 0, backScrollView.width, backScrollView.height) style:UITableViewStylePlain];
    [backScrollView addSubview:hotTable];
    self.hotTableView = hotTable;
}




/**
 *  设置导航栏下的view
 */
- (void)setNavView{
//    获取到窗口视图
    XCSNavView *navView = [[XCSNavView alloc] init];
    navView.frame = CGRectMake(0, 64, windowWidth, 30);
    navView.delegate = self;
    self.navView = navView;
    [self.view addSubview:navView];
}


#pragma mark  XCSNavViewDelegate代理方法
- (void)navViewDidClickWithView:(XCSNavView *)view withButton:(UIButton *)button lineView:(UIView *)lineView{
    
//    显示lineView
    lineView.hidden = NO;
//    切换选中按钮
// 判断传入进来的按钮和上一次被选中的按钮是否相等
    if (button != self.selectedButton) {  // 不相等
        button.selected = YES;
        self.selectedButton.selected = NO;
        self.selectedButton = button;
    }else { // 相等
        button.selected = YES;
    }

    switch (button.tag) {
        case 0:
            lineView.x = 0;
            
            break;
        case 1:
            lineView.x = 1 * button.width;
            
            break;
        case 2:
            lineView.x = 2 * button.width;
            
            break;
        default:
            break;
    }
    
}


/**
 *  接收通知  notificationMessage
 */
- (void)notificationMessage:(NSNotification *)NSNotification {
    XCSLog(@"notificationMessage ---%@",NSNotification.name);
}


#pragma mark  UITableViewDataSource 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bossArray.count;
}

#pragma mark   UITableViewDelegate  代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    XCSPositionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[XCSPositionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

//    取出模型
    XCSBossModel *bossModel = self.bossArray[indexPath.row];
    cell.model = bossModel;
    
    return cell;
}

@end
