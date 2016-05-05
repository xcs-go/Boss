//
//  XCSWorkPlaceTableViewController.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "XCSWorkPlaceTableViewController.h"
#import "XCSIntroduceViewController.h"
#import "XCSQzViewController.h"


@interface XCSWorkPlaceTableViewController ()

@end

@implementation XCSWorkPlaceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"cast" highlightImage:@"collect" target:self action:@selector(leftBarButtonItemDidClick:) title:@"我的简历"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"collect" highlightImage:@"cast" target:self action:@selector(rightBarButtonItemDidClick:) title:nil];
    
}

/**
 *  左边导航按钮的点击事件
 */
- (void)leftBarButtonItemDidClick:(UIButton *)btn{
//    初始化控制器
    XCSIntroduceViewController *introduce = [XCSIntroduceViewController introduceViewControllerWithTitle:btn.currentTitle];
    
//    push出新的控制器
    [self.navigationController pushViewController:introduce animated:YES];
}

/**
 *  右边导航按钮的点击事件
 */
- (void)rightBarButtonItemDidClick:(UIButton *)btn{
    XCSQzViewController *qzViewController = [[XCSQzViewController alloc] init];
    [self.navigationController pushViewController:qzViewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
