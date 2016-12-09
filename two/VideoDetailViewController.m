//
//  VideoDetailViewController.m
//  two
//
//  Created by kobe on 16/12/7.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "VideoDetailViewController.h"
#import "videoView.h"
@interface VideoDetailViewController ()

@end

@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}
- (void)initUI{
    NSURL *url = [NSURL URLWithString:self.FileUrl];
    videoView *_videoView = [[videoView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) contentURL:url];
    [self.view addSubview:_videoView];
    
}
@end
