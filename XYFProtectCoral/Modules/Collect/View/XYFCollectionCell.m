#import "XYFCollectionCell.h"
@interface XYFCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UILabel *cayCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayENLabel;
@property (weak, nonatomic) IBOutlet UILabel *cayNameLabel;
@end
@implementation XYFCollectionCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.cayImageView.layer.cornerRadius = 37.5;
    self.cayImageView.layer.masksToBounds = YES;
    self.cayImageView.backgroundColor = [UIColor jsd_maiBackgroundColor];
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
    if (JSDIsString(model.imageName)) {
        if ([model.imageName containsString:kJSDPhotoImageFiles]) {
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            NSString* imageFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory,model.imageName];
            self.cayImageView.image = [UIImage imageWithContentsOfFile:imageFile];
        } else {
            self.cayImageView.image = [UIImage imageNamed:model.imageName];
        }
    }
    self.cayCNLabel.text = model.cnName;
    self.cayENLabel.text = model.enName;
    self.cayNameLabel.text = model.cnNameTitle;
}
@end
