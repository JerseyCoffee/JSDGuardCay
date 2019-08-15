//
//  JSDTextFieldView.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDTextFieldView.h"

@interface JSDTextFieldView ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UITextField* textField;

@end

@implementation JSDTextFieldView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _textField = [[UITextField alloc] init];
        [self addSubview:_titleLabel];
        [self addSubview:_textField];
        [self configuration];
    }
    return self;
}

- (void)configuration {
    
    self.titleLabel.font = [UIFont jsd_fontSize:18];
    self.titleLabel.textColor = [UIColor jsd_minorTextColor];
    self.titleLabel.text = @"名称:";
    
    self.textField.font = [UIFont jsd_fontSize:18];
    self.textField.placeholder = @"请输入名称";
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
    }];
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(106);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
}


@end
