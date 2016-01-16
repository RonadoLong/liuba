//
//  AGHeaderView.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGHeaderView.h"
#import "Masonry.h"

@interface AGHeaderView()

@property(strong,nonatomic) UIImageView *bkgView;///<<#name#>

@property(strong,nonatomic) UILabel *welcomeLabel;///<<#name#>

@property(strong,nonatomic) UIButton *loginBtn;///<<#name#>

@end

@implementation AGHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    [self addSubview:self.bkgView];
    [self addSubview:self.welcomeLabel];
    [self addSubview:self.loginBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bkgView.frame = self.bounds;
    
    [self.welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(20);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.welcomeLabel.mas_bottom).offset(10);
        make.width.equalTo(self.welcomeLabel.mas_width);
    }];
    
}

- (void)didClickLoginBtn
{
    NSLog(@"%s",__func__);
}

#pragma mark - getters and setters
- (UIImageView *)bkgView
{
    if (!_bkgView) {
        _bkgView = [[UIImageView alloc] init];
        _bkgView.image = [UIImage imageNamed:@"login_top_bg-1"];
    }
    return _bkgView;
}

- (UILabel *)welcomeLabel
{
    if (!_welcomeLabel) {
        _welcomeLabel = [[UILabel alloc] init];
        _welcomeLabel.text = @"欢迎来打溜吧";
        _welcomeLabel.font = [UIFont systemFontOfSize:15];
        [_welcomeLabel setTextColor:[UIColor whiteColor]];
        [_welcomeLabel sizeToFit];
    }
    return _welcomeLabel;
}

- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录、注册" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_loginBtn setTitleColor:[UIColor colorWithRed:1.000 green:0.639 blue:0.139 alpha:1.000] forState:UIControlStateNormal];
          [_loginBtn setTitleColor:[UIColor colorWithRed:1.000 green:0.479 blue:0.097 alpha:1.000] forState:UIControlStateHighlighted];
        _loginBtn.backgroundColor = [UIColor whiteColor];
        _loginBtn.alpha = 0.8;
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.clipsToBounds = YES;
        [_loginBtn addTarget:self action:@selector(didClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}


@end
