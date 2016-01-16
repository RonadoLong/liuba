//
//  AGDisCoveryController.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGDisCoveryController.h"
#import "AGChildViewController.h"
@interface AGDisCoveryController ()

@end

@implementation AGDisCoveryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.168 green:0.782 blue:0.900 alpha:1.000];
    // 添加所有子控制器
    [self setUpAllViewController];
    
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
    
        *titleFont = [UIFont systemFontOfSize:16];
        
    }];
    
    // 推荐方式（设置下标）
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        // 是否显示标签
        *isShowUnderLine = YES;
        
        // 标题填充模式
        *underLineColor = [UIColor redColor];
        
    }];
    
    // 设置全屏显示
    // 如果有导航控制器或者tabBarController,需要设置tableView额外滚动区域,详情请看AGChildViewController
    self.isAGScreen = YES;
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    
    AGChildViewController *wordVc1 = [[AGChildViewController alloc] init];
    wordVc1.title = @"校拍照";
    [self addChildViewController:wordVc1];
    
    AGChildViewController *wordVc2 = [[AGChildViewController alloc] init];
    wordVc2.title = @"婚纱照";
    [self addChildViewController:wordVc2];
    
    AGChildViewController *wordVc3 = [[AGChildViewController alloc] init];
    wordVc3.title = @"艺术照";
    [self addChildViewController:wordVc3];
    
    AGChildViewController *wordVc4 = [[AGChildViewController alloc] init];
    wordVc4.title = @"淘宝照";
    [self addChildViewController:wordVc4];
    
    AGChildViewController *allVc = [[AGChildViewController alloc] init];
    allVc.title = @"头像照";
    [self addChildViewController:allVc];
    
    AGChildViewController *videoVc = [[AGChildViewController alloc] init];
    videoVc.title = @"摄影";
    [self addChildViewController:videoVc];
}

@end
