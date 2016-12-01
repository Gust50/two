//
//  MainVC.m
//  one
//
//  Created by kobe on 16/11/16.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MainVC.h"
#import "twoCell.h"
#import "classficModel.h"
@interface MainVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    secondModel *_secondModel;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *imageArray;
@end

static NSString *const twoID = @"twoID";
@implementation MainVC

- (NSArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSArray arrayWithObjects:@"home_btn_new",@"home_btn_show",@"home_btn_buy", nil];
    }
    return _imageArray;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _secondModel = [secondModel new];
    self.view.backgroundColor = [UIColor greenColor];
    [self initUI];
}
- (void)initUI{
    [self loadNewData];
    [self.view addSubview:self.collectionView];
    [self updateViewConstraints];
    [_collectionView registerClass:[twoCell class] forCellWithReuseIdentifier:twoID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(weakSelf.view);
    }];
}
#pragma mark --- UICollectionViewDelegate ---
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
        return self.imageArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
      twoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:twoID forIndexPath:indexPath];
      NSDictionary *dataDic = _imageArray[indexPath.row];
      _secondModel = [secondModel mj_objectWithKeyValues:dataDic];
      cell.model = _secondModel;
      cell.backgroundColor = [UIColor whiteColor];
    
    return cell;

}


#pragma mark --- UICollectionViewLayout ---
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
        return CGSizeMake(self.view.width/2.5, 80);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
        return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
        return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}
-(void)loadNewData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRecommendData];
    });
}
- (void)getRecommendData{
    [[NetworkSingleton sharedManager] getRecommendCourseResult:nil url:RecommentedUrl successBlock:^(id responseBody) {
        _imageArray = [responseBody objectForKey:@"AlbumList"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
        
    } failureBlock:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:error];
    }];
    
}
@end
