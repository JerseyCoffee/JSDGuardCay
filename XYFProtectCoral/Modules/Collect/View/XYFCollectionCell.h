#import "MDCCollectionViewCell.h"
#import "XYFCollectViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectionCell : MDCCollectionViewCell
@property (strong, nonatomic) JSDCayTypeDetailsModel *model;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostFollowerSuccess:(NSString *)mediaCount;
@end
