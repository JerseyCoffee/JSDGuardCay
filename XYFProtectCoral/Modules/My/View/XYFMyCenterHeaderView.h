#import <UIKit/UIKit.h>
#import "XYFMyCenterViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFMyCenterHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *tapButton;
@property (strong, nonatomic) JSDUserModel *model;
@end
NS_ASSUME_NONNULL_END
