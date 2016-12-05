//
//  FirstDetailViewController.m
//  two
//
//  Created by kobe on 16/12/5.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "FirstDetailViewController.h"

@interface FirstDetailViewController ()
@property(nonatomic,strong)NSMutableArray *dataSourceArray;
@property(nonatomic,assign)BOOL isSelectedItem;
@end

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
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(@0);
    }];
}
@end
