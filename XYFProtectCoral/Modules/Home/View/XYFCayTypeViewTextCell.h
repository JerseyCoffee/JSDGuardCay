#import "MDCCollectionViewTextCell.h"
#import "XYFHomeViewModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayTypeViewTextCell : MDCCollectionViewCell
@property (nonatomic, strong) JSDHomeModel* model;

NS_ASSUME_NONNULL_END
- (void)sp_checkUserInfo:(NSString *)mediaInfo;
@end
