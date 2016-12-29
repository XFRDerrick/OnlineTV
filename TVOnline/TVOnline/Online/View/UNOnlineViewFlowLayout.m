//
//  UNOnlineViewFlowLayout.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNOnlineViewFlowLayout.h"

@implementation UNOnlineViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        CGFloat w = (long)((kScreenSize.width - 10 * 3)/ 2);
        CGFloat h = w * 3 / 5.0 + 40;
        self.itemSize = CGSizeMake(w, h);
    }
    return self;
}



@end
