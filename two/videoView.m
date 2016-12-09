//
//  videoView.m
//  two
//
//  Created by kobe on 16/12/9.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "videoView.h"

@interface videoView()
{
    UIView *_loadView;
    UIActivityIndicatorView *_activityIndicatiorView;
    NSTimer *timer;
    BOOL viewIsShowing;
    id playbackObserver;

}
@end
@implementation videoView

- (id)initWithFrame:(CGRect)frame contentURL:(NSURL *)contentURL{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        self.playerItem = [AVPlayerItem playerItemWithURL:contentURL];
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
        self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        self.playerLayer.frame = frame;
        [self.layer addSublayer:self.playerLayer];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    _loadView = [[UIView alloc] initWithFrame:self.playerLayer.frame];
    _loadView.backgroundColor = [UIColor clearColor];
    _activityIndicatiorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_activityIndicatiorView setCenter:_loadView.center];
    [_activityIndicatiorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [_activityIndicatiorView startAnimating];
    [_loadView addSubview:_activityIndicatiorView];
    [self addSubview:_loadView];
    [self initControl];
}
- (void)initControl{
    self.playerHudView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    [self addSubview:self.playerHudView];
    
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backBtn.frame = CGRectMake(15, 0, 30, 30);
    [self.backBtn addTarget:self action:@selector(backBtnAC) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setImage:[UIImage imageNamed:@"file_tital_back_but@2x"] forState:UIControlStateNormal];
    [self.playerHudView addSubview:self.backBtn];
    
    self.playHudBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height -44, self.frame.size.width, 44)];
    self.playHudBottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    [self addSubview:self.playHudBottomView];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.playBtn.frame = CGRectMake(8, 10, 20, 20);
    [self.playBtn addTarget:self action:@selector(playBtnAC) forControlEvents:UIControlEventTouchUpInside];
    [self.playBtn setSelected:NO];
    [self.playBtn setImage:[UIImage imageNamed:@"full_pause_icon"] forState:UIControlStateSelected];
    [self.playBtn setImage:[UIImage imageNamed:@"full_play_icon"] forState:UIControlStateNormal];
    [self.playBtn setTintColor:[UIColor clearColor]];
    [self.playHudBottomView addSubview:self.playBtn];
    
    self.zoomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zoomBtn.frame = CGRectMake(self.frame.size.width - 27, 10, 20, 20);
    [self.zoomBtn addTarget:self action:@selector(zoomBtnAC) forControlEvents:UIControlEventTouchUpInside];
    [self.zoomBtn setSelected:NO];
    [self.zoomBtn setImage:[UIImage imageNamed:@"zoomout1"] forState:UIControlStateSelected];
    [self.zoomBtn setImage:[UIImage imageNamed:@"zoomin1"] forState:UIControlStateNormal];
    [self.zoomBtn setTintColor:[UIColor clearColor]];
    [self.playHudBottomView addSubview:self.zoomBtn];
    
    self.progressView = [[UIProgressView alloc] init];
    self.progressView.frame = CGRectMake(32, 17, self.frame.size.width - 60, 14);
    self.progressView.progressViewStyle = UIProgressViewStyleBar;
    self.progressView.progressTintColor = RGB(181, 181, 181);
    self.progressView.backgroundColor = [UIColor greenColor];
    self.progressView.progress = 0;
    [self.playHudBottomView addSubview:self.progressView];
    
    //播放进度条
    self.progressBar = [[UISlider alloc] init];
    self.progressBar.frame = CGRectMake(30, 11, self.frame.size.width-60, 14);
    [self.progressBar addTarget:self action:@selector(progressBarChanged:) forControlEvents:UIControlEventValueChanged];
    [self.progressBar addTarget:self action:@selector(progressBarAC) forControlEvents:UIControlEventTouchUpInside];
    [self.progressBar setMinimumTrackTintColor:RGB(242, 96, 0)];
    [self.progressBar setMaximumTrackTintColor:[UIColor clearColor]]; //设置成透明
    //    [self.progressBar trackRectForBounds:CGRectMake(0, 0, frameWidth-60, 5)];
    [self.progressBar setThumbTintColor:[UIColor clearColor]];
    //滑块图片
    UIImage *thumbImage = [UIImage imageNamed:@"account_cache_isplay"];
    //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
    [self.progressBar setThumbImage:thumbImage forState:UIControlStateHighlighted];
    [self.progressBar setThumbImage:thumbImage forState:UIControlStateNormal];
    
    [self.playHudBottomView addSubview:self.progressBar];
    
    //播放时间
    self.playTime = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 200, 20)];
    self.playTime.text = @"00:00:00/00:00:00";
    self.playTime.font = [UIFont systemFontOfSize:13];
    self.playTime.textAlignment = NSTextAlignmentLeft;
    self.playTime.textColor = [UIColor whiteColor];
    [self.playHudBottomView addSubview:self.playTime];
    //添加监听
    [self addNotification];
