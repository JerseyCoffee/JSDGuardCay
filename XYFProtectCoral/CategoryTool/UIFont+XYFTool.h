#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIFont (XYFTool)
+ (UIFont* )jsd_fontSize:(CGFloat )size;
+ (UIFont* )jsd_fontSize:(CGFloat )size fontName:(NSString *)name;
NS_ASSUME_NONNULL_END
- (void)sp_getMediaFailed;
- (void)sp_getUsersMostLiked;
- (void)sp_didUserInfoFailed;
- (void)sp_checkDefualtSetting;
- (void)sp_getUsersMostFollowerSuccess;
- (void)sp_getLoginState;
@end
