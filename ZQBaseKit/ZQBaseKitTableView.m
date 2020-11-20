//
//  ZQBaseKitTableView.m
//  Client
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitTableView.h"

@implementation ZQBaseKitTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.backgroundColor = UIColor.whiteColor;
        self.separatorColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1];
    }
    return self;
}

@end
