//
//  UNColumnViewFlowLayout.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNColumnViewFlowLayout.h"

@implementation UNColumnViewFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
        CGFloat w = (long)((kScreenSize.width - 10 * 2 - 5 * 2)/ 3);
        CGFloat h = w * 1.3;
        
        self.itemSize = CGSizeMake(w, h);
        
    }
    return self;
}

@end
