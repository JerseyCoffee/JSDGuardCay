//
//  JSDCollectionCell.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCollectionCell.h"

@interface JSDCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UILabel *cayCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayENLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayNameLabel;


@end

@implementation JSDCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.cayImageView.layer.cornerRadius = 37.5;
    self.cayImageView.layer.masksToBounds = YES;
    
    self.cayCNLabel.font = [UIFont jsd_fontSize:20 fontName:@"STHeitiSC-Medium"];
    self.cayCNLabel.textColor = [UIColor jsd_mainTextColor];
    
    self.cayENLabel.font = [UIFont jsd_fontSize:12];
    self.cayENLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.cayNameLabel.font = [UIFont jsd_fontSize:12];
    self.cayNameLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
}

- (void)setModel:(JSDCayTypeDetailsModel *)model {
    
    self.cayImageView.image = [UIImage imageNamed:model.imageName];
    self.cayCNLabel.text = model.cnName;
    self.cayENLabel.text = model.enName;
    self.cayNameLabel.text = model.cnNameTitle;
    
}

@end
