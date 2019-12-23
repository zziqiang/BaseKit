//
//  ZQBaseKitViewController.m
//  Client
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitViewController.h"

#define kIsiPhone_6_7_8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

@interface ZQBaseKitViewController ()
@property (nonatomic, copy) BtnActionBlock btnActionBlock;
@end

@implementation ZQBaseKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageNo = 1;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

-(UIButton *)addNavigateItemWithTarget:(UIViewController *)targetViewController andPosition:(NavigateItemPosition)position andType:(NavigateItemType)type andTypeStr:(NSString *)typeStr andItemColor:(UIColor *)titleColor btnHandler:(BtnActionBlock)btnActionBlock{
    self.btnActionBlock = btnActionBlock;
    UIButton *button = [[UIButton alloc] init];
    CGFloat imaW = 0;
    switch (type) {
        case NavigateItemTypeTitle:
        {
            [button setTitle:typeStr forState:UIControlStateNormal];
            NSInteger index = typeStr.length;
            CGFloat w = 20 + 18*(index - 1);
            button.frame = CGRectMake(0, 0, w + imaW, 44);
            
            if (kIsiPhone_6_7_8) {
                [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
            }else{
                [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
            }
            
            if (titleColor) {
                [button setTitleColor:titleColor forState:UIControlStateNormal];
            }else{
                [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
            }
        }
            break;
        case NavigateItemTypeImage:
        {
            imaW = 44;
            [button setImage:[UIImage imageNamed:typeStr] forState:UIControlStateNormal];
            [button setFrame:CGRectMake(0, 0, imaW, imaW)];
        }
            break;
    }
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:button];
    switch (position) {
        case NavigateItemPositionLeft:
            targetViewController.navigationItem.leftBarButtonItem = barBtn;
            break;
        case NavigateItemPositionRight:
            targetViewController.navigationItem.rightBarButtonItem = barBtn;
        break;
        default:
            break;
    }
    
    [button addTarget:self action:@selector(fm_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)fm_btnAction:(UIButton *)sender {
    if (self.btnActionBlock) {
        self.btnActionBlock(sender);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
