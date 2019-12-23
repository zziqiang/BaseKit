//
//  ZQBaseKitNavigationController.h
//  Client
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZQBaseKitNavigationController : UINavigationController

/// 导航栏的 背景图 或者 背景颜色
@property (nonatomic, strong) id backgroundImageOrColor;

/// 导航栏底部的细线 颜色
@property (copy, nonatomic) UIColor *navBottomLineColor;

- (void)hideNavBottomLine;

- (void)showNavBottomLine;

@end

NS_ASSUME_NONNULL_END
