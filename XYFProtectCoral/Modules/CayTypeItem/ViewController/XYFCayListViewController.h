#import "XYFBaseCollectionViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayListViewController : XYFBaseCollectionViewController
@property (nonatomic, assign) NSInteger typeIndex;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLikedSuccess;
- (void)sp_checkInfo;
- (void)sp_getUsersMostFollowerSuccess;
- (void)sp_checkUserInfo;

- (void)sp_didGetInfoSuccess;
@end
