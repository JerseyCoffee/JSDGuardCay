#import <UIKit/UIKit.h>
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayDetailssView : UIView
@property (nonatomic, strong) JSDCayTypeDetailsModel* detailsModel;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLiked:(NSString *)followCount;
@end
