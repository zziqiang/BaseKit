//
//  ZQBaseKitCollectionView.m
//  Client
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitCollectionView.h"

@implementation ZQBaseKitCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

@end
