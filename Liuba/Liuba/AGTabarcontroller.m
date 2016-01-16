//
//  AGTabarcontroller.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGTabarcontroller.h"
#import "AGViewController.h"
#import "AGProfitController.h"
#import "AGDisCoveryController.h"

@implementation AGTabarcontroller

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addController];
}

- (void)addController
{
    AGViewController *vc = [[AGViewController alloc] init];
    [self addChildViewController:vc withTitleName:@"首页" imageName:@"tabbar_home"];
    
    AGDisCoveryController *dVc = [[AGDisCoveryController alloc] init];
    [self addChildViewController:dVc withTitleName:@"发现" imageName:@"tabbar_discover"];
    
    AGProfitController *pVc = [[AGProfitController alloc] init];
    [self addChildViewController:pVc withTitleName:@"我" imageName:@"tabbar_profile"];
}

- (void)addChildViewController:(UIViewController *)childController
                 withTitleName:(NSString *)titleName
                     imageName:(NSString *)imageName
{

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
    
    childController.title = titleName;
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSString *selectedImage = [NSString stringWithFormat:@"%@_highlighted",imageName];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
}

@end
