//
//  UNColumnController.h
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{

    CollectionCellTypeColumn,
    CollectionCellTypeOnline,
    CollectionCellTypeLove,
    
}UNCellType;

typedef enum{
    UNCollectionFlowLayoutTypeColumn,
    UNCollectionFlowLayoutTypeOnline,
    UNCollectionFlowLayoutTypeLove,
    
}UNFlowLayoutType;

@interface UNColumnController : UIViewController


- (instancetype)initWithCellType:(UNCellType)cellType flowLayoutType:(UNFlowLayoutType)flowLayoutType requestPath:(NSString *)path;

@end
