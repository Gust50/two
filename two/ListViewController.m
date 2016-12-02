//
//  ListViewController.m
//  two
//
//  Created by kobe on 16/11/30.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "ListViewController.h"
#import "listViewCell.h"
#import "classficModel.h"
@interface ListViewController ()<UITableViewDelegate,UITableViewDataSource>{
    courceModel *_courceModel;
    NSInteger _type;///segmemt
    NSInteger _page;///页数
    NSInteger _limit;///每页个数
    NSInteger _charge;///免费 收费
    NSString *_cateied;///课程分类
    NSInteger _index;
}
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,strong)UISegmentedControl *segmentControl;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@end
static NSString *const cellID = @"cellID";
@implementation ListViewController
- (NSArray *)array{
    if (!_array) {
        _array = [NSArray arrayWithObjects:@"免费",@"付费", nil];
    }
    return _array;
}
- (UISegmentedControl *)segmentControl{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:self.array];
        _segmentControl.frame = CGRectMake(self.view.frame.size.width/2-80, 30, 160, 30);
        _segmentControl.selectedSegmentIndex = 0;
        
        NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil];
        [_segmentControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
        NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        [_segmentControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateHighlighted];
        _segmentControl.tintColor = RGB(46, 158, 138);
        [_segmentControl addTarget:self action:@selector(segmentAC:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}
- (void)segmentAC:(UISegmentedControl *)index{
    if (index.selectedSegmentIndex == 0) {
        _index = 0;
        _page = 1;
        _charge = 1;
    }else{
        _index = 1;
        _page = 1;
        _charge = 2;
    }
    [self.tableView reloadData];
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray = [NSMutableArray arrayWithObjects:@"345",@"54545", nil];
    }
    return _dataSourceArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _courceModel = [courceModel new];
    _page = 1;
    _limit = 20;
    _charge = 1;
    _index = 0;
    if ([self.cateType isEqualToString:@"feizhibo"]) {
        _cateied = self.cateIDArray[0];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.titleView = self.segmentControl;
    [self initUI];
}
- (void)initUI{
    [self loadData];
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[listViewCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
 
}
#pragma mark --- UITableViewDelegate ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"数量%ld",self.dataSourceArray.count);
    return self.dataSourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    listViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    NSDictionary *dic = _dataSourceArray[indexPath.row];
    _courceModel = [courceModel mj_objectWithKeyValues:dic];
    cell.model = _courceModel;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark --- 解析 ---
- (void)loadData{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
           [self getRequestData];
        });
}
- (void)getRequestData{
    NSString *url;
    if ([self.cateType isEqualToString:@"zhibo"]) {
       url = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=search&act=mobile&from=iPhone&page=%ld&limit=%ld&today=1&charge=%ld",_page,_limit,_charge];
    }else{
        url = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=search&act=mobile&from=iPhone&page=%ld&limit=%ld&cateid=%@&charge=%ld",_page,_limit,_cateied,_charge];
    }
    
    [[NetworkSingleton sharedManager] getDataResult:nil url:url successBlock:^(id responseBody) {
        if (_page == 1) {
            [_dataSourceArray removeAllObjects];
        }
        _dataSourceArray = [responseBody objectForKey:@"ClassList"];
        NSLog(@"数据%@",_dataSourceArray);
        //dispatch_sync(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
//        });
    } failureBlock:^(NSString *error) {
        
    }];
}
@end
