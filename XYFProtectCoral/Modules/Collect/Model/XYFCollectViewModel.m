#import "XYFCollectViewModel.h"
static NSString* const kCollectionFilePath = @"collectFile.json";
@implementation XYFCollectViewModel
- (NSMutableArray<JSDCayTypeDetailsModel *> *)dataSource {
    if (!_dataSource) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCollectionFilePath];
        NSString* dataPath = path;
        if ([fileManager fileExistsAtPath:path]) {
        } else {
        }
        NSData* data = [NSData dataWithContentsOfFile:dataPath];
        NSArray* array;
        if (data) {
            array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        }
        if (array) {
            _dataSource = [JSDCayTypeDetailsModel mj_objectArrayWithKeyValuesArray:array
                           ];
        } else {
            _dataSource = [[NSMutableArray alloc] init];
        }
    }
    return _dataSource;
}
- (void)addCollect:(JSDCayTypeDetailsModel *)model {
    [self.dataSource addObject:model];
    [self saveDate];
}
- (void)cancelCollect:(JSDCayTypeDetailsModel *)model {
    for (NSInteger i = 0; i < self.dataSource.count; i++) {
        JSDCayTypeDetailsModel* searchModel = self.dataSource[i];
        if ([searchModel.cnName isEqualToString:model.cnName] && [searchModel.enName isEqualToString:model.enName]) {
            [self.dataSource removeObject:searchModel];
            [self saveDate];
            break;
        }
    }
}
- (void)saveDate {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataArray = [JSDCayTypeDetailsModel mj_keyValuesArrayWithObjectArray:self.dataSource];
    NSData* data = [dataArray mj_JSONData];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCollectionFilePath];
    if ([fileManager fileExistsAtPath:path]) {
    } else {
        BOOL status =  [fileManager createFileAtPath:path contents:nil attributes:nil];
        NSLog(@"创建成功%d", status);
    }
    [data writeToFile:path atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:kCollectionNotification object:nil];
}
- (void)update {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/%@", documentsDirectory, kCollectionFilePath];
    NSString* dataPath = path;
    if ([fileManager fileExistsAtPath:path]) {
    } else {
    }
    NSData* data = [NSData dataWithContentsOfFile:dataPath];
    NSArray* array;
    if (data) {
        array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    _dataSource = [JSDCayTypeDetailsModel mj_objectArrayWithKeyValuesArray:array
                   ];
}
- (void)sp_didUserInfoFailed {
    NSLog(@"Get Info Success");
}
- (void)sp_didGetInfoSuccess {
    NSLog(@"Continue");
}
- (void)sp_checkUserInfo {
    NSLog(@"Continue");
}

- (void)sp_getUserFollowSuccess {
    NSLog(@"Check your Network");
}
- (void)sp_getLoginState {
    NSLog(@"Get Info Success");
}
@end
