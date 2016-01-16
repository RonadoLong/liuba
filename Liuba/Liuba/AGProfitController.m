//
//  AGProfitController.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGProfitController.h"
#import "AGHeaderView.h"
#import "AGProfitCell.h"
@interface AGProfitController ()

@end

@implementation AGProfitController

#pragma mark - view life circle  viewController生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AGHeaderView *headerView = [[AGHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 130)];
    
     self.tableView.tableHeaderView = headerView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.94 alpha:1];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1)
    {
        return 2;
    }else
    {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AGProfitCell *cell = [AGProfitCell cellWithTableView:tableView indexPath:indexPath];
        if (indexPath.row == 0) {
            cell.iconview.image = [UIImage imageNamed:@"android_personel_quickly_order"];
            cell.titleName.text = @"我的预约";
            return cell;
        }
        
        if (indexPath.row == 1) {
            cell.iconview.image = [UIImage imageNamed:@"android_my_jd_wallet"];
            cell.titleName.text = @"单单进度";
            return cell;
        }
    }
    
    if (indexPath.section == 1) {
        AGProfitCell *cell = [AGProfitCell cellWithTableView:tableView indexPath:indexPath];
        
        if (indexPath.row == 0) {
            cell.iconview.image = [UIImage imageNamed:@"android_my_jd_collects"];
            cell.titleName.text = @"地址管理";
            return cell;
        }
        
        if (indexPath.row == 1) {
            cell.iconview.image = [UIImage imageNamed:@"android_my_jd_messages"];
            cell.titleName.text = @"我的消息";
            return cell;
        }

    }
    
    if (indexPath.section == 2) {
        AGProfitCell *cell = [AGProfitCell cellWithTableView:tableView indexPath:indexPath];
        
        if (indexPath.row == 0) {
            cell.iconview.image = [UIImage imageNamed:@"more_feedback_icon"];
            cell.titleName.text = @"意见反馈";
            return cell;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

@end
