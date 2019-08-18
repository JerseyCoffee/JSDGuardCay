#import "XYFCayTypeListModel.h"
@implementation XYFCayTypeListModel
- (instancetype)initWithTypeIndex:(NSInteger)typeIndex {
    self = [super init];
    if (self) {
        _typeIndex = typeIndex;
    }
    return self;
}
- (NSMutableArray<JSDCayTypeDetailsModel *> *)dataSource {
    if (!_dataSource) {
        NSFileManager* fileManager = [NSFileManager defaultManager];
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* path = [NSString stringWithFormat:@"%@/Add_%@.json", documentsDirectory, self.typeTitle];
        NSString* dataPath = path;
        if ([fileManager fileExistsAtPath:path]) {
        } else {
            dataPath = [[NSBundle mainBundle] pathForResource:self.typeTitle ofType:@"json"];
            NSLog(@"Title: %@,---------路径: %@", self.typeTitle, dataPath);
        }
        NSData* data = [NSData dataWithContentsOfFile:dataPath];
        NSArray* array;
        if (data) {
            array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        }
        _dataSource = [JSDCayTypeDetailsModel mj_objectArrayWithKeyValuesArray:array
                       ];
    }
    return _dataSource;
}
- (void)addDetailsModel:(JSDCayTypeDetailsModel *)model {
    [self.dataSource addObject:model];
    [self saveData];
}
- (void)collectModel:(JSDCayTypeDetailsModel* )model {
    for (NSInteger i = 0; i < self.dataSource.count; i++) {
        JSDCayTypeDetailsModel* searchModel = self.dataSource[i];
        if ([searchModel.cnName isEqualToString:model.cnName]) {
            searchModel.collect = !searchModel.collect;
            [self saveData];
            break;
        }
    }
}
- (void)saveData {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSMutableArray* dataArray = [JSDCayTypeDetailsModel mj_keyValuesArrayWithObjectArray:self.dataSource];
    NSData* data = [dataArray mj_JSONData];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* path = [NSString stringWithFormat:@"%@/Add_%@.json", documentsDirectory, self.typeTitle];
    if ([fileManager fileExistsAtPath:path]) {
    } else {
        BOOL status =  [fileManager createFileAtPath:path contents:nil attributes:nil];
        NSLog(@"创建成功%d", status);
    }
    [data writeToFile:path atomically:YES];
}
- (NSString *)typeTitle {
    if (!_typeTitle) {
        _typeTitle = [NSString stringWithFormat:@"cay%ld", self.typeIndex + 1];
    }
    return _typeTitle;
}
@end
@implementation JSDCayTypeDetailsModel
@end
