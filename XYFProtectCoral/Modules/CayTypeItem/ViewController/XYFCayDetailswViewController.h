#import "XYFBaseViewController.h"
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCayDetailswViewController : XYFBaseViewController
@property (nonatomic, strong) JSDCayTypeDetailsModel* detailsModel;
@property (nonatomic, strong) XYFCayTypeListModel* viewModel;

NS_ASSUME_NONNULL_END
- (void)sp_getMediaData;
@end
