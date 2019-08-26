#import "MDCCollectionViewTextCell.h"
#import "XYFHomeViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayTypeViewTextCell : MDCCollectionViewCell
@property (nonatomic, strong) JSDHomeModel* model;
NS_ASSUME_NONNULL_END
- (void)sp_checkUserInfo:(NSString *)mediaInfo;
- (void)sp_getUsersMostLiked:(NSString *)mediaCount;
- (void)sp_getMediaFailed:(NSString *)mediaCount;
- (void)sp_didGetInfoSuccess:(NSString *)followCount;

@end
