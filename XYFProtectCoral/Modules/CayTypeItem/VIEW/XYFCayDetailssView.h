#import <UIKit/UIKit.h>
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayDetailssView : UIView
@property (nonatomic, strong) JSDCayTypeDetailsModel* detailsModel;
- (void)sp_getUsersMostLiked:(NSString *)followCount;

- (void)sp_checkInfo:(NSString *)followCount;
- (void)sp_getUsersMostLikedSuccess:(NSString *)mediaCount;
- (void)sp_didUserInfoFailed:(NSString *)followCount;
- (void)sp_getUsersMostFollowerSuccess:(NSString *)mediaInfo;
NS_ASSUME_NONNULL_END

@end
