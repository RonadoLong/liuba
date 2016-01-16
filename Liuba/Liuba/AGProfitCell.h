//
//  AGProfitCell.h
//  Liuba
//
//  Created by JLHong on 16/1/16.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGProfitCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@property (weak, nonatomic) IBOutlet UIImageView *iconview;

@property (weak, nonatomic) IBOutlet UILabel *titleName;

@end
