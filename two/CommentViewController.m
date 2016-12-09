//
//  CommentViewController.m
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "CommentViewController.h"
#import "commentCell.h"
#import "classficModel.h"
@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;
    NSInteger _pageLimit;
    commentModel *_commentModel;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end
static NSString *const cellID = @"cellID";
@implementation CommentViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UITableViewHeaderFooterView new];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadNewData];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self loadMoreData];
        }];

    }
    return _tableView;
}
- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
    }
    return _dataSourceArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _commentModel = [commentModel new];
    self.title = @"课程详情";
    [self rightTitle:@"评价" push:nil];
    [self initUI];
}
- (void)initUI{
    [self loadNewData];
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[commentCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(weakSelf.view);
    }];
}
#pragma mark --- UITableViewDelegate ---
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    commentModel *model = _dataSourceArray[indexPath.row];
    
    return 80 ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    commentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSDictionary *d = _dataSourceArray[indexPath.row];
    _commentModel = [commentModel mj_objectWithKeyValues:d];
    cell.model = _commentModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];

}
#pragma mark --- 解析 ---
- (void)loadNewData{
    _page = 1;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRequestData];
    });
    [self performSelector:@selector(endHeaderFreshing) withObject:nil afterDelay:0.5];
}
- (void)endHeaderFreshing{
    [self.tableView.mj_header endRefreshing];
}
- (void)loadMoreData{
    _page++;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self getRequestData];
    });
    [self performSelector:@selector(endFooterFreshing) withObject:nil afterDelay:0.5];
}
- (void)endFooterFreshing{
    [self.tableView.mj_footer endRefreshing];
}
- (void)getRequestData{
    NSString *url;
        url = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=course&act=vote&do=list&uid=%@&courseid=%@&sid=%@&limit=%ld&page=%ld",UID,self.courseID,self.SID,(long)_pageLimit,(long)_page];

    [[NetworkSingleton sharedManager] getDataResult:nil url:url successBlock:^(id responseBody) {
     
        _dataSourceArray = [responseBody objectForKey:@"DataList"];
        NSLog(@"数组数据%@",_dataSourceArray);
        [self.tableView reloadData];
    } failureBlock:^(NSString *error) {
        
    }];
    
}

@end
