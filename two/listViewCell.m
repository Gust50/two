//
//  listViewCell.m
//  two
//
//  Created by kobe on 16/12/2.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "listViewCell.h"

@interface listViewCell()
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *timeIcon;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *subIcon;
@property(nonatomic,strong)UILabel *sublabel;
@end

@implementation listViewCell
- (UIImageView *)iconView{
    if (!_iconView) {
        _iconView = [UIImageView new];
        _iconView.image = [UIImage imageNamed:@"bottom_tab3_pre"];
    }
    return _iconView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"计算机网络原理";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.backgroundColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}
- (UIImageView *)timeIcon{
    if (!_timeIcon) {
        _timeIcon = [UIImageView new];
        _timeIcon.image = [UIImage imageNamed:@"course_class_nums_icon"];
    }
    return _timeIcon;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = @"11课时";
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = [UIColor colorWithRed:185/255.0 green:185/255.0 blue:185/255.0 alpha:1.0];
        //        _sublabel.backgroundColor = [UIColor whiteColor];
        _timeLabel.font = [UIFont systemFontOfSize:14];
    }
    return _timeLabel;
}
- (UIImageView *)subIcon{
    if (!_subIcon) {
        _subIcon = [UIImageView new];
        _subIcon.image = [UIImage imageNamed:@"course_studs_nums_green"];
    }
    return _subIcon;
}
- (UILabel *)sublabel{
    if (!_sublabel) {
        _sublabel = [UILabel new];
        _sublabel.text = @"筑梦学院";
        _sublabel.textAlignment = NSTextAlignmentLeft;
        _sublabel.textColor = [UIColor colorWithRed:185/255.0 green:185/255.0 blue:185/255.0 alpha:1.0];
        //        _sublabel.backgroundColor = [UIColor whiteColor];
        _sublabel.font = [UIFont systemFontOfSize:14];
    }
    return _sublabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    
    [self addSubview:self.iconView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.timeIcon];
    [self addSubview:self.timeLabel];
    [self addSubview:self.subIcon];
    [self addSubview:self.sublabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(10);
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@66);
        make.width.equalTo(@80);
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(10);
        make.right.equalTo(weakSelf);
        make.top.equalTo(_iconView.mas_top).offset(-1);
        make.height.equalTo(@20);
    }];
    [_timeIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.centerY.equalTo(weakSelf);
        make.width.height.equalTo(@15);
    }];
    [_timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeIcon.mas_right).offset(10);
        make.centerY.equalTo(_timeIcon);
        make.right.equalTo(weakSelf);
        make.height.equalTo(_timeIcon);
    }];
    [_subIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.bottom.equalTo(_iconView);
        make.width.height.equalTo(@15);
    }];
    [_sublabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLabel);
        make.right.equalTo(weakSelf);
        make.centerY.equalTo(_subIcon);
        make.height.equalTo(_subIcon);
    }];
}

- (void)setModel:(courceModel *)model{
    NSLog(@"%@%@%@%@",model.CourseName,model.ClassNumber,model.SchoolName,model.PhotoURL);
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.PhotoURL]];_nameLabel.text = model.CourseName;
    _timeLabel.text = [NSString stringWithFormat:@"%@课时",model.ClassNumber];
    _sublabel.text = model.SchoolName;
}

@end
