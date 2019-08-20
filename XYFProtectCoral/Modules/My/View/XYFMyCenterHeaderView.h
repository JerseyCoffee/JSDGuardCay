#import <UIKit/UIKit.h>
#import "XYFMyCenterViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFMyCenterHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *tapButton;
@property (strong, nonatomic) JSDUserModel *model;

NS_ASSUME_NONNULL_END
- (void)sp_didGetInfoSuccess;
@end
