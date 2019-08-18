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
    self.titleLabel.text = @"Nombre:";
    
    self.textField.font = [UIFont jsd_fontSize:18];
    self.textField.placeholder = @"Por favor ingrese un nombre";
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(80);
    }];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(106);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
    self.textField.adjustsFontSizeToFitWidth = YES;
}

- (void)setTitle:(NSString *)title tipText:(NSString *)tipText {
    
    self.titleLabel.text = title;
    self.textField.placeholder = tipText;
    self.textField.text = nil;
}

@end
