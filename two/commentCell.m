//
//  commentCell.m
//  two
//
//  Created by kobe on 16/12/9.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "commentCell.h"

@interface commentCell(){
    NSString *_CreateTimeDate;
}
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *secondLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *lineLabel;
@end

@implementation commentCell
-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 30;
        _iconImageView.image = [UIImage imageNamed:@"lesson_default"];
    }
    return _iconImageView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"昵称";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = RGB(64, 192, 164);
        _nameLabel.font = [UIFont systemFontOfSize:14.0];
    }
    return _nameLabel;
}
- (UILabel *)secondLabel{
    if (!_secondLabel) {
        _secondLabel = [UILabel new];
        _secondLabel.text = @"卡得死啊啊啊啊啊啊啊啊啊";
        _secondLabel.textAlignment = NSTextAlignmentLeft;
        _secondLabel.textColor = RGB(161, 161, 161);
        _secondLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _secondLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.text = @"发布时间：2016-11-25 12：11";
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = RGB(161, 161, 161);
        _timeLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _timeLabel;
}
- (UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [UILabel new];
        _lineLabel.backgroundColor = RGB(161, 161, 161);
        _lineLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _lineLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.iconImageView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.secondLabel];
    [self addSubview:self.timeLabel];
    [self addSubview:self.lineLabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(@10);
        make.width.height.equalTo(@60);
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconImageView);
        make.left.equalTo(_iconImageView.mas_right).offset(10);
        make.width.equalTo(@60);
        make.height.equalTo(@15);
    }];
    [_secondLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.centerY.equalTo(_iconImageView);
        make.height.equalTo(@15);
        make.right.equalTo(weakSelf);
    }];
    [_timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@15);
        make.bottom.equalTo(_iconImageView);
    }];
    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_left);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@1);
        make.bottom.equalTo(weakSelf).offset(-1);
    }];
}
- (void)setModel:(commentModel *)model{
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.Avatar]];
    if ([model.NickName isEqualToString:@""]) {
        _nameLabel.text = @"匿名";
    }else{
        _nameLabel.text = model.NickName;
    }
    _secondLabel.text = model.VoteText;
    [self createTime:model.CreateTime];
    _timeLabel.text = [NSString stringWithFormat:@"发布时间:%@",_CreateTimeDate];
}
- (NSString *)createTime:(NSString *)createTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[createTime integerValue]];
   
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    _CreateTimeDate = confromTimespStr;
    return _CreateTimeDate;
}
@end
