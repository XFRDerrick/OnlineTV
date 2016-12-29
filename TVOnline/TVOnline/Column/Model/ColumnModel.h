//
//  ColumnModel.h
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColumnModel : NSObject

/*
 "id":1,
 "name":"英雄联盟",
 "slug":"lol",
 "first_letter":"L",
 "status":0,
 "prompt":1,
 "image":"http://image.quanmin.tv/4518e1f7c347c3e78fc5fd9bba6cb6b2png",
 "thumb":"http://image.quanmin.tv/ca3d8b85f3b19ef7171f4435ce03ebcapng",
 "priority":1,
 "screen":0
 */

@property (nonatomic, assign) NSInteger columnID;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *first_letter;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger prompt;

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) NSInteger screen;

@end
