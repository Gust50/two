//
//  classifyCell.m
//  one
//
//  Created by kobe on 16/11/21.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "classifyCell.h"

@interface classifyCell()
@property(nonatomic,strong)UIImageView *leftImage;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIView *lineView;

@end
@implementation classifyCell

- (UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [UIImageView new];
        _leftImage.image = [UIImage imageNamed:@"channel_icon_live_pre"];
        _leftImage.layer.cornerRadius = 20;
    }
    return _leftImage;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"全部分类";
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = separaterColor;
    }
    return _lineView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.leftImage];
    [self addSubview:self.label];
    [self addSubview:self.lineView];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_leftImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(@15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImage.mas_right).offset(20);
        make.centerY.equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [_lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf);
        make.height.equalTo(@1);
    }];
    
}

- (void)setTitleStr:(NSString *)titleStr{
    _label.text = titleStr;
}
- (void)setImageStr:(NSString *)imageStr{
    _leftImage.image = [UIImage imageNamed:imageStr];
}
@end
