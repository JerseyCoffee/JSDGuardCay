#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFTypeSelectedView : XYFBaseView
@property (nonatomic, assign) NSInteger selectedType;
@property (nonatomic, copy) NSString* title;
- (void)setTitle:(NSString* )title number:(NSInteger)number;
NS_ASSUME_NONNULL_END
- (void)sp_didGetInfoSuccess;
- (void)sp_getUsersMostLikedSuccess;
- (void)sp_checkDefualtSetting;
- (void)sp_checkInfo;
- (void)sp_upload;
@end
