//
//  LessonVC.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "LessonVC.h"
#import "ClassficViewController.h"
#import "segementView.h"
#import "DSCarouselView.h"
#import "ListViewController.h"
#import "classficModel.h"
#import "MainVC.h"
@interface LessonVC ()<segementViewDelegate,ClassficViewControllerDelegate>

{
    NSInteger _index;
    circleModel *_circleModel;
}
@property(nonatomic,strong)segementView *segmentView;
@property(nonatomic,strong)DSCarouselView *carouseView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)ClassficViewController *classficVC;
@property(nonatomic,strong)ListViewController *listVC;
@property(nonatomic,strong)MainVC *mainVC;
@end

@implementation LessonVC

- (segementView *)segmentView{
    if (!_segmentView) {
        _segmentView = [segementView new];
        _segmentView.array = @[@1,@2];
        _segmentView.backgroundColor = [UIColor colorWithRed:52/255.0 green:169/255.0 blue:147/255.0 alpha:1.0];
        _segmentView.delegate = self;
    }
    return _segmentView;
}
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
//        _imageArray = @[@"http://pub.chinaunix.net/uploadfile/201204/20120422080605427.jpg",
//          @"http://imgsrc.baidu.com/forum/w%3D580/sign=0c1b13ef0c3387449cc52f74610ed937/bf94b9315c6034a8a4e0f53ecb13495408237644.jpg",
//          @"http://hiphotos.baidu.com/%95%D7%D4%AA%B5%C0/pic/item/432e6436d9cd9b4deac4af86.jpg"];
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (ClassficViewController *)classficVC{
    if (!_classficVC) {
        _classficVC = [ClassficViewController new];
        _classficVC.delegate = self;
    }
    return _classficVC;
}
- (ListViewController *)listVC{
    if (!_listVC) {
        _listVC = [ListViewController new];
    }
    return _listVC;
}
- (MainVC *)mainVC{
    if (!_mainVC) {
        _mainVC = [MainVC new];
    }
    return _mainVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0;
    _classficVC.index = _index;
    _circleModel = [circleModel new];
    self.title = @"课程推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    [self leftITitle:@"点击这" push:nil];
    [self initUI];
}
- (void)initUI{
    [self loadNewData];
    [self.view addSubview:self.segmentView];

    [self.view addSubview:self.classficVC.view];
    [self.view addSubview:self.mainVC.view];
    self.mainVC.view.backgroundColor = [UIColor blueColor];
    [self updateViewConstraints];
   
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_segmentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf.view);
        make.height.equalTo(@45);
    }];

    if (_index == 0) {
       
        [_classficVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(weakSelf.view);
            make.top.equalTo(@295);
        }];
    }else{
    
    [_classficVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_segmentView.mas_bottom);
    }];
    }
    [_mainVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@100);
        make.bottom.equalTo(_classficVC.view.mas_top);
    }];
}

-(void)loadNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRecommendData];
    });
}
- (void)getRecommendData{
    [[NetworkSingleton sharedManager] getRecommendCourseResult:nil url:RecommentedUrl successBlock:^(id responseBody) {
        NSMutableArray *focusArray = [responseBody objectForKey:@"FocusList"];
        NSLog(@"数组%@",focusArray);
        NSMutableArray  *array = [NSMutableArray array];
        for (NSDictionary *d in focusArray) {
            _circleModel = [circleModel mj_objectWithKeyValues:d];
            [array addObject:_circleModel.PhotoURL];
        }
     self.imageArray = array;
        NSLog(@"图片%@",array);
    } failureBlock:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:error];
    }];
   
    _carouseView = [[DSCarouselView alloc] initWithFrame:CGRectMake(0, 45, self.view.width, 150)];
    _carouseView.backgroundColor = [UIColor blueColor];
    _carouseView = [DSCarouselView carouseViewWithImageURLs:self.imageArray placeholder:nil];
  
    [self.view addSubview:self.carouseView];
   
}

#pragma mark --- segmentDelegate ---
- (void)click:(UISegmentedControl *)currentIndex{
    _index = currentIndex.selectedSegmentIndex;
    [self updateViewConstraints];
    _classficVC.index = _index;
    if (currentIndex.selectedSegmentIndex == 0) {
        self.mainVC.view.hidden = NO;
        self.carouseView.hidden = NO;
    }
    else{
        
        self.carouseView.hidden = YES;
        self.mainVC.view.hidden = YES;
    }
}
#pragma mark --- ClassficViewDelegate ---
- (void)pushList{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.listVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
@end
