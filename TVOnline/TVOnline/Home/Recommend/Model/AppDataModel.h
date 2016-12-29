//
//  AppDataModel.h
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeModel.h"

@interface AppDataModel : NSObject
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
@property (nonatomic, strong) NSArray<HomeBaseModel *> *androidstart;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *ios_start;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *app_focus;

@property (nonatomic, strong) NSArray<HomeBaseModel *> *appFocusCheck;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *ios_focus;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *pad_start;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *ios_start_test;
@property (nonatomic, strong) NSArray<HomeBaseModel *> *ios_focus_test;
@end
