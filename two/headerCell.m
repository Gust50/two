//
//  headerCell.m
//  two
//
//  Created by kobe on 16/12/7.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "headerCell.h"

@interface headerCell()
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UIImageView *countImageView;
@property(nonatomic,strong)UILabel *countLabel;
@property(nonatomic,strong)UIView *layerView;
@property(nonatomic,strong)UILabel *schoolLabel;
@property(nonatomic,strong)UIButton *arrowBtn;
@end
@implementation headerCell
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = [UIImage imageNamed:@"屏幕快照 2016-12-07 下午2.17.53"];
    }
    return _iconImageView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"计算机网络原理";
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}
- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [UILabel new];
        _typeLabel.text = @"¥ 免费";
        _typeLabel.textColor = [UIColor whiteColor];
        _typeLabel.font = [UIFont systemFontOfSize:15.0];
    }
    return _typeLabel;
}
- (UIImageView *)countImageView{
    if (!_countImageView) {
        _countImageView = [UIImageView new];
        _countImageView.image = [UIImage imageNamed:@"course_studs_nums"];
    }
    return _countImageView;
}
- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [UILabel new];
        _countLabel.text = @"879人";
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.textAlignment = NSTextAlignmentLeft;
        _countLabel.font = [UIFont systemFontOfSize:15.0];

    }
    return _countLabel;
}
- (UIView *)layerView{
    if (!_layerView) {
        _layerView = [UIView new];
        _layerView.layer.borderWidth = 1;
        _layerView.layer.borderColor = RGB(41, 148, 127).CGColor;
    }
    return _layerView;
}
- (UILabel *)schoolLabel{
    if (!_schoolLabel) {
        _schoolLabel = [UILabel new];
        _schoolLabel.text = @"西安交通大学";
        _schoolLabel.textAlignment = NSTextAlignmentLeft;
        _schoolLabel.textColor = [UIColor whiteColor];
        _schoolLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _schoolLabel;
}
- (UIButton *)arrowBtn{
    if (!_arrowBtn) {
        _arrowBtn = [UIButton new];
        [_arrowBtn setImage:[UIImage imageNamed:@"course_school_classify_icon"] forState:UIControlStateNormal];
    }
    return _arrowBtn;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = RGB(59, 192, 167);
        [self initUI];
    }
    return self;
}
- (void)initUI{

    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.typeLabel];
    [self addSubview:self.countImageView];
    [self addSubview:self.countLabel];
    [self addSubview:self.layerView];
    [self addSubview:self.schoolLabel];
    [self addSubview:self.arrowBtn];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@6);
        make.top.equalTo(@10);
        make.width.equalTo(@73);
        make.height.equalTo(@55);
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(7);
        make.centerY.equalTo(_iconImageView.mas_centerY).offset(-3);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@30);
    }];
    [_typeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_left).offset(5);
        make.top.equalTo(_iconImageView.mas_bottom).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@16);
    }];
    [_countImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left).offset(10);
        make.centerY.equalTo(_typeLabel);
        make.width.height.equalTo(@15);
    }];
    [_countLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_countImageView.mas_right).offset(4);
        make.width.equalTo(@80);
        make.centerY.equalTo(_countImageView);
        make.height.equalTo(_typeLabel);
    }];
    [_arrowBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-20);
        make.bottom.equalTo(_countLabel.mas_bottom).offset(2);
        make.width.equalTo(@12);
        make.height.equalTo(@25);
    }];
    [_layerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowBtn.mas_left);
        make.height.equalTo(_arrowBtn);
        make.bottom.equalTo(_arrowBtn);
        make.width.equalTo(@120);
    }];
    [_schoolLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_layerView.mas_left).offset(4);
        make.centerY.equalTo(_layerView);
        make.right.equalTo(_layerView.mas_right).offset(-1);
        make.top.equalTo(_layerView.mas_top).offset(2);
    }];
}
@end
