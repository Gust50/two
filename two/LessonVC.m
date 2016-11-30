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
#import "imageCell.h"
#import "ListViewController.h"
@interface LessonVC ()<segementViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,ClassficViewControllerDelegate>
@property(nonatomic,strong)segementView *segmentView;
@property(nonatomic,strong)DSCarouselView *carouseView;
@property(nonatomic,strong)NSArray *imageArray;
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)ClassficViewController *classficVC;
@property(nonatomic,strong)ListViewController *listVC;
@end
static NSString *const cellID = @"cellID";
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
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewLayout *layout = [UICollectionViewLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _collectionView;
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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    [self leftITitle:@"点击这" push:nil];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.carouseView];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.classficVC.view];
    self.classficVC.view.hidden = YES;
    [self updateViewConstraints];
//    [_collectionView registerClass:[imageCell class] forCellWithReuseIdentifier:cellID];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
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
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view);
        make.top.equalTo(_carouseView.mas_bottom);
        make.height.equalTo(@100);
        make.width.equalTo(@200);
    }];
    [_classficVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_segmentView.mas_bottom);
    }];
}
#pragma mark --- UICollectionViewDelegate ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    imageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    label.backgroundColor = [UIColor greenColor];
    label.text = @"22";
    [cell addSubview:label];
//    cell.image = @"LaunchImageIPhone-700@2x";
//    cell.backgroundColor = [UIColor blueColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //选择
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(20, 20);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 3;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 0);
}

#pragma mark --- segmentDelegate ---
- (void)click:(UISegmentedControl *)currentIndex{
    if (currentIndex.selectedSegmentIndex == 0) {
        self.carouseView.hidden = NO;
        self.classficVC.view.hidden = YES;
    }
    else{
        self.carouseView.hidden = YES;
        self.classficVC.view.hidden = NO;
        
    }
}
#pragma mark --- ClassficViewDelegate ---
- (void)pushList{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.listVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
@end
