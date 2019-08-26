#import "MDCCollectionViewCell.h"
#import "XYFCollectViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectionCell : MDCCollectionViewCell
@property (strong, nonatomic) JSDCayTypeDetailsModel *model;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostFollowerSuccess:(NSString *)mediaCount;
- (void)sp_getLoginState:(NSString *)string;
- (void)sp_getUserFollowSuccess:(NSString *)mediaCount;

- (void)sp_getUserName:(NSString *)string;
- (void)sp_getUsersMostLiked:(NSString *)isLogin;
@end
