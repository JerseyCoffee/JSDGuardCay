#import "XYFBaseCollectionViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFHomeViewController : XYFBaseCollectionViewController
NS_ASSUME_NONNULL_END
- (void)sp_checkInfo;
- (void)sp_getUsersMostFollowerSuccess;
- (void)sp_didUserInfoFailed;
- (void)sp_upload;

- (void)sp_checkNetWorking;
@end
