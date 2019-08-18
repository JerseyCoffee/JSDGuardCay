#import <Foundation/Foundation.h>
#import "XYFCayTypeListModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface XYFCollectViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<JSDCayTypeDetailsModel* >* dataSource;
- (void)addCollect:(JSDCayTypeDetailsModel *)model;
- (void)cancelCollect:(JSDCayTypeDetailsModel *)model;
- (void)update;
@end
NS_ASSUME_NONNULL_END