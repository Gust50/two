//
//  LessonVC.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "LessonVC.h"
#import "ClickVC.h"
#import "segementView.h"
#import "DSCarouselView.h"
@interface LessonVC ()<segementViewDelegate>
@property(nonatomic,strong)ClickVC *clickVC;
@property(nonatomic,strong)segementView *segmentView;
@property(nonatomic,strong)DSCarouselView *carouseView;
@property(nonatomic,strong)NSArray *imageArray;
@end

@implementation LessonVC
- (ClickVC *)clickVC{
    if (!_clickVC) {
        _clickVC = [ClickVC new];
    }
    return _clickVC;
}
- (segementView *)segmentView{
    if (!_segmentView) {
        _segmentView = [segementView new];
        _segmentView.array = @[@1,@2];
        _segmentView.backgroundColor = [UIColor colorWithRed:52/255.0 green:169/255.0 blue:147/255.0 alpha:1.0];
        _segmentView.delegate = self;
    }
    return _segmentView;
}
- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = @[@"http://pub.chinaunix.net/uploadfile/201204/20120422080605427.jpg",
          @"http://imgsrc.baidu.com/forum/w%3D580/sign=0c1b13ef0c3387449cc52f74610ed937/bf94b9315c6034a8a4e0f53ecb13495408237644.jpg",
          @"http://hiphotos.baidu.com/%95%D7%D4%AA%B5%C0/pic/item/432e6436d9cd9b4deac4af86.jpg"];
    }
    return _imageArray;
}
- (DSCarouselView *)carouseView{
    if (!_carouseView) {
        _carouseView = [DSCarouselView carouseViewWithImageURLs:self.imageArray placeholder:nil];
    }
    return _carouseView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    [self leftITitle:@"点击这" push:self.clickVC];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.carouseView];
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf.view);
        make.height.equalTo(@45);
    }];
    [_carouseView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(_segmentView.mas_bottom);
        make.height.equalTo(@150);
    }];
}

#pragma mark --- segmentDelegate ---
- (void)click:(UISegmentedControl *)currentIndex{
    if (currentIndex.selectedSegmentIndex == 0) {
        [self.view addSubview:self.carouseView];
        
    }
    else{
        
    }
}


@end
