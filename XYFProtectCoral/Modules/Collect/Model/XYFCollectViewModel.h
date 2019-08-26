#import <Foundation/Foundation.h>
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<JSDCayTypeDetailsModel* >* dataSource;
- (void)addCollect:(JSDCayTypeDetailsModel *)model;
- (void)cancelCollect:(JSDCayTypeDetailsModel *)model;
- (void)update;
NS_ASSUME_NONNULL_END
- (void)sp_didUserInfoFailed;
- (void)sp_didGetInfoSuccess;
- (void)sp_checkUserInfo;

- (void)sp_getUserFollowSuccess;
- (void)sp_getLoginState;
@end
