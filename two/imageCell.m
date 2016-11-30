//
//  imageCell.m
//  two
//
//  Created by kobe on 16/11/30.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "imageCell.h"

@interface imageCell()
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation imageCell
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
//        _imageView.image = [UIImage imageNamed:@"LaunchImageIPhone-700@2x"];
        _imageView.backgroundColor = [UIColor orangeColor];
    }
    return _imageView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.imageView];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(weakSelf);
    }];
}
- (void)setImage:(NSString *)image{
    self.imageView.image = [UIImage imageNamed:image];
}
@end
