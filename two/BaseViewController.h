//
//  BaseViewController.h
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)rightImage:(NSString *)image push:(UIViewController *)controller;///导航栏右边的按钮
- (void)rightTitle:(NSString *)title push:(UIViewController *)controller;///导航栏右边的文字
@end
