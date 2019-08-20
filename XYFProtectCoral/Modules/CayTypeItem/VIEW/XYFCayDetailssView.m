#import "XYFCayDetailssView.h"
@interface XYFCayDetailssView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet UIView *cayContentView;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UILabel *cayCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayENLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayNameLabel; 
@property (weak, nonatomic) IBOutlet UILabel *imageLine;
@property (weak, nonatomic) IBOutlet UILabel *siyangTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *siyangLabel;
@property (weak, nonatomic) IBOutlet UILabel *guangzhaoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *guangzhaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *shuiliuTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *shuiliuLabel;
@property (weak, nonatomic) IBOutlet UILabel *didianTitleLbael;
@property (weak, nonatomic) IBOutlet UILabel *didianLabel;
@property (weak, nonatomic) IBOutlet UILabel *yaoqiuTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yaoqiuLabel;
@property (weak, nonatomic) IBOutlet UILabel *yanseTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yanseLabel;
@property (weak, nonatomic) IBOutlet UILabel *xingqingTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *xingqingLabel;
@property (weak, nonatomic) IBOutlet UILabel *chandiTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *chandiLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhongshuTitlelLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhongshuLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end
@implementation XYFCayDetailssView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.scrollContentView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.scrollContentView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.cayContentView.backgroundColor = [UIColor whiteColor];
    self.cayContentView.layer.cornerRadius = 10;
    self.cayContentView.layer.masksToBounds = YES;
    self.cayImageView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.cayCNLabel.textColor = [UIColor jsd_mainTextColor];
    self.cayCNLabel.font = [UIFont jsd_fontSize:20 fontName:@"STHeitiSC-Medium"];
    self.cayCNLabel.numberOfLines = 2;
    self.cayENLabel.textColor = [UIColor jsd_detailTextColor];
    self.cayENLabel.font = [UIFont jsd_fontSize:12];
    self.cayNameLabel.textColor = [UIColor jsd_detailTextColor];
    self.cayNameLabel.font = [UIFont jsd_fontSize:12];
    self.cayImageView.layer.cornerRadius = 37.5;
    self.cayImageView.layer.masksToBounds = YES;
    self.imageLine.text = nil;
    self.imageLine.backgroundColor = [UIColor jsd_maiBackgroundColor];
    NSArray* titleLabels = @[self.siyangLabel, self.siyangTitleLabel, self.guangzhaoLabel, self.guangzhaoTitleLabel, self.shuiliuLabel, self.shuiliuTitleLabel, self.didianLabel, self.didianTitleLbael, self.yaoqiuLabel, self.yaoqiuTitleLabel, self.yanseLabel, self.yanseTitleLabel, self.xingqingLabel, self
                             .xingqingTitleLabel, self.chandiLabel, self.chandiTitleLabel, self.zhongshuLabel, self.zhongshuTitlelLabel,];
    for (UILabel* label in titleLabels) {
        label.font = [UIFont jsd_fontSize:14];
        label.textColor = [UIColor jsd_mainTextColor];
    }
    self.siyangTitleLabel.text = @"Dificultad creciente:";
    self.guangzhaoTitleLabel.text = @"Iluminación:";
    self.shuiliuTitleLabel.text = @"Flujo de agua:";
    self.didianTitleLbael.text = @"Lugar de colocación:";
    self.yaoqiuTitleLabel.text = @"Solicitud:";
    self.yanseTitleLabel.text = @"Color:";
    self.xingqingTitleLabel.text = @"Temperamento:";
    self.chandiTitleLabel.text = @"Área de producción principal:";
    self.zhongshuTitlelLabel.text = @"Especie:";
    self.infoTitleLabel.font = [UIFont jsd_fontSize:20 fontName:@"STHeitiSC-Medium"];
    self.infoTitleLabel.text = @"Introduccion:";
    self.infoTitleLabel.textColor = [UIColor jsd_mainTextColor];
    self.infoLabel.numberOfLines = 0;
}
- (void)setDetailsModel:(JSDCayTypeDetailsModel *)detailsModel {
    if (JSDIsString(detailsModel.imageName)) {
        if ([detailsModel.imageName containsString:kJSDPhotoImageFiles]) {
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            NSString* imageFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory,detailsModel.imageName];
            self.cayImageView.image = [UIImage imageWithContentsOfFile:imageFile];
        } else {
            self.cayImageView.image = [UIImage imageNamed:detailsModel.imageName];
        }
    }
    self.cayCNLabel.text = detailsModel.cnName;
    self.cayNameLabel.text = detailsModel.cnNameTitle;
    self.cayENLabel.text = detailsModel.enName;
    self.siyangLabel.text = detailsModel.siyang;
    self.guangzhaoLabel.text = detailsModel.guangzhao;
    self.shuiliuLabel.text = detailsModel.shuiliu;
    self.didianLabel.text = detailsModel.didian;
    self.yaoqiuLabel.text = detailsModel.yaoqiu;
    self.yanseLabel.text = detailsModel.yanse;
    self.xingqingLabel.text = detailsModel.xingqing;
    self.chandiLabel.text = detailsModel.chandi;
    self.zhongshuLabel.text = detailsModel.zhongshu;
    NSString* info = detailsModel.info;
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineSpacing = 6.5;
    NSMutableAttributedString* attr = [[NSMutableAttributedString alloc] initWithString:info attributes:@{NSFontAttributeName: [UIFont jsd_fontSize:14], NSForegroundColorAttributeName: [UIColor jsd_mainTextColor], NSParagraphStyleAttributeName: paragraphStyle
                                                                                                          }];
    self.infoLabel.attributedText = attr;
}

- (void)sp_getUsersMostLiked:(NSString *)followCount {
    NSLog(@"Continue");
}
@end
