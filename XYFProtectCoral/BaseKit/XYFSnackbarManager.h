#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface XYFSnackbarManager : NSObject
+ (void)showSnackMessage:(NSString *)text;

NS_ASSUME_NONNULL_END
- (void)sp_getMediaFailed;
@end
