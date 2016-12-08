//
//  SchoolViewController.m
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "SchoolViewController.h"
#import "courceOneCell.h"
#import "courceThreeCell.h"
#import "courceFourCell.h"
@interface SchoolViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)BOOL isSelectedItem;
@property(nonatomic,strong)UITableView *tableView;
@end
static NSString *const oneID = @"oneID";
static NSString *const twoID = @"twoID";
static NSString *const threeID = @"threeID";
static NSString *const fourID = @"fourID";
@implementation SchoolViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        UIView *view = [UIView new];
        view.backgroundColor = RGB(237, 236, 242);
        _tableView.tableFooterView = view;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = RGB(59, 192, 167);
    self.view.backgroundColor = RGB(237, 236, 242);
    self.title = @"课程详情";
    [self rightImage:@"course_info_bg_collect@2x" push:nil];
    [self.navigationItem.rightBarButtonItem setAction:@selector(rightItemAC)];
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.tableView];
    [self updateViewConstraints];
    [_tableView registerClass:[courceOneCell class] forCellReuseIdentifier:oneID];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:twoID];
    [_tableView registerClass:[courceThreeCell class] forCellReuseIdentifier:threeID];
    [_tableView registerClass:[courceFourCell class] forCellReuseIdentifier:fourID];
}
- (void)rightItemAC{
    _isSelectedItem = !_isSelectedItem;
    if (_isSelectedItem) {
        [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"course_info_bg_collected@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
    }else{
        [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"course_info_bg_collect@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(weakSelf.view);
    }];
}
#pragma mark --- UITableViewDelegate ---
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        courceOneCell *cell = [tableView dequeueReusableCellWithIdentifier:oneID forIndexPath:indexPath];
        return cell;
    }else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:twoID forIndexPath:indexPath];
        cell.textLabel.text = @"+86 029-82668902";
        cell.textLabel.textColor = RGB(164, 164, 164);
        cell.textLabel.font = [UIFont systemFontOfSize:14.0];
        return cell;
    }else if(indexPath.section == 2){
        courceThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:threeID forIndexPath:indexPath];
        return cell;
    }else{
        courceFourCell *cell = [tableView dequeueReusableCellWithIdentifier:fourID forIndexPath:indexPath];
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 266;
            break;
        case 1:
            return 29;
            break;
        case 2:
            return 120;
            break;
        case 3:
            return 130;
            break;
        default:
            break;
    }
    return YES;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 11;
    }
}
@end
