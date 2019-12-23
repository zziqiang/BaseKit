//
//  ZQBaseKitModel.m
//  Client
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ZQBaseKitModel.h"

@implementation ZQBaseKitModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
        @"description_field":@"description",
        @"model_id":@"id"
    };
}


@end
