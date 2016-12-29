//
//  UNOnlineCell.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNOnlineCell.h"

@interface UNOnlineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *gameImageIV;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageIV;
@property (weak, nonatomic) IBOutlet UILabel *playerName;
@property (weak, nonatomic) IBOutlet UILabel *showDetail;
@property (weak, nonatomic) IBOutlet UIButton *viewCountLable;


@end

@implementation UNOnlineCell

- (void)setListModel:(RecommendRoomListModel *)listModel{

    _listModel = listModel;
    
    [self.gameImageIV setImageWithURL:[NSURL URLWithString:listModel.thumb] placeholder:[UIImage imageNamed:@"scream0"]];
    //    [self.gameImageIV setImageURL:[NSURL URLWithString:model.thumb]];
    [self.headerImageIV setImageURL:[NSURL URLWithString:listModel.avatar]];
    self.playerName.text = listModel.nick;
    self.showDetail.text = listModel.title;
    
    NSString *countStr = [NSString stringWithFormat:@"%.1lf万",listModel.view.floatValue / 10000.0];
    [self.viewCountLable setTitle:countStr forState:UIControlStateNormal];
    
}

- (void)setModel:(OnlineDataModel *)model{

    _model = model;
    [self.gameImageIV setImageWithURL:[NSURL URLWithString:model.thumb] placeholder:[UIImage imageNamed:@"scream0"]];
//    [self.gameImageIV setImageURL:[NSURL URLWithString:model.thumb]];
    [self.headerImageIV setImageURL:[NSURL URLWithString:model.avatar]];
    self.playerName.text = model.nick;
    self.showDetail.text = model.title;
    
    NSString *countStr = [NSString stringWithFormat:@"%.1lf万",model.view.floatValue / 10000.0];
    [self.viewCountLable setTitle:countStr forState:UIControlStateNormal];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.gameImageIV.layer.cornerRadius = 3;
    self.gameImageIV.layer.masksToBounds = YES;
    
    self.headerImageIV.layer.cornerRadius = 15;
    self.headerImageIV.layer.masksToBounds = YES;
    self.viewCountLable.userInteractionEnabled = NO;
    
}

@end
