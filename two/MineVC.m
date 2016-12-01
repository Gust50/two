//
//  MineVC.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "MineVC.h"
#import "MainVC.h"
@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的传课";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(0, 100, 50, 30);
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAC) forControlEvents:UIControlEventTouchUpInside];

}
- (void)btnAC{
    MainVC *mainVC = [MainVC new];
    [self.navigationController pushViewController:mainVC animated:YES];
}
@end
