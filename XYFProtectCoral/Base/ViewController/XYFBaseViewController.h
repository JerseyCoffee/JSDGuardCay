#import "CYLBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFBaseViewController : CYLBaseViewController
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLiked:(NSString *)followCount;
- (void)sp_getUserFollowSuccess:(NSString *)string;
- (void)sp_getUserName:(NSString *)mediaInfo;
- (void)sp_checkDefualtSetting:(NSString *)string;
- (void)sp_getUsersMostFollowerSuccess:(NSString *)mediaCount;
- (void)sp_upload:(NSString *)string;
@end
