//
//  AGtitleView.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGtitleView.h"
#import "Masonry.h"
#import "AGCustomBtn.h"

@interface AGtitleView ()

@property(strong,nonatomic) AGCustomBtn *titleBtn;///<<#name#>

@property(strong,nonatomic) UIImageView *titleIconView;///<<#name#>
@end

@implementation AGtitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self prepareViews];
    }
    return self;
}


- (void)prepareViews
{
    [self addSubview:self.titleIconView];
    [self addSubview:self.titleBtn];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
   
    [self.titleIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.equalTo(self).offset(2);
    }];
    
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.titleIconView.mas_trailing).offset(8);
        make.top.equalTo(self).offset(5);
    }];
    
}

- (void)didclickTitleBtn:(UIButton *)btn
{
    NSLog(@"%s",__func__);
    if (self.backBlobk) {
        self.backBlobk(btn);
    }
}

- (void)setCompeleteBlock:(compeleteBlock)compeleteBlock
{
    self.backBlobk = compeleteBlock;
}

#pragma mark - getters and setters
- (UIImageView *)titleIconView
{
    if (!_titleIconView) {
        _titleIconView = [[UIImageView alloc] init];
        _titleIconView.image = [UIImage imageNamed:@"pos_icon"];
        [_titleIconView sizeToFit];
    }
    return _titleIconView;
}

- (AGCustomBtn *)titleBtn
{
    if (!_titleBtn) {
        _titleBtn = [AGCustomBtn buttonWithType:UIButtonTypeCustom];
        [_titleBtn setImage:[UIImage imageNamed:@"travel__ic_triangle_down"] forState:UIControlStateNormal];
        [_titleBtn setTitle:@"东莞理工学院" forState:UIControlStateNormal];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleBtn setTitleColor:[UIColor colorWithRed:0.335 green:0.780 blue:0.680 alpha:1.000] forState:UIControlStateNormal];
        [_titleBtn addTarget:self action:@selector(didclickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_titleBtn sizeToFit];
    }
    return _titleBtn;
}
@end
