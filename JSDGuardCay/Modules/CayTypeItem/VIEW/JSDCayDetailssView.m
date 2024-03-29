//
//  JSDCayDetailsView.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayDetailssView.h"

@interface JSDCayDetailssView ()

@property (weak, nonatomic) IBOutlet UIScrollView *scollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet UIView *cayContentView;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UILabel *cayCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayENLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayNameLabel; //学名
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

@implementation JSDCayDetailssView

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
    self.siyangTitleLabel.text = @"饲养难度:";
    self.guangzhaoTitleLabel.text = @"光照:";
    self.shuiliuTitleLabel.text = @"水流:";
    self.didianTitleLbael.text = @"放置地点:";
    self.yaoqiuTitleLabel.text = @"要求:";
    self.yanseTitleLabel.text = @"颜色:";
    self.xingqingTitleLabel.text = @"性情:";
    self.chandiTitleLabel.text = @"主要产地:";
    self.zhongshuTitlelLabel.text = @"种属:";
    
    self.infoTitleLabel.font = [UIFont jsd_fontSize:20 fontName:@"STHeitiSC-Medium"];
    self.infoTitleLabel.text = @"简介:";
    self.infoTitleLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.infoLabel.numberOfLines = 0;
    
}

- (void)setDetailsModel:(JSDCayTypeDetailsModel *)detailsModel {
    
//    self.cayImageView.image = [UIImage imageNamed:detailsModel.imageName];
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

@end
