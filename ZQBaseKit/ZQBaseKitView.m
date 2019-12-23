//
//  ZQBaseKitView.m
//  Client
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitView.h"

@implementation ZQBaseKitView

- (void)setBorderColor:(UIColor *)color borderWidth:(CGFloat)width radius:(CGFloat)radius {
    [self.layer setBorderWidth:(width)];
    [self.layer setBorderColor:[color CGColor]];
    if (radius) {
        [self.layer setCornerRadius:(radius)];
        [self.layer setMasksToBounds:YES];
        
    }
}

@end
