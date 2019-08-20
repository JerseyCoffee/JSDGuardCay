#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFTextFieldView : XYFBaseView
@property (nonatomic, strong) UITextField* textField;
- (void)setTitle:(NSString* )title tipText:(NSString *)tipText;

NS_ASSUME_NONNULL_END
- (void)sp_checkInfo;
@end
