#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFTextFieldView : XYFBaseView
@property (nonatomic, strong) UITextField* textField;
- (void)setTitle:(NSString* )title tipText:(NSString *)tipText;
NS_ASSUME_NONNULL_END
- (void)sp_checkInfo;
- (void)sp_checkDefualtSetting;
- (void)sp_getUserFollowSuccess;
- (void)sp_didUserInfoFailed;
- (void)sp_upload;
- (void)sp_getUserName;
@end
