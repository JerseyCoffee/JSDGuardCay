#import "XYFBaseView.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFTypeSelectedView : XYFBaseView
@property (nonatomic, assign) NSInteger selectedType;
@property (nonatomic, copy) NSString* title;
- (void)setTitle:(NSString* )title number:(NSInteger)number;
@end
NS_ASSUME_NONNULL_END
