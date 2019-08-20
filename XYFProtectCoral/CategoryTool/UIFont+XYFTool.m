#import "UIFont+XYFTool.h"
static NSString* const kJSDFontName = @"Helvetica Neue";
@implementation UIFont (XYFTool)
+ (UIFont *)jsd_fontSize:(CGFloat)size {
    UIFont* font = [UIFont jsd_fontSize:size fontName:kJSDFontName];
    return font;
}
+ (UIFont *)jsd_fontSize:(CGFloat)size fontName:(NSString *)name {
    UIFont *font = [UIFont fontWithName:name size:size];
    return font;
}
- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}
@end
