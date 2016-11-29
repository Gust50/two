//
//  SearchBaseController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "SearchBaseController.h"
#import "SearchVC.h"
@interface SearchBaseController ()
@property(nonatomic,strong)UIButton *rightButton;
@end

@implementation SearchBaseController
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:0];
        _rightButton.frame = CGRectMake(0, 0, 20, 20);
        [_rightButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}
- (void)btnAC{
    SearchVC *searchVC = [SearchVC new];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
}


@end
