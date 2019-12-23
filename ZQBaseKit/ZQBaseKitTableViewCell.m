//
//  ZQBaseKitTableViewCell.m
//  Client
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitTableViewCell.h"

@implementation ZQBaseKitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
