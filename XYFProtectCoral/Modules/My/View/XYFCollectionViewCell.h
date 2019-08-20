#import "MDCCollectionViewTextCell.h"
#import "XYFMyCenterViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectionViewCell : MDCCollectionViewTextCell
@property (strong, nonatomic) JSDMyCenterModel *model;

NS_ASSUME_NONNULL_END
- (void)sp_upload;
@end
