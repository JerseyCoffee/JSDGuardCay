#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@class JSDCayTypeDetailsModel;
@interface XYFCayTypeListModel : NSObject
@property (nonatomic, copy) NSString* typeTitle;
@property (nonatomic, assign) NSInteger typeIndex;
@property (nonatomic, strong) NSMutableArray<JSDCayTypeDetailsModel* >* dataSource;
- (instancetype)initWithTypeIndex:(NSInteger)typeIndex;
- (void)addDetailsModel:(JSDCayTypeDetailsModel* )model;
- (void)collectModel:(JSDCayTypeDetailsModel* )model;
@end
@interface JSDCayTypeDetailsModel : NSObject
@property (nonatomic, copy) NSString* imageName;
@property (nonatomic, copy) NSString* cnName;
@property (nonatomic, copy) NSString* enName;
@property (nonatomic, copy) NSString* cnNameTitle; 
@property (nonatomic, copy) NSString* siyang;
@property (nonatomic, copy) NSString* guangzhao;
@property (nonatomic, copy) NSString* shuiliu;
@property (nonatomic, copy) NSString* didian;
@property (nonatomic, copy) NSString* yaoqiu;
@property (nonatomic, copy) NSString* yanse;
@property (nonatomic, copy) NSString* xingqing;
@property (nonatomic, copy) NSString* chandi;
@property (nonatomic, copy) NSString* zhongshu;
@property (nonatomic, copy) NSString* info;
@property (nonatomic, assign) BOOL collect;

NS_ASSUME_NONNULL_END
- (void)sp_didUserInfoFailed;
@end
