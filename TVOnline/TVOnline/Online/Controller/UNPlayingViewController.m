//
//  UNPlayingViewController.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNPlayingViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface UNPlayingViewController ()

@property (nonatomic, strong)AVPlayer  *player;

@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation UNPlayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


//    [self setupUI];
}

- (void)setupUI{
//http://hls.quanmin.tv/live/674228/playlist.m3u8
    
    NSString *path = [NSString stringWithFormat:@"http://hls.quanmin.tv/live/%ld/playlist.m3u8",self.model.uid];
    _player = [AVPlayer playerWithURL:[NSURL
                                       URLWithString:path]];
    [_player play];
    
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
//
    [self.view.layer addSublayer:_playerLayer];
    _playerLayer.frame = CGRectMake(0, 64, kScreenSize.width, kScreenSize.height / 3);
//    //视频保持比例充满屏幕
//    _playerLayer.videoGravity = @"AVLayerVideoGravityResizeAspectFill";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
