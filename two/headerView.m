//
//  headerView.m
//  two
//
//  Created by kobe on 16/12/7.
//  Copyright © 2016年 Gust50. All rights reserved.
//

#import "headerView.h"

@interface headerView()
@property(nonatomic,strong)UILabel *texLabel;
@property(nonatomic,strong)UIImageView *textImageView;

@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *detailImageView;

@property(nonatomic,strong)UILabel *commentLabel;
@property(nonatomic,strong)UIImageView *commentImageView;
@end
@implementation headerView
- (UILabel *)texLabel{
    if (!_texLabel) {
        _texLabel = [UILabel new];
        _texLabel.text = @"目录";
        _texLabel.textAlignment = NSTextAlignmentCenter;
        _texLabel.textColor = [UIColor whiteColor];
        _texLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _texLabel;
}
- (UIImageView *)textImageView{
    if (!_textImageView) {
        _textImageView = [UIImageView new];
        _textImageView.image = [UIImage imageNamed:@"course_catalog_icon"];
    }
    return _textImageView;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.text = @"详情";
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:13.0];

    }
    return _detailLabel;
}
- (UIImageView *)detailImageView{
    if (!_detailImageView) {
        _detailImageView = [UIImageView new];
        _detailImageView.image = [UIImage imageNamed:@"course_info_icon"];
    }
    return _detailImageView;
}

- (UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [UILabel new];
        _commentLabel.text = @"评价(85)";
        _commentLabel.textAlignment = NSTextAlignmentCenter;
        _commentLabel.textColor = [UIColor whiteColor];
        _commentLabel.font = [UIFont systemFontOfSize:13.0];

    }
    return _commentLabel;
}
- (UIImageView *)commentImageView{
    if (!_commentImageView) {
        _commentImageView = [UIImageView new];
        _commentImageView.image = [UIImage imageNamed:@"course_catalog_icon"];
    }
    return _commentImageView;
}
//- (instancetype)initWithFrame:(CGRect)frame{
//    NSLog(@"头部333");
//    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor blueColor];
//        [self initUI];
//    }
//    return self;
//}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self initUI];
        self.contentView.backgroundColor = RGB(41, 148, 121);
    }
    return self;
}
- (void)initUI{
    NSLog(@"头部22");
    [self addSubview:self.texLabel];
    [self addSubview:self.textImageView];
    
    [self addSubview:self.detailLabel];
    [self addSubview:self.detailImageView];
    
    [self addSubview:self.commentLabel];
    [self addSubview:self.commentImageView];
    [self updateConstraints];
}
- (void)updateConstraints{
    [super updateConstraints];
    WS(weakSelf);
    [_textImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@5);
        make.left.equalTo(@60);
        make.width.height.equalTo(@25);
    }];
    [_texLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textImageView.mas_bottom).offset(2);
        make.centerX.equalTo(_textImageView);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    [_detailImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textImageView);
        make.centerX.equalTo(weakSelf);
        make.width.height.equalTo(@25);
    }];
    [_detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_detailImageView.mas_bottom).offset(2);
        make.centerX.equalTo(_detailImageView);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    [_commentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textImageView);
        make.right.equalTo(@(-40));
        make.width.height.equalTo(@25);
    }];
    [_commentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commentImageView.mas_bottom).offset(2);
        make.centerX.equalTo(_commentImageView);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
}
@end
