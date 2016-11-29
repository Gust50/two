//
//  MainTabBar.m
//  two
//
//  Created by kobe on 16/11/29.
//  Copyright © 2016年 Gust50. All rights reserved.
//
#import "MainTabBar.h"
#import "LessonVC.h"
#import "MineVC.h"
#import "DownLoadVC.h"
#import "NavigationVC.h"
@interface MainTabBar ()
@property(nonatomic,strong)LessonVC *lessonVC;
@property(nonatomic,strong)MineVC *mineVC;
@property(nonatomic,strong)DownLoadVC *downLoadVC;
@end

@implementation MainTabBar
- (LessonVC *)lessonVC{
    if (!_lessonVC) {
        _lessonVC = [LessonVC new];
    }
    return _lessonVC;
}
- (DownLoadVC *)downLoadVC{
    if (!_downLoadVC) {
        _downLoadVC = [DownLoadVC new];
    }
    return _downLoadVC;
}

- (MineVC *)mineVC{
    if (!_mineVC) {
        _mineVC = [MineVC new];
    }
    return _mineVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].tintColor = [UIColor grayColor];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:52/255.0 green:169/255.0 blue:147/255.0 alpha:1.0]} forState:UIControlStateNormal];
    
    [self controller:self.lessonVC title:@"课程推荐" image:@"bottom_tab1_unpre" selectImage:@"bottom_tab1_pre"];
    [self controller:self.mineVC title:@"我的传课" image:@"bottom_tab3_unpre" selectImage:@"bottom_tab3_pre"];
    [self controller:self.downLoadVC title:@"离线下载" image:@"bottom_tab2_unpre" selectImage:@"bottom_tab2_pre"];
}

- (void)controller:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage{
    NavigationVC *nav = [[NavigationVC alloc] initWithRootViewController:controller];
    
    controller.tabBarItem  = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [self addChildViewController:nav];
    
}

@end
