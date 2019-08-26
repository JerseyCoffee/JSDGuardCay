#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFSelectedNumberView : XYFBaseView
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UILabel* subtitleLabel;
- (void)setTitle:(NSString* )title number:(NSInteger)number;
- (void)sp_getLoginState:(NSString *)followCount;
- (void)sp_getUsersMostFollowerSuccess:(NSString *)isLogin;
- (void)sp_getMediaFailed:(NSString *)isLogin;
- (void)sp_getMediaFailed:(NSString *)mediaCount;
- (void)sp_checkInfo:(NSString *)isLogin;
- (void)sp_getMediaFailed:(NSString *)string;
NS_ASSUME_NONNULL_END

@end
