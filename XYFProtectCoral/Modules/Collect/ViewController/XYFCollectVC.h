#import "XYFBaseCollectionViewController.h"
extern NSString* const kCollectionNotification;
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectVC : XYFBaseCollectionViewController
NS_ASSUME_NONNULL_END
- (void)sp_getMediaFailed;
- (void)sp_didGetInfoSuccess;
- (void)sp_getUsersMostLikedSuccess;
- (void)sp_getUserName;
- (void)sp_checkUserInfo;
- (void)sp_checkInfo;
@end
