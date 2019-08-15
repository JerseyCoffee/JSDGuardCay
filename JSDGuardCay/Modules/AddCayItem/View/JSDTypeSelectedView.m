//
//  JSDTypeSelectedView.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDTypeSelectedView.h"

@interface JSDTypeSelectedView ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* guideImageView;
@property (nonatomic, strong) UILabel* typeLabel;

@end

@implementation JSDTypeSelectedView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        _typeLabel = [[UILabel alloc] init];
        [self addSubview:_guideImageView];
        [self addSubview:self.typeLabel];
        [self addSubview:_titleLabel];
        [self configuration];
    }
    return self;
}

- (void)configuration {
    
    self.titleLabel.font = [UIFont jsd_fontSize:18];
    self.titleLabel.textColor = [UIColor jsd_minorTextColor];
    self.titleLabel.text = @"品种";
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
    }];
    [self.guideImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(14);
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(106);
        make.right.mas_equalTo(self.guideImageView.mas_left).mas_equalTo(-10);
    }];
    
}

@end
