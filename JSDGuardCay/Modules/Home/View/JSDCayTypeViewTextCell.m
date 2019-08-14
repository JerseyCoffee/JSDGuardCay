//
//  JSDCayTypeViewTextCell.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayTypeViewTextCell.h"

@interface JSDCayTypeViewTextCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;


@end

@implementation JSDCayTypeViewTextCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont jsd_fontSize:28 fontName:@"STHeitiSC-Medium"];
    self.titleLabel.text = @"小水螅体硬珊瑚（SPS）";
    
    self.cayImageView.image = [UIImage imageNamed:@"home_cay1"];
    self.cayImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.cayImageView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES;
}

@end
