
//
//  JSDCollectViewModel.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCollectViewModel.h"

static NSString* const kCollectionFilePath = @"collectFile.json";

@implementation JSDCollectViewModel

- (NSMutableArray<JSDCayTypeDetailsModel *> *)dataSource {
    
    if (!_dataSource) {
        
        NSFileManager* fileManager = [NSFileManager defaultManager];
        //指向文件目录
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
}

@end
