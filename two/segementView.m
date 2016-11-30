//
//  segementView.m
//  one
//
//  Created by kobe on 16/11/24.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "segementView.h"

@interface segementView()
@property(nonatomic,strong)UISegmentedControl *segmentV;
@property(nonatomic,strong)NSMutableArray *segmentArray;
@end
@implementation segementView

- (UISegmentedControl *)segmentV{
    if (!_segmentV) {
        _segmentV = [[UISegmentedControl alloc] initWithItems:self.segmentArray];
        _segmentV.selectedSegmentIndex = 0;
        _segmentV.tintColor = [UIColor colorWithRed:40/256.0 green:145/256.0 blue:125/256.0 alpha:1.0];
        [_segmentV addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
//        _segmentV.backgroundColor = [UIColor whiteColor];
//        _segmentV.momentary = YES;
//        // 有基本四种样式
//        segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBordered;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
//        segmentedControl.segmentedControlStyle = UISegmentedControlStyleBezeled;

    }
    return _segmentV;
}
- (NSMutableArray *)segmentArray{
    if (!_segmentArray) {
        _segmentArray = [NSMutableArray array];
        _segmentArray = [NSMutableArray arrayWithObjects:@"精选推荐",@"课程分类", nil];
    }
    return _segmentArray;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.segmentV];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_segmentV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.right.equalTo(weakSelf.mas_right).offset(-30);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-6);
        make.height.equalTo(@32);
    }];
}
- (void)setArray:(NSArray *)array{
    self.segmentArray = (NSMutableArray *)array;
}

#pragma mark --- 代理 ---
- (void)click:(UISegmentedControl *)currentIndex{

    if (self.delegate && [self.delegate respondsToSelector:@selector(click:)]) {
        [self.delegate click:currentIndex];
    }
}
@end
