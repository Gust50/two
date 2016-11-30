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
- (void)rightImage:(NSString *)image push:(UIViewController *)controller{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAC)];
    self.rightController = controller;
    }
- (void)rightTitle:(NSString *)title push:(UIViewController *)controller{

           self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAC)];
                self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
              self.rightController = controller;
           
    }
- (void)rightBtnAC{
    if (self.rightController == nil) {
          [self performSelector:@selector(alertAC) withObject:self afterDelay:0.1];
    }else{
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:self.rightController animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    }
}
- (void)alertAC{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入内容再搜索" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:0 handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
