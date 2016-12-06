//
//  firstDetailCell.m
//  two
//
//  Created by kobe on 16/12/5.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "firstDetailCell.h"

@interface firstDetailCell()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *subLabel;
@property(nonatomic,strong)UIView *lineTopView;
@property(nonatomic,strong)UIImageView *imageCircle;
@property(nonatomic,strong)UIView *lineBottomView;
@end
@implementation firstDetailCell
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"第一节：Excel商务图表的构成与配色";
        _nameLabel.textColor = RGB(19, 19, 19);
        _nameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _nameLabel;
}
- (UILabel *)subLabel{
    if (!_subLabel) {
        _subLabel = [UILabel new];
        _subLabel.text = @"课程时长：19分钟";
        _subLabel.textColor = RGB(159, 159, 159);
        _subLabel.font = [UIFont systemFontOfSize:13];
    }
    return _subLabel;
}
- (UIView *)lineTopView{
    if (!_lineTopView) {
        _lineTopView = [UIView new];
        _lineTopView.backgroundColor = RGB(62, 193, 168);
    }
    return _lineTopView;
}
- (UIImageView *)imageCircle{
    if (!_imageCircle) {
        _imageCircle = [UIImageView new];
        _imageCircle.image = [UIImage imageNamed:@"test_status_not"];
    }
    return _imageCircle;
}
- (UIView *)lineBottomView{
    if (!_lineBottomView) {
        _lineBottomView = [UIView new];
        _lineBottomView.backgroundColor = RGB(62, 193, 168);
    }
    return _lineBottomView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.lineTopView];
    [self addSubview:self.imageCircle];
    [self addSubview:self.lineBottomView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.subLabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_lineTopView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(weakSelf);
        make.width.equalTo(@1);
        make.bottom.equalTo(weakSelf.mas_centerY).offset(-15);
    }];
    [_imageCircle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_lineTopView.mas_centerX);
        make.top.equalTo(_lineTopView.mas_bottom).offset(-3);
        make.width.height.equalTo(@20);
    }];
    [_lineBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageCircle.mas_bottom).offset(-3);
        make.bottom.equalTo(weakSelf);
        make.width.equalTo(_lineTopView);
        make.centerX.equalTo(_lineTopView);
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineTopView.mas_right).offset(20);
        make.top.equalTo(weakSelf.mas_top).offset(10);
        make.right.equalTo(weakSelf);
        make.height.equalTo(@10);
    }];
    [_subLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(10);
        make.right.equalTo(weakSelf);
        make.left.equalTo(_nameLabel);
        make.height.equalTo(@10);
    }];
}
- (void)setModel:(classListModel *)model{
    _nameLabel.text = [NSString stringWithFormat:@"第%@节:%@",model.ClassIndex,model.ClassName];
    _subLabel.text = [NSString stringWithFormat:@"课程时长:%ld分钟",[model.VideoTimeLength integerValue]/60];
}
@end
