//
//  AGChildViewController.m
//  YZDisplayViewControllerDemo
//
//  Created by yz on 15/12/5.
//  Copyright © 2015年 yz. All rights reserved.
//

#import "AGChildViewController.h"
#import "AGTableViewCell.h"
#import "AGDisplayViewHeader.h"

#define MSrandomClolor [UIColor colorWithRed:arc4random_uniform(256.0)/255.0 green:arc4random_uniform(256.0)/255.0  blue:arc4random_uniform(256.0)/255.0 alpha:1.000];

@implementation AGChildViewController

#pragma mark - view life circle  viewController生命周期方法
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    self.view.backgroundColor = MSrandomClolor;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    // 设置额外滚动区域,如果当前是全屏
    // 如果有导航控制器，顶部需要添加额外滚动区域
    // 添加额外滚动区域   导航条高度 + 标题高度
    if (self.navigationController) {
        // 导航条上面高度
        CGFloat navBarH = 64;
        
        // 查看自己标题滚动视图设置的高度，我这里设置为44
        CGFloat titleScrollViewH = 44;
        
        self.tableView.contentInset = UIEdgeInsetsMake(navBarH + titleScrollViewH, 0, 0, 0);
    }
    
    // 如果有tabBarController，底部需要添加额外滚动区域
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 44, 0, 49, 0);
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITableViewDelegate UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AGTableViewCell *cell = [AGTableViewCell cellWith:tableView indexPath:indexPath];
    cell.iconView.image = [UIImage imageNamed:@"photo_1"];
    cell.titleName.text = [NSString stringWithFormat:@"%@",self.title];
    cell.primaryView.backgroundColor = MSrandomClolor;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell.layer valueForKey:@"animation"]) {
        return;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(0.5);
    
    animation.duration = 0.5;
    [cell.layer addAnimation:animation forKey:@"animation"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 246;
}



@end
