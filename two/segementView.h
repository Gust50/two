//
//  segementView.h
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol segementViewDelegate<NSObject>
- (void)click:(UISegmentedControl *)currentIndex;
@end

@interface segementView : UIView
@property(nonatomic,strong)NSArray *array;
@property(nonatomic,weak)id<segementViewDelegate>delegate;
@end
