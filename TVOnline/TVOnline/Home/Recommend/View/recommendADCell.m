//
//  recommendADCell.m
//  MusicAPP
//
//  Created by universe on 2016/11/24.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "recommendADCell.h"

@implementation recommendADCell

- (iCarousel *)ic{

    if (!_ic) {
        
        _ic = [[iCarousel alloc] init];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        //设置滚动样式
        _ic.type = iCarouselTypeLinear;
        //设置滚动速度
        _ic.scrollSpeed = 0;
        
    }
    
    return _ic;
}

- (UIPageControl *)pageControl{

    if (!_pageControl) {
        
        _pageControl = [[UIPageControl alloc] init];
        [self.ic addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.equalTo(self.ic);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(kScreenSize.width * 0.3);
        }];
        _pageControl.pageIndicatorTintColor = KRGB_Color(190, 190, 190, 1);
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];//KRGB_Color(24, 190, 254, 1);
        
    }
    return _pageControl;
}

- (UILabel *)titleLable{

    if (!_titleLable) {
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = [UIFont systemFontOfSize:12];
        _titleLable.textColor = [UIColor lightGrayColor];
        _titleLable.textAlignment = NSTextAlignmentLeft;
        [self.ic addSubview:_titleLable];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ic).offset(20);
            make.bottom.equalTo(self.ic.mas_bottom);//.offset(-15);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(kScreenSize.width * 0.6);
        }];
        
    }
    return _titleLable;
}

@end
