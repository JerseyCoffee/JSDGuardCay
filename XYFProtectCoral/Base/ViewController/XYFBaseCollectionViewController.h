#import "MDCCollectionViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFBaseCollectionViewController : MDCCollectionViewController
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLiked;
- (void)sp_checkInfo;
- (void)sp_didGetInfoSuccess;
- (void)sp_checkUserInfo;
- (void)sp_getUsersMostFollowerSuccess;
@end
