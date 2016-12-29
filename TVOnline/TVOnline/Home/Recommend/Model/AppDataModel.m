//
//  AppDataModel.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "AppDataModel.h"

@implementation AppDataModel
/*

 "androidstart":Array[1],
 "ios-start":Array[1],
 "app-focus":Array[4],
 "appFocusCheck":Array[3],
 "ios-focus":Array[4],
 "ipad-start":Array[1],
 "ios-start-test":Array[1],
 "ios-focus-test":Array[4]
 */
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    
    return @{@"androidstart":@"HomeBaseModel",
             @"ios_start":@"HomeBaseModel",
             @"app_focus":@"HomeBaseModel",
             @"appFocusCheck":@"HomeBaseModel",
             @"ios_focus":@"HomeBaseModel",
             @"pad_start":@"HomeBaseModel",
             @"ios_start_test":@"HomeBaseModel",
             @"ios_focus_test":@"HomeBaseModel",
             };

    
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"ios_start":@"ios-start",
             @"app_focus":@"app-focus",
             @"ios_focus":@"ios-focus",
             @"pad_start":@"ipad-start",
             @"ios_start_test":@"ios-start-test",
             @"ios_focus_test":@"ios-focus-test",
           };
}

@end
