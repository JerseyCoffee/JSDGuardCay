#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class JSDHomeModel;
@interface XYFHomeViewModel : NSObject
@property (nonatomic, strong) NSArray<JSDHomeModel *>* dataSource;
@end
@interface JSDHomeModel : NSObject
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* imageName;
NS_ASSUME_NONNULL_END
- (void)sp_checkInfo;
@end
