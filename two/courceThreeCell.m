//
//  courceThreeCell.m
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "courceThreeCell.h"

@interface courceThreeCell()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *schoolName;
@property(nonatomic,strong)UILabel *introduceLabel;
@end
@implementation courceThreeCell
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"学校老师";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}
- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = [UIImage imageNamed:@"屏幕快照 2016-12-08 上午11.45.20"];
    }
    return _iconImageView;
}
- (UILabel *)schoolName{
    if (!_schoolName) {
        _schoolName = [UILabel new];
        _schoolName.text = @"西安交通大学";
        _schoolName.font = [UIFont systemFontOfSize:16.0];
        _schoolName.textColor = RGB(64, 193, 169);
        _schoolName.textAlignment = NSTextAlignmentLeft;
    }
    return _schoolName;
}
- (UILabel *)introduceLabel{
    if (!_introduceLabel) {
        _introduceLabel = [UILabel new];
        _introduceLabel.text = @"西安交通大学是国家教育部直属重点大学，为我国最早";
        _introduceLabel.font = [UIFont systemFontOfSize:14.0];
        _introduceLabel.textColor = RGB(166, 166, 166);
        _introduceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _introduceLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }return self;
}
- (void)initUI{
    [self addSubview:self.nameLabel];
    [self addSubview:self.iconImageView];
    [self addSubview:self.schoolName];
    [self addSubview:self.introduceLabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@10);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.top.equalTo(_nameLabel.mas_bottom).offset(25);
        make.width.height.equalTo(@50);
    }];
    [_schoolName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.top.equalTo(_iconImageView.mas_top);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@15);
    }];
    [_introduceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_iconImageView.mas_bottom).offset(-5);
        make.right.equalTo(weakSelf.mas_right).offset(-5);
        make.left.equalTo(_schoolName.mas_left);
        make.height.equalTo(@15);
    }];
}

@end
