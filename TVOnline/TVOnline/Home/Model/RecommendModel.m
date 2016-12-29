//
//  RecommendModel.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"room":@"RecommendRoomModel"};
}

@end
@implementation RecommendRoomModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"roomID":@"id"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":@"RecommendRoomListModel"};
}

@end


@implementation RecommendRoomListModel


@end
