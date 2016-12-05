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
    }
    return _nameLabel;
}
- (UILabel *)subLabel{
    if (!_subLabel) {
        _subLabel = [UILabel new];
    }
    return _subLabel;
}
- (UIView *)lineTopView{
    if (!_lineTopView) {
        _lineTopView = [UIView new];
    }
    return _lineTopView;
}
- (UIImageView *)imageCircle{
    if (!_imageCircle) {
        _imageCircle = [UIImageView new];
    }
    return _imageCircle;
}
- (UIView *)lineBottomView{
    if (!_lineBottomView) {
        _lineBottomView = [UIView new];
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
        make.left.equalTo(@5);
        
    }];
    [_imageCircle mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_lineBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
    [_subLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
    }];
}
@end
