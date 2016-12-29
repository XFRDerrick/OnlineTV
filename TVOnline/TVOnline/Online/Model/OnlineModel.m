//
//  OnlineModel.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "OnlineModel.h"

@implementation OnlineModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"data":@"OnlineDataModel",@"recommend":@"OnlineRecommendModel"};
}

@end

@implementation OnlineDataModel


@end


@implementation OnlineRecommendModel

@end

