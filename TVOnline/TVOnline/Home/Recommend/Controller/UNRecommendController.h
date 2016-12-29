//
//  UNRecommendController.h
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//
/*
 cell 复用 ONlineCell
 */

#import <UIKit/UIKit.h>

#import "RecommendModel.h"
@interface UNRecommendController : UICollectionViewController
@property (nonatomic, strong) NSArray<RecommendRoomModel *> *datas;
@end
