//
//  AGtitleView.h
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^compeleteBlock)(UIButton *btn);

@interface AGtitleView : UIView

@property (copy , nonatomic) compeleteBlock backBlobk; ///<<#name#>

- (void)setBackBlobk:(compeleteBlock)compeleteBlock;

@end
