//
//  HomeModel.h
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnlineModel.h"

@class HomeListModel,HomeBaseModel;

@interface HomeModel : NSObject

@property (nonatomic, strong) NSArray<HomeBaseModel *> *index;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *star;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *recommendation;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *lol;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *beauty;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *tvgame;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *heartstone;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *dota2;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *blizzard;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *dnf;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *sport;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *minecraft;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *webgame;
@property (nonatomic, strong) NSArray<HomeListModel *> *list;


@end

@interface HomeBaseModel : NSObject

@property (nonatomic, assign) NSInteger mobileID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *create_at;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *fk;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *ext;
@property (nonatomic, assign) NSInteger slot_id;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, strong) OnlineDataModel *link_object;
/*
 "id":320,
 "title":"艾欧尼亚杰斯上分，有没有上车的",
 "thumb":"",
 "link":"",
 "create_at":"2016-02-04 22:21:21",
 "status":1,
 "fk":"844507",
 "subtitle":"",
 "content":"",
 "ext":"",
 "slot_id":20,
 "priority":4,
 "link_object":Object{...}
 */
@end

@interface HomeListModel : NSObject
/*
 "slug":"mobile-index",
 "name":"APP-首页轮播",
 "category_slug":""
 */
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *category_slug;
@end



