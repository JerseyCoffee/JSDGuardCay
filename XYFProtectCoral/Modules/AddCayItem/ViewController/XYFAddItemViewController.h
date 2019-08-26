#import "XYFBaseViewController.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFAddItemViewController : XYFBaseViewController
NS_ASSUME_NONNULL_END
- (void)sp_getLoginState;
- (void)sp_didUserInfoFailed;
- (void)sp_didGetInfoSuccess;
- (void)sp_upload;
- (void)sp_checkNetWorking;

@end
