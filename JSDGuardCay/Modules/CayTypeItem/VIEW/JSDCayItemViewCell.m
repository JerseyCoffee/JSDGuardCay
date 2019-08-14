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
    self.itemImageView.image = [UIImage imageNamed:nil];
    
    self.titlelabel.font = [UIFont jsd_fontSize:16];
    self.titlelabel.textColor = [UIColor jsd_mainTextColor];
    self.titlelabel.text = @"鹿角珊瑚（紫色）";
    
    self.contentView.layer.cornerRadius = 10;
    self.contentView.layer.masksToBounds = YES;
    
}

@end
