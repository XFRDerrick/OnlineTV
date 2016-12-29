//
//  RecommendModel.h
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendRoomModel,RecommendRoomListModel;

@interface RecommendModel : NSObject
/*
 "room":Array[22],
 "ad":Array[0]
 */
@property (nonatomic, strong) NSArray<RecommendRoomModel *> *room;
@property (nonatomic, strong) NSArray *ad;
@end

@interface RecommendRoomModel : NSObject
/*
 "id":0,
 "name":"精彩推荐",
 "is_default":1,
 "icon":"",
 "slug":"",
 "category_more":"",
 "type":1,
 "screen":0,
 "list":Array[6]
 */
@property (nonatomic, assign) NSInteger *roomID;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger is_default;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *category_more;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, strong) NSArray<RecommendRoomListModel *> *list;
@end

@interface RecommendRoomListModel : NSObject
@property (nonatomic, copy) NSString *beauty_cover;
@property (nonatomic, copy) NSString *first_play_at;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *last_play_at;
@property (nonatomic, assign) NSInteger screen;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *recommend_image;
@property (nonatomic, assign) BOOL is_shield;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *view;
@property (nonatomic, copy) NSString *category_slug;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *slug;


@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, assign) NSInteger play_count;
@property (nonatomic, assign) NSInteger play_true;
@property (nonatomic, assign) NSInteger max_view;
@property (nonatomic, assign) NSInteger grade;
@property (nonatomic, copy) NSString *last_end_at;
@property (nonatomic, copy) NSString *create_at;
@property (nonatomic, copy) NSString *last_thumb;
@property (nonatomic, assign) BOOL play_status;

@property (nonatomic, copy) NSString *link;
@property (nonatomic, assign) NSInteger coin;

@end

