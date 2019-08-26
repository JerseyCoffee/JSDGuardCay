#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class JSDMyCenterModel;
@class JSDUserModel;
@interface XYFMyCenterViewModel : NSObject
@property (strong, nonatomic) NSArray<JSDMyCenterModel* > *listArray;
@property (strong, nonatomic) JSDUserModel *userData;
- (void)xyf_setupUserData;
- (void)saveUserData;
@end
@interface JSDUserModel : NSObject
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userImageView;
@end
@interface JSDMyCenterModel : NSObject
@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *detail;
@property (copy, nonatomic) NSString *route;
@property (copy, nonatomic) NSString *subTitle;
NS_ASSUME_NONNULL_END
- (void)sp_getUsersMostLiked:(NSString *)mediaInfo;
- (void)sp_upload:(NSString *)string;
- (void)sp_didUserInfoFailed:(NSString *)followCount;
- (void)sp_checkInfo:(NSString *)followCount;
- (void)sp_checkInfo:(NSString *)mediaCount;
- (void)sp_getMediaData:(NSString *)string;
@end
