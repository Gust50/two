//
//  NavigationVC.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "NavigationVC.h"

@interface NavigationVC ()

@end

@implementation NavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:52/255.0 green:169/255.0 blue:147/255.0 alpha:1.0];
    bar.translucent = NO;
}

@end
