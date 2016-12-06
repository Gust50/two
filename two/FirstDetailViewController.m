//
//  FirstDetailViewController.m
//  two
//
//  Created by kobe on 16/12/5.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "firstDetailCell.h"
#import "classficModel.h"
@interface FirstDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;///页数
    classListModel *_classListModel;
}
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@property(nonatomic,assign)BOOL isSelectedItem;
@end
static NSString *const cellID = @"cellID";
@implementation FirstDetailViewController
- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
//        _dataSourceArray = [NSMutableArray array];
        _dataSourceArray = [NSMutableArray arrayWithObjects:@"12",@"34", nil];
    }
    return _dataSourceArray;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
//        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [self loadNewData];
//        }];
//        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//            [self loadMoreData];
//        }];
        [self prepareRefresh];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _classListModel = [classListModel new];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"课程详情";
    [self rightImage:@"course_info_bg_collect@2x" push:nil];
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemAC)];
    [self initUI];
}
- (void)rightItemAC{
    _isSelectedItem = !_isSelectedItem;
    if (_isSelectedItem) {
        [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"course_info_bg_collected@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }else{
        [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"course_info_bg_collect@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
}
- (void)initUI{
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[firstDetailCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(@0);
    }];
}
#pragma mark --- UITableViewDelegate ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataSourceArray.count;
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    firstDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath]
    ;
//    _classListModel = _dataSourceArray[indexPath.row];
//    cell.model = _classListModel;
    return cell;
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
  NSString *url = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=course&act=info&do=getClassList&sid=%@&courseid=%@&version=%@&uid=%@",self.SID,self.courseId,VERSION,UID];
    [[NetworkSingleton sharedManager] getDataResult:nil url:url successBlock:^(id responseBody) {
        
    } failureBlock:^(NSString *error) {
        
    }];
}
//自定义一个方法实现
- (void)prepareRefresh
{
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 1; i <= 2; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_listheader_animation_%d",i]];
        [headerImages addObject:image];
    }
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self loadNewData];
        //下拉刷新要做的操作.
    }];
//    gifHeader.stateLabel.hidden = YES;
//    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    
    [gifHeader setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
    [gifHeader setImages:headerImages forState:MJRefreshStateRefreshing];
    _tableView.mj_header= gifHeader;
    
    
    NSMutableArray *footerImages = [NSMutableArray array];
    for (int i = 1; i <= 2; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_listheader_animation_%d",i]];
        [footerImages addObject:image];
    }
    MJRefreshAutoGifFooter *gifFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
        //上拉加载需要做的操作.
    }];
    
//    gifFooter.stateLabel.hidden = YES;
//    gifFooter.refreshingTitleHidden = YES;
    [gifFooter setImages:@[footerImages[0]] forState:MJRefreshStateIdle];
    [gifFooter setImages:footerImages forState:MJRefreshStateRefreshing];
    _tableView.mj_footer = gifFooter;
    
}

@end
