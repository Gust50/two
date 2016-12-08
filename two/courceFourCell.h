//
//  courceFourCell.h
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  courceFourCellDelegate<NSObject>
- (void)moreBtnAC;
@end
@interface courceFourCell : UITableViewCell
@property(nonatomic,weak)id<courceFourCellDelegate>delegate;
@end
