#import "XYFSnackbarManager.h"
@implementation XYFSnackbarManager
+ (void)showSnackMessage:(NSString *)text {
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText:text];
    message.duration = 1;
    [manager showMessage:message];
}
- (void)sp_getMediaFailed {
    NSLog(@"Get Info Success");
}
- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Check your Network");
}
- (void)sp_checkNetWorking {
    NSLog(@"Continue");
}
//- (void)sp_getUsersMostFollowerSuccess {
//    NSLog(@"Continue");
//}
//- (void)sp_getMediaFailed {
//    NSLog(@"Get Info Success");
//}
- (void)sp_getUserName {
    NSLog(@"Check your Network");
}
@end
