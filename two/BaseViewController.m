//
//  BaseViewController.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property(nonatomic,strong)UIViewController *rightController;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btnback"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAC)];
}

- (void)leftBtnAC{
   [self.navigationController popViewControllerAnimated:YES];
}




#pragma mark --- 使用的方法 ---
- (void)rightItem:(NSString *)image push:(UIViewController *)controller{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAC)];
    self.rightController = controller;
}
- (void)rightBtnAC{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.rightController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
