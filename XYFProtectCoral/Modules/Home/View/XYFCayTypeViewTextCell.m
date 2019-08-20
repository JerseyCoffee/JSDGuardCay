#import "XYFCayTypeViewTextCell.h"
@interface XYFCayTypeViewTextCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@end
@implementation XYFCayTypeViewTextCell
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
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}
- (void)setModel:(JSDHomeModel *)model {
    self.titleLabel.text = model.title;
    self.cayImageView.image = [UIImage imageNamed:model.imageName];
}
- (void)sp_checkUserInfo:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}
@end
