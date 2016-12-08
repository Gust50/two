//
//  headerView.h
//  two
//
//  Created by kobe on 16/12/7.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classficModel.h"

@protocol headerViewDelegate <NSObject>
- (void)tapContentAC;
- (void)tapDetailAC;
- (void)tapCommentAC;
@end

@interface headerView : UITableViewHeaderFooterView
@property(nonatomic,strong)courceModel *model;
@property(nonatomic,strong)id<headerViewDelegate>delegate;
@end
