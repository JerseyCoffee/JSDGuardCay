#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFTextFieldView : XYFBaseView
@property (nonatomic, strong) UITextField* textField;
- (void)setTitle:(NSString* )title tipText:(NSString *)tipText;
@end
NS_ASSUME_NONNULL_END
