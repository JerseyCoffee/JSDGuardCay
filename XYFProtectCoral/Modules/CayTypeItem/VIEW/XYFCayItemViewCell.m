#import "XYFCayItemViewCell.h"
@interface XYFCayItemViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@end
@implementation XYFCayItemViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.itemImageView.layer.cornerRadius = 40;
    self.itemImageView.layer.masksToBounds = YES;
    self.itemImageView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.titlelabel.font = [UIFont jsd_fontSize:16];
    self.titlelabel.textColor = [UIColor jsd_mainTextColor];
    self.titlelabel.text = @"鹿角珊瑚（紫色）";
    self.titlelabel.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}
- (void)setModel:(JSDCayTypeDetailsModel *)model {
    if (JSDIsString(model.imageName)) {
        if ([model.imageName containsString:kJSDPhotoImageFiles]) {
            NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
            NSString* imageFile = [NSString stringWithFormat:@"%@/%@", documentsDirectory,model.imageName];
            self.itemImageView.image = [UIImage imageWithContentsOfFile:imageFile];
        } else {
            self.itemImageView.image = [UIImage imageNamed:model.imageName];
        }
    }
    if (JSDIsString(model.cnName)) {
        self.titlelabel.text = model.cnName;
    }
}
@end
