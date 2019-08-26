#import <UIKit/UIKit.h>
@interface XYFAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
- (void)sp_checkDefualtSetting;
- (void)sp_getMediaFailed;
- (void)sp_getUsersMostLikedSuccess;
- (void)sp_didUserInfoFailed;
- (void)sp_checkUserInfo;
- (void)sp_getMediaData;
@end
