//
//  AGTableViewCell.h
//  Liuba
//
//  Created by JLHong on 16/1/15.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *schoolName;

@property (weak, nonatomic) IBOutlet UIImageView *primaryView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleName;

+ (AGTableViewCell *) cellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
