//
//  ZQBaseKitViewController.h
//  Client
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^BtnActionBlock)(id objc);

typedef NS_ENUM(NSInteger, NavigateItemPosition) {
    NavigateItemPositionLeft = 1,
    NavigateItemPositionRight,
};

typedef NS_ENUM(NSInteger, NavigateItemType) {
    NavigateItemTypeImage = 1,
    NavigateItemTypeTitle,
};


@interface ZQBaseKitViewController : UIViewController

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;


/// 添加导航栏图片
/// @param targetViewController 控制器
/// @param position 导航栏按钮位置
/// @param type 导航栏按钮：文字 / 图片
/// @param typeStr 文字或者图片名字
/// @param buttonTextColor 按钮文字颜色
/// @param btnActionBlock 按钮响应事件
-(UIButton *)addNavigateItemWithTarget:(UIViewController *)targetViewController andPosition:(NavigateItemPosition)position andType:(NavigateItemType)type andTypeStr:(NSString *)typeStr andItemColor:(UIColor *)buttonTextColor btnHandler:(BtnActionBlock)btnActionBlock;

@end

NS_ASSUME_NONNULL_END
