#import "MDCCollectionViewCell.h"
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayItemViewCell : MDCCollectionViewCell
@property (nonatomic, strong) JSDCayTypeDetailsModel* model;

NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLikedSuccess;
@end
