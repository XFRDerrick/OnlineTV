//
//  HomeModel.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    
    return @{@"list":@"HomeListModel",
             @"index":@"HomeBaseModel",
             @"star":@"HomeBaseModel",
             @"recommendation":@"HomeBaseModel",
             @"lol":@"HomeBaseModel",
             @"beauty":@"HomeBaseModel",
             @"tvgame":@"HomeBaseModel",
             @"heartstone":@"HomeBaseModel",
             @"dota2":@"HomeBaseModel",
             @"blizzard":@"HomeBaseModel",
             @"dnf":@"HomeBaseModel",
             @"sport":@"HomeBaseModel",
             @"minecraft":@"HomeBaseModel",
             @"webgame":@"HomeBaseModel"};
}
/*
 "mobile-index":Array[4],
 "mobile-star":Array[5],
 "mobile-recommendation":Array[6],
 "mobile-lol":Array[4],
 "mobile-beauty":Array[2],
 "mobile-tvgame":Array[2],
 "mobile-heartstone":Array[2],
 "mobile-dota2":Array[2],
 "moblie-blizzard":Array[2],
 "moblie-dnf":Array[2],
 "moblie-sport":Array[1],
 "moblie-minecraft":Array[2],
 "moblie-webgame":Array[2],
 "list":Array[13]
 */
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"index":@"mobile-index",
             @"star":@"mobile-star",
             @"recommendation":@"mobile-recommendation",
             @"lol":@"mobile-lol",
             @"beauty":@"mobile-beauty",
             @"tvgame":@"mobile-tvgame",
             @"heartstone":@"mobile-heartstone",
             @"dota2":@"mobile-dota2",
             @"blizzard":@"moblie-blizzard",
             @"dnf":@"moblie-dnf",
             @"sport":@"moblie-sport",
             @"minecraft":@"moblie-minecraft",
             @"webgame":@"moblie-webgame"};
}

@end
@implementation HomeBaseModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"link_object":@"OnlineDataModel"};
}

@end

@implementation HomeListModel


@end
