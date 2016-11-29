//
//  searchVC.m
//  one
//
//  Created by kobe on 16/11/18.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "SearchVC.h"

@interface SearchVC ()
@property(nonatomic,strong)UIView *searchView;
@property(nonatomic,strong)UITextField *searchField;
@property(nonatomic,strong)UIButton *leftView;
@property(nonatomic,strong)UIButton *searchBtn;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *backgroundView;
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *NullLabel;
@end

@implementation SearchVC
- (UILabel *)NullLabel{
    if (!_NullLabel) {
        _NullLabel = [UILabel new];
        _NullLabel.text = @"暂无记录";
        _NullLabel.textAlignment = NSTextAlignmentCenter;
        _NullLabel.textColor = [UIColor grayColor];
    }
    return _NullLabel;
}
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"nodata"];
        _imageView.layer.cornerRadius = 40;
    }
    return _imageView;
}
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [UIView new];
        _backgroundView.backgroundColor = [UIColor whiteColor];
    }
    return _backgroundView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [UITableView new];
    }
    return _tableView;
}
- (UIView *)searchView{
    if (!_searchView) {
        _searchView = [UIView new];
        _searchView.backgroundColor = [UIColor orangeColor];
    }
    return _searchView;
}
- (UITextField *)searchField{
    if (!_searchField) {
        _searchField = [UITextField new];
        _searchField.placeholder = @"搜索iphone试试";
        _searchField.backgroundColor = [UIColor whiteColor];
        _searchField.layer.cornerRadius = 10;
        _searchField.leftView = self.leftView;
        _searchField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _searchField;
}
- (UIButton *)leftView{
    if (!_leftView) {
        _leftView = [UIButton buttonWithType:0];
        _leftView.frame = CGRectMake(15, 10, 15, 15);
        
        [_leftView setImage:[UIImage imageNamed:@"search-1"] forState:UIControlStateNormal];
        _leftView.userInteractionEnabled = NO;
    }
    return _leftView;
}
- (UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [UIButton new];
        [_searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(searchAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品搜索";
    [self initUI];
}
- (void)initUI{
    [self.view addSubview:self.searchView];
    [self.searchView addSubview:self.searchField];
    [self.searchView addSubview:self.searchBtn];
    BOOL isNull = YES;
    if (isNull) {
        [self.view addSubview:self.backgroundView];
        [self.backgroundView addSubview:self.imageView];
        [self.backgroundView addSubview:self.NullLabel];
    }else{
        [self.view addSubview:self.tableView];
        
    }
    
    [self updateViewConstraints];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    WS(weakSelf);
    [_searchView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(@0);
        make.height.equalTo(@50);
    }];
    [_searchField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchView.mas_left).offset(20);
        make.right.equalTo(_searchView.mas_right).offset(-70);
        make.centerY.equalTo(_searchView.mas_centerY);
        make.height.equalTo(@30);
        
    }];
    [_searchBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_searchView.mas_right).offset(-10);
        make.centerY.equalTo(_searchField.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(40, 20));
    }];
    [_tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_searchView.mas_bottom);
    }];
    [_backgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf.view);
        make.top.equalTo(_searchView.mas_bottom);
    }];
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.centerY.equalTo(weakSelf.view.mas_centerY).offset(-50);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [_NullLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_imageView.mas_centerX);
        make.top.equalTo(_imageView.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
}
- (void)searchAC{

    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.mode = MBProgressHUDModeIndeterminate;
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2];
}






@end
