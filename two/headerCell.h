//
//  headerCell.h
//  two
//
//  Created by kobe on 16/12/7.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "classficModel.h"

@protocol headerCellDelegate <NSObject>
- (void)arrowBtnAC;
@end

@interface headerCell : UITableViewCell
@property(nonatomic,strong)courceModel *model;
@property(nonatomic,weak)id<headerCellDelegate>delegate;
@end