//    [self addObserverToPlayerItem:self.playerItem];
    [self addProgressObserver];
}
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}
//添加播放进度条更新
-(void)addProgressObserver{
    WS(weakSelf);
    AVPlayerItem *playerItem = self.player.currentItem;
    NSLog(@"//添加播放进度条更新");
    playbackObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time){
        float current = CMTimeGetSeconds(time);
        float total = CMTimeGetSeconds(playerItem.duration);
        //更新进度条
        float progress = current/total;
        weakSelf.progressBar.value = progress;
        NSString *currentTime = [weakSelf getStringFromCMTime:weakSelf.player.currentTime];
        NSString *totalTime = [weakSelf getStringFromCMTime:playerItem.duration];
        weakSelf.playTime.text = [NSString stringWithFormat:@"%@/%@",currentTime,totalTime];
    }];
}
-(NSString*)getStringFromCMTime:(CMTime)time
{
    Float64 currentSeconds = CMTimeGetSeconds(time);
    int mins = currentSeconds/60.0;
    int hours = mins / 60.0f;
    int secs = fmodf(currentSeconds, 60.0);
    mins = fmodf(mins, 60.0f);
    
    NSString *hoursString = hours < 10 ? [NSString stringWithFormat:@"0%d", hours] : [NSString stringWithFormat:@"%d", hours];
    NSString *minsString = mins < 10 ? [NSString stringWithFormat:@"0%d", mins] : [NSString stringWithFormat:@"%d", mins];
    NSString *secsString = secs < 10 ? [NSString stringWithFormat:@"0%d", secs] : [NSString stringWithFormat:@"%d", secs];
    
    
    return [NSString stringWithFormat:@"%@:%@:%@", hoursString,minsString, secsString];
}
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成");
}
- (void)backBtnAC{
    //返回，并在全屏时推出全屏
}
- (void)playBtnAC{
    if(self.isPlaying){
        [self pause];
    }else{
        [self play];
    }
}
- (void)zoomBtnAC{
    //全屏、非全屏
}
- (void)progressBarChanged:(UISlider *)sender{
    if (self.isPlaying) {
        [self.player pause];
    }
    CMTime seekTime = CMTimeMakeWithSeconds(sender.value*(double)self.player.currentItem.asset.duration.value/(double)self.player.currentItem.asset.duration.timescale, self.player.currentTime.timescale);
    [self.player seekToTime:seekTime];
}
- (void)progressBarAC{
    [self startTimer];
    if (self.isPlaying) {
        [self.player play];
    }
}
- (void)startTimer{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(isHiddenShow) userInfo:nil repeats:YES];
    }
}
-(void)stopTimer{
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}
- (void)isHiddenShow{
    [self showHud:viewIsShowing];
}
-(void)showHud:(BOOL)showing{
    if (showing) {//隐藏
        viewIsShowing = !showing;
        self.playHudBottomView.hidden = YES;
        [self stopTimer];
    }else{//显示
        viewIsShowing = !showing;
        self.playHudBottomView.hidden = NO;
        [self startTimer];
    }
}

-(void)play{
    [self.player play];
    [self.playBtn setSelected:YES];
    self.isPlaying = YES;
}
-(void)pause{
    [self.player pause];
    self.isPlaying = NO;
    [self.playBtn setSelected:NO];
}
@end
