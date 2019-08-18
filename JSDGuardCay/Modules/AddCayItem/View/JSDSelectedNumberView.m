//
//  JSDSelectedNumberView.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDSelectedNumberView.h"

@interface JSDSelectedNumberView ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) NSArray<UIButton *>* btnS;

@end

@implementation JSDSelectedNumberView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
//        _guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
//        _typeLabel = [[UILabel alloc] init];
//        [self addSubview:_guideImageView];
//        [self addSubview:self.typeLabel];
        [self addSubview:_titleLabel];
        _subtitleLabel = [[UILabel alloc] init];
        [self addSubview:_subtitleLabel];
        
        [self configuration];
        [self setNumber:0];
    }
    return self;
}

- (void)configuration {
    
    self.titleLabel.font = [UIFont jsd_fontSize:18];
    self.titleLabel.textColor = [UIColor jsd_minorTextColor];
    self.titleLabel.text = @"Dificultad creciente";
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.centerY.mas_equalTo(0);
    }];
    
    self.subtitleLabel.font = [UIFont jsd_fontSize:18];
    self.subtitleLabel.textColor = [UIColor jsd_mainTextColor];
    self.subtitleLabel.text = @"Débil";

    
    NSMutableArray* tempBtns = [NSMutableArray new];
    UIButton* lastBtn;
    for (NSInteger i = 0; i < 5; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"start_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"start_selected"] forState:UIControlStateSelected];
        btn.tag = i;
        [btn addTarget:self action:@selector(onTouchSelectedCollect:) forControlEvents:UIControlEventTouchUpInside];
        [tempBtns addObject:btn];
        [self addSubview:btn];
        
        if (lastBtn) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(lastBtn.mas_right).mas_equalTo(10);
                make.centerY.mas_equalTo(0);
                make.height.with.mas_equalTo(18);
            }];
        } else {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(165);
                make.centerY.mas_equalTo(0);
                make.height.with.mas_equalTo(18);
            }];
        }
        lastBtn = btn;
    }
    
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lastBtn.mas_right).mas_equalTo(25);
        make.centerY.mas_equalTo(0);
    }];
    self.btnS = tempBtns;
}

- (void)onTouchSelectedCollect:(UIButton* )sender {
    
    [self setNumber:sender.tag + 1];
    for (NSInteger i = 0; i < self.btnS.count; i++) {
        UIButton* btn = self.btnS[i];
        if (i <= sender.tag) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
}

- (void)setNumber:(NSInteger)number {
    
    _number = number;
    if (_number <= 2) {
        self.subtitleLabel.text = @"Débil";
    } else if (_number <= 4) {
        self.subtitleLabel.text = @"Medio";
    } else {
        self.subtitleLabel.text = @"Fuerte";
    }
    for (NSInteger i = 0; i < self.btnS.count; i++) {
        UIButton* btn = self.btnS[i];
        if (i <= number) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
}

- (void)setTitle:(NSString* )title number:(NSInteger)number {
    
    self.titleLabel.text = title;
    [self setNumber:number];
    
}

@end
