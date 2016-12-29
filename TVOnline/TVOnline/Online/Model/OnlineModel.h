//
//  OnlineModel.h
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OnlineRecommendModel,OnlineDataModel;
@interface OnlineModel : NSObject
/*
 "total":789,
 "pageCount":7,
 "page":0,
 "size":120,
 "icon":"http://image.quanmin.tv/217cd47dce820d8cdf4be3ce8d48144cpng",
 "data":Array[120],
 "recommend":Object{...}
 */

@property (nonatomic, assign) NSInteger total;
@property (nonatomic, assign) NSInteger pageCount;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger size;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSArray<OnlineDataModel *> *data;
@property (nonatomic, strong) OnlineRecommendModel *recommend;

@end

@interface OnlineDataModel : NSObject
/*
 未解析属性
 "love_cover":"",
 "category_id":"13",
 "video_quality":"234",
 "like":"0",
 "default_image":"",
 "slug":"",
 "weight":"48247120",
 "status":"1",
 "level":"0",
 */

@property (nonatomic, copy) NSString *recommend_image;
@property (nonatomic, copy) NSString *announcement;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *create_at;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *play_at;
@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) NSInteger screen;

@property (nonatomic, copy) NSString *category_slug;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *beauty_cover;
@property (nonatomic, copy) NSString *app_shuffling_image;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, copy) NSString *start_time;
@property (nonatomic, copy) NSString *category_name;


@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *grade;
@property (nonatomic, assign) NSInteger year_type;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, copy) NSString *icontext;

@end


@interface OnlineRecommendModel : NSObject
/*
 "name":"全民新星",
 "icon":"http://image.quanmin.tv/97790bb3db0dd41126199ae2b05371d0png",
 "data":Array[10]
 */

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSArray *data;
@end
