//
//  ClassficViewController.m
//  
//
//  Created by kobe on 16/11/30.
//
//

#import "ClassficViewController.h"

@interface ClassficViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end
static NSString *const cellID = @"cellID";
@implementation ClassficViewController
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI{
//    [self.view addSubview:self.tableView];
//    [self updateViewConstraints];
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
}

@end
