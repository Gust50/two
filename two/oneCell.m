//
//  oneCell.m
//  one
//
//  Created by kobe on 16/11/18.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "oneCell.h"

@interface oneCell()
@property(nonatomic,strong)UIImageView *iconView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *sublabel;
@end

@implementation oneCell
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
        _nameLabel.font = [UIFont systemFontOfSize:18];
    }
    return _nameLabel;
}
- (UILabel *)sublabel{
    if (!_sublabel) {
        _sublabel = [UILabel new];
        _sublabel.text = @"西安交大网络公开课";
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
    [self addSubview:self.sublabel];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(10);
        make.centerY.equalTo(weakSelf);
        make.height.equalTo(@52);
        make.width.equalTo(@80);
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(10);
        make.right.equalTo(weakSelf);
        make.top.equalTo(_iconView.mas_top).offset(2);
        make.height.equalTo(@20);
    }];
    [_sublabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel);
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(_iconView.mas_bottom).offset(-5);
        make.height.equalTo(@15);
    }];
}

- (void)setModel:(listModel *)model{
    NSLog(@"%@%@%@",model.CourseName,model.Brief,model.PhotoURL);
    _nameLabel.text = model.CourseName;
    _sublabel.text = model.Brief;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.PhotoURL]];
}
@end
