//
//  NetWorkTools.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools

+ (id)getColoumnModelWithPath:(NSString *)path completionHandler:(void (^)(NSArray<ColumnModel *> *, NSError *))completionHandler{
    return [self GET:path paramaters:nil completionHandler:^(id respondObj, NSError *error) {
        
        !completionHandler ?: completionHandler([ColumnModel parse:respondObj],error);
    }];

    
}

+ (id)getOnlineModelWithPath:(NSString *)path completionHandler:(void (^)(OnlineModel *, NSError *))completionHandler{

    return [self GET:path paramaters:nil completionHandler:^(id respondObj, NSError *error) {
        !completionHandler ?: completionHandler([OnlineModel parse:respondObj],error);
    }];
}


+ (id)getRecommendModelWithPath:(NSString *)path completionHandler:(void (^)(RecommendModel *, NSError *))completionHandler{
    
    return [self GET:path paramaters:nil completionHandler:^(id respondObj, NSError *error) {
        !completionHandler ?: completionHandler([RecommendModel parse:respondObj],error);
    }];
}

+ (id)getAppDataModelWithPath:(NSString *)path completionHandler:(void (^)(AppDataModel *, NSError *))completionHandler{
    return [self GET:path paramaters:nil completionHandler:^(id respondObj, NSError *error) {
        !completionHandler ?: completionHandler([AppDataModel parse:respondObj],error);
    }];
    
}


@end
