//
//  twoCell.m
//  one
//
//  Created by kobe on 16/11/18.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "twoCell.h"

@interface twoCell()

@property(nonatomic,strong)UIImageView *imageView;
@end

@implementation twoCell

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"bottom_tab1_pre"];
    }
    return _imageView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
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
        make.top.left.bottom.right.equalTo(weakSelf);
    }];
}
- (void)setModel:(secondModel *)model{
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.PhotoURL]];
}
@end
