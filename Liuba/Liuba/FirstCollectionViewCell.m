//
//  FirstCollectionViewCell.m
//  LXZEALER
//
//  Created by Lonely Stone on 15/11/2.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import "FirstCollectionViewCell.h"

@implementation FirstCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setImageForCellWithIndexPath:(NSIndexPath*)indexpath{
        NSMutableArray *imageNameArray = [NSMutableArray arrayWithObjects:
                                          @"img_more_topic",
                                          @"img_more_topic",
                                          @"img_more_topic",
                                          @"img_more_topic",
                                          @"img_more_topic",
                                          @"img_more_topic",nil];
    self.imageView.image = [UIImage imageNamed:imageNameArray[indexpath.row]];
}

@end
