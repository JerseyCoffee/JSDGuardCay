#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFSelectedNumberView : XYFBaseView
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UILabel* subtitleLabel;
- (void)setTitle:(NSString* )title number:(NSInteger)number;

NS_ASSUME_NONNULL_END
- (void)sp_getLoginState:(NSString *)followCount;
@end
