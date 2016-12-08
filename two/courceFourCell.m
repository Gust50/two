//
//  courceFourCell.m
//  two
//
//  Created by kobe on 16/12/8.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "courceFourCell.h"

@interface courceFourCell()
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *introduceLabel;
@property(nonatomic,strong)UIButton *moreBtn;
@end
@implementation courceFourCell
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.text = @"学校介绍";
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}
- (UILabel *)introduceLabel{
    if (!_introduceLabel) {
        _introduceLabel = [UILabel new];
        _introduceLabel.text = @"西安交通大学是国家教育部直属重点大学，为我国最早兴办的高等学府之一，其前身是1896年创建的南洋公学，1921年改称交通大学，1956年国务院决定交通大学内迁西安，1959年定名为西安交通大学，并被列为全";
        _introduceLabel.numberOfLines = 0;
        _introduceLabel.textAlignment = NSTextAlignmentLeft;
        _introduceLabel.textColor = RGB(167, 167, 167);
        _introduceLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _introduceLabel;
}
- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton new];
        [_moreBtn setTitle:@"更多 >" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:RGB(167, 167, 167) forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [_moreBtn addTarget:self action:@selector(moreBtnAC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}
- (void)moreBtnAC{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(moreBtnAC)]) {
        [self.delegate moreBtnAC];
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}
- (void)initUI{
    [self addSubview:self.nameLabel];
    [self addSubview:self.introduceLabel];
    [self addSubview:self.moreBtn];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.top.equalTo(@5);
        make.width.equalTo(@80);
        make.height.equalTo(@20);
    }];
    [_introduceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.top.equalTo(_nameLabel.mas_bottom).offset(5);
        make.right.equalTo(weakSelf.mas_right).offset(-5);
        make.height.equalTo(@80);
    }];
    [_moreBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-11);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-5);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
}

@end
