//
//  UNColumnCell.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNColumnCell.h"

@interface UNColumnCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;


@end

@implementation UNColumnCell

- (void)setModel:(ColumnModel *)model{

    _model = model;
    
    [self.imageIV setImageURL:[NSURL URLWithString:model.thumb]];
    self.nameLable.text = model.name;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
