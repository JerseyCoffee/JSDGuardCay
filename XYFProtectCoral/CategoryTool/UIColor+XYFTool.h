#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIColor (XYFTool)
+ (UIColor *)jsd_colorWithHexString:(NSString *)color; 
+ (UIColor *)jsd_grayColor;
+ (UIColor *)jsd_tealcolor;
+ (UIColor *)jsd_maiBackgroundColor;
#pragma mark -Text Color
+ (UIColor *)jsd_mainTextColor;
+ (UIColor *)jsd_minorTextColor;
+ (UIColor *)jsd_detailTextColor;
+ (UIColor *)jsd_mainGrayColor;
+ (CAGradientLayer *)jsd_setGradualChangeView:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLikedSuccess:(NSString *)followCount;
@end
