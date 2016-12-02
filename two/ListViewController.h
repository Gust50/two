//
//  ListViewController.h
//  two
//
//  Created by kobe on 16/11/30.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : BaseViewController
@property(nonatomic, strong) NSString *cateType;///课程类型@"zhibo";@"feizhibo"

///非直播
@property(nonatomic, strong) NSMutableArray *cateNameArray;///课程名数组
@property(nonatomic, strong) NSMutableArray *cateIDArray;///课程ID数组

@end
