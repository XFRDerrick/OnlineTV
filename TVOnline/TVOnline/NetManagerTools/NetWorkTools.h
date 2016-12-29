//
//  NetWorkTools.h
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "BaseNetManager.h"

#import "ColumnModel.h"
#import "OnlineModel.h"
#import "RecommendModel.h"
#import "AppDataModel.h"
@interface NetWorkTools : BaseNetManager

+ (id)getColoumnModelWithPath:(NSString *)path completionHandler:(void(^)(NSArray<ColumnModel *> *models,NSError *error))completionHandler;

+ (id)getOnlineModelWithPath:(NSString *)path completionHandler:(void(^)(OnlineModel *model,NSError *error))completionHandler;

+ (id)getRecommendModelWithPath:(NSString *)path completionHandler:(void(^)(RecommendModel *model,NSError *error))completionHandler;
+ (id)getAppDataModelWithPath:(NSString *)path completionHandler:(void(^)(AppDataModel *model,NSError *error))completionHandler;


@end
