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
#import "headerView.h"
#import "headerCell.h"
@interface FirstDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _page;///页数
    classListModel *_classListModel;
}
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@property(nonatomic,assign)BOOL isSelectedItem;

@end
static NSString *const oneID = @"oneID";
static NSString *const cellID = @"cellID";
static NSString *const headerID = @"headerID";
static NSString *const headerCellID = @"headerCellID";
@implementation FirstDetailViewController
- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray array];
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
    self.navigationController.navigationBar.barTintColor = RGB(59, 192, 167);
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"课程详情";
    [self rightImage:@"course_info_bg_collect@2x" push:nil];
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemAC)];
    [self loadNewData];
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
    [_tableView registerClass:[UITableViewCell  class] forCellReuseIdentifier:oneID];
    [_tableView registerClass:[headerView class] forHeaderFooterViewReuseIdentifier:headerID];
    [_tableView registerClass:[headerCell class] forCellReuseIdentifier:headerCellID];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else{
        return self.dataSourceArray.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0) {
        return 110;
    }
    else{
        return 60;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 55;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        headerCell *cell = [tableView dequeueReusableCellWithIdentifier:headerCellID forIndexPath:indexPath];
        return cell;
    }else{
    if ([self.dataSourceArray[indexPath.row] isKindOfClass:[ClassList class]]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:oneID forIndexPath:indexPath];
        ClassList *classList = _dataSourceArray[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"第%@章:%@",classList.StepIndex,classList.StepName];
    
        return cell;
    }
    else{
    firstDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath]
    ;

    classListModel *model = _dataSourceArray[indexPath.row];
    cell.model = model;
        return cell;
    }
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    headerView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    return headerView;
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
        StepList *_stepList = [StepList mj_objectWithKeyValues:responseBody];
        [self.dataSourceArray removeAllObjects];
        for (ClassList *_classList in _stepList.StepList) {
            [self.dataSourceArray addObject:_classList];
            for (classListModel *_classModel  in _classList.ClassList) {
                [self.dataSourceArray addObject:_classModel];
            }
        }
        [self.tableView reloadData];
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
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    
    [gifHeader setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
    [gifHeader setImages:headerImages forState:MJRefreshStateRefreshing];
    _tableView.mj_header= gifHeader;
    
    
//    NSMutableArray *footerImages = [NSMutableArray array];
//    for (int i = 1; i <= 2; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_listheader_animation_%d",i]];
//        [footerImages addObject:image];
//    }
//    MJRefreshAutoGifFooter *gifFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
//        //[self loadMoreData];
//        //上拉加载需要做的操作.
//    }];
    
//    gifFooter.stateLabel.hidden = YES;
//    gifFooter.refreshingTitleHidden = YES;
//    [gifFooter setImages:@[footerImages[0]] forState:MJRefreshStateIdle];
//    [gifFooter setImages:footerImages forState:MJRefreshStateRefreshing];
//    _tableView.mj_footer = gifFooter;
    
}

@end
