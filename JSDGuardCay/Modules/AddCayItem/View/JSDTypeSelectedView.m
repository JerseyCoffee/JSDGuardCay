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
@property (nonatomic, strong) UIButton* tapButton;
@property (nonatomic, strong) NSArray* titleArray;

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
    
    self.typeLabel.text = @"小水螅体硬珊瑚（SPS)";
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(106);
        make.right.mas_equalTo(self.guideImageView.mas_left).mas_equalTo(-10);
    }];
    
    self.tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.tapButton];
    [self.tapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
    }];
    [self.tapButton addTarget:self action:@selector(onTouchTap:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onTouchTap:(UIButton* )sender {
    
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"选择品种" message:@"请选择添加的珊瑚品种类型" preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger i = 0; i < self.titleArray.count + 1; i++) {
        UIAlertAction* action;
        if (i == self.titleArray.count) {
            action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
        } else {
            @weakify(self)
            action = [UIAlertAction actionWithTitle:self.titleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                @strongify(self)
                self.typeLabel.text = action.title;
                self.selectedType = i;
            }];
        }
        [alertVC addAction:action];
    }
    [JSDAppWindow.rootViewController presentViewController:alertVC animated:YES completion:nil];
}

- (NSArray *)titleArray {
    
    if (!_titleArray) {
        _titleArray = @[@"小水螅体硬珊瑚（SPS)",
                        @"大水螅体硬珊瑚（LPS)",
                        @"菇珊瑚",
                        @"软珊瑚",
                        @"水螅珊瑚",
                        @"海扇",
                        ];
    }
    return _titleArray;
}

- (void)setTitle:(NSString* )title number:(NSInteger)number {
    
    self.titleLabel.text = title;
    [self setSelectedType:number];
    
    self.typeLabel.text = self.titleArray[number];
}

@end
