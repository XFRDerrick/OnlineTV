//
//  UNLoveViewFlowLayout.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNLoveViewFlowLayout.h"

@implementation UNLoveViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        CGFloat w = (long)((kScreenSize.width - 10 * 3)/ 2);
        CGFloat h = w;
        
        self.itemSize = CGSizeMake(w, h);
        
    }
    return self;
}


@end
