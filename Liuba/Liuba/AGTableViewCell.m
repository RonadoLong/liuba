//
//  AGTableViewCell.m
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGTableViewCell.h"
#import "Masonry.h"

@interface AGTableViewCell ()
//@property (weak, nonatomic) IBOutlet UIImageView *iconView;
//
//@property (weak, nonatomic) IBOutlet UILabel *schoolName;
//
//@property (weak, nonatomic) IBOutlet UIImageView *primaryView;
//@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
//@property (weak, nonatomic) IBOutlet UILabel *titleName;

@end

@implementation AGTableViewCell

+ (AGTableViewCell *)cellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
   return  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setIconView:(UIImageView *)iconView
{
    _iconView = iconView;
    _iconView.layer.cornerRadius = 20;
    _iconView.clipsToBounds = YES;
}


@end
