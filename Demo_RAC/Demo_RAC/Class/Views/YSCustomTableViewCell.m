//
//  YSCustomTableViewCell.m
//  Demo_RAC
//
//  Created by fdiostwo on 2017/4/26.
//  Copyright © 2017年 FengDingKeJi. All rights reserved.
//

#import "YSCustomTableViewCell.h"

@interface YSCustomTableViewCell ()

@property (nonatomic, strong)UILabel *titleLabel;

@property (nonatomic, strong)UILabel *typeLabel;

@property (nonatomic, strong)UIImageView *bgImageView;

@property (nonatomic, strong)UILabel *timeLabel;

@end

@implementation YSCustomTableViewCell

- (void)ys_initUI{
    
    self.contentView.backgroundColor = [UIColor blackColor];
    
    _bgImageView = [UIImageView new];
    _bgImageView.alpha = 1;
    [self.contentView addSubview:_bgImageView];
    
    _titleLabel = [UILabel new];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_titleLabel];
    
    _typeLabel = [UILabel new];
    [self.contentView addSubview:_typeLabel];
    
    _timeLabel = [UILabel new];
    [self.contentView addSubview:_timeLabel];
    
    
}

- (void)ys_setupFrame{
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(25);
        make.height.mas_equalTo(8);
    }];
    
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.bottom.mas_equalTo(-10);
    }];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(25);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.height.mas_equalTo(8);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-25);
        make.height.mas_equalTo(8);
        make.bottom.mas_equalTo(-25);
    }];
    
}

- (void)setModel:(BookModel *)model{
    
    _model = model;
    
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
    
    _titleLabel.text = model.title;
    
    _timeLabel.text = model.bytime;
    
    _typeLabel.text = model.catalog;
    
}



@end
