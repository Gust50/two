//
//  courceOneCell.m
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "courceOneCell.h"

@interface courceOneCell()
@property(nonatomic,strong)UIImageView *topImageView;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIView *whiteView;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)UILabel *countName;

@property(nonatomic,strong)UILabel *playLabel;
@property(nonatomic,strong)UILabel *playName;

@property(nonatomic,strong)UIImageView *shareImageView;
@property(nonatomic,strong)UILabel *shareLabel;

@property(nonatomic,strong)UIImageView *deskImageView;
@property(nonatomic,strong)UILabel *deskLabel;
@property(nonatomic,strong)UILabel *line;
@end

@implementation courceOneCell
- (UIImageView *)topImageView{
    if (!_topImageView) {
        _topImageView = [UIImageView new];
        _topImageView.image = [UIImage imageNamed:@"屏幕快照 2016-12-08 上午11.45.47"];
    }
    return _topImageView;
}
- (UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [UIView new];
        _whiteView.backgroundColor = RGB(245, 244, 245);
    }
    return _whiteView;
}
- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.image = [UIImage imageNamed:@"屏幕快照 2016-12-08 上午11.45.39"];
    }
    return _leftImageView;
}
- (UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = RGB(193, 192, 197);
    }
    return _line;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.topImageView];
    [self addSubview:self.whiteView];
//    [self.whiteView addSubview:self.countLabel];
//    [self.whiteView addSubview:self.countName];
//    [self.whiteView addSubview:self.playLabel];
//    [self.whiteView addSubview:self.playName];
//    [self.whiteView addSubview:self.shareImageView];
//    [self.whiteView addSubview:self.shareLabel];
//    [self.whiteView addSubview:self.deskImageView];
//    [self.whiteView addSubview:self.deskLabel];
    [self addSubview:self.leftImageView];
    [self addSubview:self.line];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_topImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(weakSelf);
        make.height.equalTo(@212);
    }];
    [_whiteView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf);
        make.top.equalTo(_topImageView.mas_bottom);
    }];
    [_leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.centerY.equalTo(_whiteView.mas_top);
        make.width.height.equalTo(@60);
    }];
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(weakSelf);
        make.height.equalTo(@1);
    }];
}
@end
