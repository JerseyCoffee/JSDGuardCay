#import "XYFSnackbarManager.h"
@implementation XYFSnackbarManager
+ (void)showSnackMessage:(NSString *)text {
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText:text];
    message.duration = 1;
    [manager showMessage:message];
}
@end
