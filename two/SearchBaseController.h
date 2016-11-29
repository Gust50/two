//
//  SearchBaseController.h
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBaseController : UIViewController
- (void)leftImage:(NSString *)image push:(UIViewController *)controller;///导航栏左边的按钮
- (void)leftITitle:(NSString *)title push:(UIViewController *)controller;///导航栏左边的文字
@end
