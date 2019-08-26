#import "XYFBaseViewController.h"
#import "XYFMyCenterViewModel.h"
#import "XYFPhotoManage.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFMyResource : XYFBaseViewController
@property (strong, nonatomic) JSDUserModel *model;
NS_ASSUME_NONNULL_END
- (void)sp_checkDefualtSetting;
- (void)sp_getUserFollowSuccess;
- (void)sp_getUsersMostLiked;
- (void)sp_getLoginState;
- (void)sp_checkInfo;

@end
