#import <UIKit/UIKit.h>
#import "XYFMyCenterViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFMyCenterHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIButton *tapButton;
@property (strong, nonatomic) JSDUserModel *model;
NS_ASSUME_NONNULL_END
- (void)sp_didGetInfoSuccess;
- (void)sp_checkNetWorking;
- (void)sp_checkInfo;
- (void)sp_checkUserInfo;
- (void)sp_checkDefualtSetting;
@end
