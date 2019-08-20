#import "XYFTypeSelectedView.h"
@interface XYFTypeSelectedView ()
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* guideImageView;
@property (nonatomic, strong) UILabel* typeLabel;
@property (nonatomic, strong) UIButton* tapButton;
@property (nonatomic, strong) NSArray* titleArray;
@end
@implementation XYFTypeSelectedView
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
        make.left.mas_equalTo(135);
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
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Variedad de selección" message:@"Por favor seleccione el tipo de especies de coral agregadas" preferredStyle:UIAlertControllerStyleActionSheet];
    for (NSInteger i = 0; i < self.titleArray.count + 1; i++) {
        UIAlertAction* action;
        if (i == self.titleArray.count) {
            action = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
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
        _titleArray = @[@"Pequeño coral duro",
                        @"Coral duro grande",
                        @"Coral de setas",
                        @"Coral blando",
                        @"Nutria coral",
                        @"Abanico de mar",
                        ];
    }
    return _titleArray;
}
- (void)setTitle:(NSString* )title number:(NSInteger)number {
    self.titleLabel.text = title;
    [self setSelectedType:number];
    self.typeLabel.text = self.titleArray[number];
}

- (void)sp_didGetInfoSuccess {
    NSLog(@"Get Info Failed");
}
@end
