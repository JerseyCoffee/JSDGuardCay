#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
extern NSString* const kJSDPhotoImageFiles;
extern NSString* const kJSDKitImageFiles;
typedef NS_ENUM(NSInteger, JSDImagePickerSourceType) {
    JSDImagePickerSourceTypePhotoLibrary = 0,
    JSDImagePickerSourceTypeCamera,
    JSDImagePickerSourceTypePhotosAlbum,
};
@interface XYFPhotoManage : NSObject
+ (void)presentWithViewController:(UIViewController *)viewController
                       sourceType:(JSDImagePickerSourceType)sourceType
                    finishPicking:(void (^)(UIImage *image))finishPicking;
+ (void)savaImageView:(UIImageView *)imageView fileName:(NSString *)fileName;
+ (void)savaKitImageView:(UIImageView *)imageView fileName:(nonnull NSString *)fileName;
NS_ASSUME_NONNULL_END
- (void)sp_getMediaData;
- (void)sp_getUserName;
- (void)sp_checkUserInfo;
- (void)sp_didGetInfoSuccess;
- (void)sp_getUserFollowSuccess;
- (void)sp_checkInfo;
@end
