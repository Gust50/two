//
//  videoView.h
//  two
//
//  Created by kobe on 16/12/9.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface videoView : UIView
- (id)initWithFrame:(CGRect)frame contentURL:(NSURL *)contentURL;
-(void)play;
-(void)pause;

@property(nonatomic,assign)BOOL isPlaying;
@property(nonatomic,strong)AVPlayerItem *playerItem;
@property(nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
@property(nonatomic,strong)UIView *playerHudView;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIView *playHudBottomView;
@property(nonatomic,strong)UIButton *playBtn;
@property(nonatomic,strong)UIButton *zoomBtn;
@property(nonatomic,strong)UIProgressView *progressView;
@property(nonatomic,strong)UISlider *progressBar;
@property(nonatomic,strong)UILabel *playTime;
@end
