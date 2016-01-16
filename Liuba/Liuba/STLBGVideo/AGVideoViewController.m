//
//  STLVideoViewController.m
//  STLBGVideo
//
//  Created by StoneLeon on 16/1/13.
//  Copyright © 2016年 StoneLeon. All rights reserved.
//

#import "AGVideoViewController.h"
#import "AGVideoFunctions.h"

@interface AGVideoViewController ()
@property (nonatomic,strong) MPMoviePlayerController *player;
@property (nonatomic,assign) BOOL isLoop;

@end

@implementation AGVideoViewController

#pragma mark - Player

- (void)getPlayerNotifications {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerStateChangeNotification:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
    
}

- (void)preparePlayback {
    if (self.player == nil) {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[AGVideoFunctions getVideoUrl] ofType:[AGVideoFunctions getVideoType]]];
        self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
        [self.player setControlStyle:MPMovieControlStyleNone];
        [self.player prepareToPlay];
        [self.player.view setFrame:self.view.frame];
        [self.view addSubview:self.player.view];
        [self.view sendSubviewToBack:self.player.view];
        self.player.scalingMode = MPMovieScalingModeAspectFill;

    }

}

#pragma mark - Notifications
- (void)moviePlayerStateChangeNotification:(NSNotification *)notification {
    MPMoviePlayerController *moviePlayer = notification.object;
    MPMoviePlaybackState playbackState = moviePlayer.playbackState;
    
    switch (playbackState) {
        case MPMoviePlaybackStatePaused:
        case MPMoviePlaybackStateStopped:
        case MPMoviePlaybackStateInterrupted:{
            
            if (self.isLoop) {
                moviePlayer.controlStyle = MPMovieControlStyleNone;
                [self.player play];
            }
            
            break;
            
        }
            
            
        default:
            break;
    }
}


#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([AGVideoFunctions getUrlInfo] != nil) {
        self.isLoop = [AGVideoFunctions getLoopMode];
        
        [self preparePlayback];
    }
}


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [self getPlayerNotifications];
    
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {

    [super viewDidDisappear:animated];
    
    [self.player pause];
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com