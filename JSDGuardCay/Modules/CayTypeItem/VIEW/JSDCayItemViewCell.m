//
//  JSDCayItemViewCell.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayItemViewCell.h"

@interface JSDCayItemViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;

@end

@implementation JSDCayItemViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.itemImageView.layer.cornerRadius = 40;
    self.itemImageView.layer.masksToBounds = YES;
//    self.itemImageView.image = [UIImage imageNamed:nil];
    self.itemImageView.backgroundColor = [UIColor jsd_grayColor];
    
    self.titlelabel.font = [UIFont jsd_fontSize:16];
    self.titlelabel.textColor = [UIColor jsd_mainTextColor];
    self.titlelabel.text = @"鹿角珊瑚（紫色）";
    self.titlelabel.textAlignment = NSTextAlignmentCenter;
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
}

- (void)setModel:(JSDCayTypeDetailsModel *)model {
    
    if (JSDIsString(model.imageName)) {
        self.itemImageView.image = [UIImage imageNamed:model.imageName];
    }
    
    if (JSDIsString(model.cnName)) {
        self.titlelabel.text = model.cnName;
    }
}

@end
