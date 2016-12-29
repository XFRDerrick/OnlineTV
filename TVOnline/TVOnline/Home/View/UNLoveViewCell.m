//
//  UNLoveViewCell.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNLoveViewCell.h"

@interface UNLoveViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *screenImageIV;
@property (weak, nonatomic) IBOutlet UIButton *viewCount;
@property (weak, nonatomic) IBOutlet UILabel *nickLable;



@end

@implementation UNLoveViewCell

- (void)setListModel:(RecommendRoomListModel *)listModel{
    
    _listModel = listModel;
    [self.screenImageIV setImageWithURL:[NSURL URLWithString:listModel.thumb] placeholder:[UIImage imageNamed:@"scream0"]];
    [self.viewCount setTitle:listModel.view forState:UIControlStateNormal];
    self.nickLable.text = listModel.nick;
    
}

- (void)setModel:(OnlineDataModel *)model{

    _model = model;
    [self.screenImageIV setImageWithURL:[NSURL URLWithString:model.thumb] placeholder:[UIImage imageNamed:@"scream0"]];
    [self.viewCount setTitle:model.view forState:UIControlStateNormal];
    
    self.nickLable.text = model.nick;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
