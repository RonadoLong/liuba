//
//  AGViewController.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGViewController.h"
#import "AGtitleView.h"
#import "Masonry.h"
#import "SDCycleScrollView.h"
#import "AGCarouselViewLayout.h"
#import "FirstCollectionViewCell.h"
#import "MSCustomBtn.h"

#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width

#define MSrandomClolor [UIColor colorWithRed:arc4random_uniform(256.0)/255.0 green:arc4random_uniform(256.0)/255.0  blue:arc4random_uniform(256.0)/255.0 alpha:1.000];

@interface AGViewController ()
<
SDCycleScrollViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property(strong,nonatomic) UICollectionView *collectionView;///<<#name#>
@property(strong,nonatomic) UIScrollView *demoContainerView;///<<#name#>
@property(strong,nonatomic) UIView *secondView;///<<#name#>
@property(strong,nonatomic) UIView *threeView;///<<#name#>
@property(strong,nonatomic) UIView *snapView;///<<#name#>
@property(strong,nonatomic) NSMutableArray *buttons;///<<#name#>
@property(strong,nonatomic) NSIndexPath *slectedIndexPath;///<<#name#>


@end

@implementation AGViewController
#pragma mark - view life circle  viewController生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    [self setUpTitleView];
    [self setupcricleScrollView];
    [self setupthreeView];
    
    [self.demoContainerView addSubview:self.collectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSIndexPath *indespath = [NSIndexPath indexPathForItem:3 inSection:0];
  
    [self.collectionView scrollToItemAtIndexPath:indespath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    
        for (UIButton *btn  in self.buttons) {
            
            [UIView animateWithDuration:1
                                  delay:0.0
                 usingSpringWithDamping: 0.7
                  initialSpringVelocity:6
                                options:0
                             animations:^{
                                 
                                 btn.transform = CGAffineTransformMakeScale(1, 1);
                             } completion:^(BOOL finished) {
                             }];
            
        }
}

#pragma mark - 设置标题动画
- (void)setUpTitleView
{
    AGtitleView *titleView = [[AGtitleView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    self.navigationItem.titleView = titleView;
    
    __weak typeof(self) weakSelf = self;
    [titleView setBackBlobk:^(UIButton *btn) {
        [weakSelf startAnimtion:btn];
    }];

}

- (void)startAnimtion:(UIButton *)btn
{
    btn.selected = !btn.selected;
        
    if (btn.selected) {
        UIView *snapView = [[UIView alloc] init];
        self.snapView = snapView;
        snapView.backgroundColor = [UIColor grayColor];
        snapView.layer.anchorPoint = CGPointMake(0.5, 0);
        snapView.frame = CGRectMake(0, 64,screenW,screenH - 64);
        snapView.transform = CGAffineTransformMakeScale(1, 0);
        [[UIApplication sharedApplication].keyWindow addSubview:snapView];
    }
    
    [UIView animateWithDuration:0.5 animations:^{
       
        btn.imageView.transform = btn.selected ? CGAffineTransformMakeRotation(M_PI):CGAffineTransformIdentity;
        self.snapView.transform = btn.selected ? CGAffineTransformIdentity : CGAffineTransformMakeScale(1, 0.0001);
        
    } completion:^(BOOL finished) {
    
        if (!btn.selected) {
            
            [self.snapView removeFromSuperview];
        }
    }];
}

#pragma mark - 设置图片轮播

- (void)setupcricleScrollView
{
    UIScrollView *demoContainerView = [[UIScrollView alloc] init];
    self.demoContainerView = demoContainerView;
    
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width,667);
    [self.view addSubview:demoContainerView];
    
    self.demoContainerView.frame = self.view.bounds;
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"
                            ];

    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, screenW, 200) imageNamesGroup:imageNames];
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [demoContainerView addSubview:cycleScrollView];
}

#pragma mark - 设置threeView试图

- (void)setupthreeView
{
    
    self.threeView = [[UIView alloc] initWithFrame:CGRectMake(0, 380, screenW, screenH - 330)];
    self.threeView.backgroundColor = [UIColor whiteColor];
    [self.demoContainerView addSubview:self.threeView];
    
    // 数据
    NSArray *images = @[@"home_item_1",@"home_item_2", @"home_item_3", @"home_item_4", @"home_item_5", @"home_item_6"];
    NSArray *titles = @[@"校拍照", @"婚纱照", @"艺术照", @"淘宝照", @"头像照", @"摄影"];
    
    // 一些参数
    NSUInteger count = images.count;
    int maxColsCount = 3;
    NSUInteger rowsCount = (count + maxColsCount - 1) / maxColsCount;
    
    // 按钮尺寸
    CGFloat buttonW = (self.threeView.frame.size.width ) / maxColsCount;
    CGFloat buttonH = buttonW;
    CGFloat buttonStartY = (self.threeView.frame.size.height - rowsCount * buttonH) * 0.1;
    
    for (int i = 0 ; i < count ; i ++) {
        
        MSCustomBtn *btn = [MSCustomBtn buttonWithType:UIButtonTypeCustom];
        [self.buttons addObject:btn];
        [self.threeView addSubview:btn];
        
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
         btn.titleLabel.textColor = [UIColor blackColor];
        
        CGFloat buttonX = (i % maxColsCount) * buttonW;
        CGFloat buttonY = buttonStartY + (i / maxColsCount) * buttonH + 20;
        btn.frame = CGRectMake(buttonX , buttonY , buttonW, buttonH);
        btn.transform = CGAffineTransformMakeScale(0, 0);
    }
}

//** 监听轮播图片事件 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
//    NSLog(@"%zd",index);
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell setImageForCellWithIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"%@",indexPath);
}

#pragma mark - getters and setters
- (UICollectionView*)collectionView{
    
    if (!_collectionView) {
        HJCarouselViewLayout *layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimLinear];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(120, 82);
        layout.visibleCount = 4;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,280, screenW, 82) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"FirstCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

//** 保存按钮 */
- (NSMutableArray *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}


@end
