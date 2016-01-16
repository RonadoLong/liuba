//
//  AGProfitCell.m
//  Liuba
//
//  Created by JLHong on 16/1/16.
//  Copyright © 2016年 JLHong. All rights reserved.
//

#import "AGProfitCell.h"

@implementation AGProfitCell

+ (instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


@end
