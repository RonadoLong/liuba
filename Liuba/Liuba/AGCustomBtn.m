//
//  AGCustomBtn.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGCustomBtn.h"

@implementation AGCustomBtn

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(self.titleLabel.frame.size.width + 5, 0,self.imageView.frame.size.width, self.imageView.frame.size.height);
    
    self.titleLabel.frame = CGRectMake(0, -2, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
}

- (void)setHighlighted:(BOOL)highlighted{}
@end
