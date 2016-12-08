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
//@property(nonatomic,strong)UILabel *shareLabel;

@property(nonatomic,strong)UIImageView *deskImageView;
//@property(nonatomic,strong)UILabel *deskLabel;
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
- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [UILabel new];
        _countLabel.text = @"50";
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.font = [UIFont systemFontOfSize:13.0];
        _countLabel.textColor = RGB(171, 171, 171);
    }
    return _countLabel;
}
- (UILabel *)countName{
    if (!_countName) {
        _countName = [UILabel new];
        _countName.text = @"课程";
        _countName.font = [UIFont systemFontOfSize:11.0];
        _countName.textAlignment = NSTextAlignmentCenter;
        _countName.textColor = RGB(171, 171, 171);
    }
    return _countName;
}
- (UILabel *)playLabel{
    if (!_playLabel) {
        _playLabel = [UILabel new];
        _playLabel.text = @"0";
        _playLabel.textAlignment = NSTextAlignmentCenter;
        _playLabel.font = [UIFont systemFontOfSize:13.0];
        _playLabel.textColor = RGB(171, 171, 171);
    }
    return _playLabel;
}
- (UILabel *)playName{
    if (!_playName) {
        _playName = [UILabel new];
        _playName.text = @"直播";
        _playName.textAlignment = NSTextAlignmentCenter;
        _playName.font = [UIFont systemFontOfSize:11.0];
        _playName.textColor = RGB(171, 171, 171);
    }
    return _playName;
}
- (UIImageView *)shareImageView{
    if (!_shareImageView) {
        _shareImageView = [UIImageView new];
        _shareImageView.image = [UIImage imageNamed:@"bg_school_share_unpre"];
    }
    return _shareImageView;
}
//- (UILabel *)shareLabel{
//    if (!_shareLabel) {
//        _shareLabel = [UILabel new];
//        _shareLabel.text = @"分享";
//        _shareLabel.textAlignment = NSTextAlignmentCenter;
//        _shareLabel.font = [UIFont systemFontOfSize:12.0];
//        _shareLabel.textColor = RGB(171, 171, 171);
//    }
//    return _shareLabel;
//}
- (UIImageView *)deskImageView{
    if (!_deskImageView) {
        _deskImageView = [UIImageView new];
        _deskImageView.image = [UIImage imageNamed:@"bg_icon_to_launcher_unpre"];
    }
    return _deskImageView;
}
//- (UILabel *)deskLabel{
//    if (!_deskLabel) {
//        _deskLabel = [UILabel new];
//        _deskLabel.text = @"桌面";
//        _deskLabel.textAlignment = NSTextAlignmentCenter;
//        _deskLabel.font = [UIFont systemFontOfSize:12.0];
//        _deskLabel.textColor = RGB(171, 171, 171);
//    }
//    return _deskLabel;
//}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.topImageView];
    [self addSubview:self.whiteView];
    [self.whiteView addSubview:self.countLabel];
    [self.whiteView addSubview:self.countName];
    [self.whiteView addSubview:self.playLabel];
    [self.whiteView addSubview:self.playName];
    [self.whiteView addSubview:self.shareImageView];
//    [self.whiteView addSubview:self.shareLabel];
    [self.whiteView addSubview:self.deskImageView];
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
    [_countLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImageView.mas_right).offset(30);
        make.top.equalTo(_topImageView.mas_bottom).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@13);
    }];
    [_countName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_countLabel);
        make.width.equalTo(@40);
        make.height.equalTo(@25);
        make.top.equalTo(_countLabel.mas_bottom).offset(0);
    }];
    
    [_playLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_countName.mas_centerX).offset(80);
        make.top.equalTo(_countLabel.mas_top).offset(0);
        make.width.equalTo(@30);
        make.height.equalTo(@13);
    }];
    [_playName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_playLabel);
        make.width.equalTo(@40);
        make.height.equalTo(@25);
        make.top.equalTo(_countName.mas_top).offset(0);
    }];
    
    [_shareImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_playLabel.mas_centerX).offset(80);
        make.top.equalTo(_countLabel.mas_top).offset(-8);
        make.width.equalTo(@35);
        make.height.equalTo(@45);
    }];
//    [_shareLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(_shareImageView);
//        make.width.equalTo(@40);
//        make.height.equalTo(@25);
//        make.top.equalTo(_playName.mas_top).offset(0);
//    }];
    
    
    [_deskImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_shareImageView.mas_centerX).offset(80);
        make.top.equalTo(_shareImageView.mas_top).offset(0);
        make.width.equalTo(@70);
        make.height.equalTo(@45);
    }];
//    [_deskLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(_deskImageView);
//        make.width.equalTo(@110);
//        make.height.equalTo(@25);
//        make.top.equalTo(_shareLabel.mas_top).offset(0);
//    }];
    
}
@end
