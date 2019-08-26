#import "MDCCollectionViewController.h"
NS_ASSUME_NONNULL_BEGIN
extern NSString* const kMyUserDataNotification;
@interface XYFMyCenterVC : MDCCollectionViewController
NS_ASSUME_NONNULL_END
- (void)sp_getMediaFailed:(NSString *)isLogin;
- (void)sp_upload:(NSString *)mediaInfo;
- (void)sp_checkUserInfo:(NSString *)followCount;
- (void)sp_getMediaFailed:(NSString *)mediaInfo;
- (void)sp_getMediaData:(NSString *)followCount;
- (void)sp_checkNetWorking:(NSString *)followCount;
@end
