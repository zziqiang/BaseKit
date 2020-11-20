//
//  ZQBaseKitNavigationController.m
//  Client
//
//  Created by apple on 2019/12/6.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitNavigationController.h"

#define kColorCCC [UIColor colorWithRed:245 green:245 blue:245 alpha:1]
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ZQBaseKitNavigationController ()<UIGestureRecognizerDelegate>
@property (strong, nonatomic) UIView *navLineV;

@end

@implementation ZQBaseKitNavigationController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fm_exchangeNavBottomLine];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

#pragma mark -  通过拦截push方法来设置每个push进来的控制器的返回按钮
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:YES];
}

#pragma mark - 导航栏的 背景图（指定图片或指定颜色）
-(void)setBackgroundImageOrColor:(id)backgroundImageOrColor {
    if (backgroundImageOrColor == nil) {
        backgroundImageOrColor = [self imageWithColor:UIColor.clearColor];
    }else if ([backgroundImageOrColor isKindOfClass:[UIColor class]]) {
        backgroundImageOrColor = [self imageWithColor:backgroundImageOrColor];
    }
    
    if ([backgroundImageOrColor isKindOfClass:[UIImage class]]) {
        backgroundImageOrColor = [backgroundImageOrColor resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
        [self.navigationBar setBackgroundImage:backgroundImageOrColor forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark - 导航栏底部的细线
- (void)fm_exchangeNavBottomLine {
    //藏旧
    [self hideBorderInView:self.navigationBar];
    
    //添新
    _navLineV = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, kScreenWidth, 0.5)];
    UIColor *color = kColorCCC;
    if (self.navBottomLineColor) {
        color = self.navBottomLineColor;
    }
    _navLineV.backgroundColor = color;
    [self.navigationBar addSubview:_navLineV];
}

/*
* 隐藏导航栏底部细线
*/
- (void)hideNavBottomLine{
    [self hideBorderInView:self.navigationBar];
    _navLineV.hidden = YES;
}

/*
* 显示导航栏底部细线
*/
- (void)showNavBottomLine{
    _navLineV.hidden = NO;
}

/*
 * 设置导航栏底部细线颜色
 */
-(void)setNavBottomLineColor:(UIColor *)navBottomLineColor {
    [self hideBorderInView:self.navigationBar];
    
    _navBottomLineColor = navBottomLineColor;
    
    _navLineV.hidden = NO;
    _navLineV.backgroundColor = _navBottomLineColor;
}

/*
* 隐藏系统导航栏底部细线
*/
- (void)hideBorderInView:(UIView *)view{
    if ([view isKindOfClass:[UIImageView class]]
        && view.frame.size.height <= 1) {
        view.backgroundColor = [UIColor clearColor];
        view.hidden = YES;
    }
    for (UIView *subView in view.subviews) {
        [self hideBorderInView:subView];
    }
}

#pragma mark - 横竖屏
- (BOOL)shouldAutorotate{
    return [self.visibleViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (![self.visibleViewController isKindOfClass:[UIAlertController class]]) {//iOS9 UIWebRotatingAlertController
        return [self.visibleViewController supportedInterfaceOrientations];
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark - Private Method
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
