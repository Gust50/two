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
        _imageArray = [NSArray arrayWithObjects:@"",@"",@"",@"", nil];
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
        make.height.equalTo(@100);
    }];
}

#pragma mark --- segmentDelegate ---
- (void)click:(NSInteger)selectedSegmentIndex{
    if (selectedSegmentIndex == 0) {
        [self.view addSubview:self.carouseView];
    }
    else{
        NSLog(@"11111");
    }
}


@end
