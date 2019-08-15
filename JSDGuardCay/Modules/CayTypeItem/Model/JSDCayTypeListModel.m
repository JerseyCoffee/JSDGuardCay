//
//  JSDCayTypeListModel.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayTypeListModel.h"

@implementation JSDCayTypeListModel

- (NSMutableArray<JSDCayTypeDetailsModel *> *)dataSource {
    
    if (!_dataSource) {
        
        NSFileManager* fileManager = [NSFileManager defaultManager];
        //指向文件目录
        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSString* path = [NSString stringWithFormat:@"%@/Add_%@", documentsDirectory, self.typeTitle];
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
        if ([searchModel.cnName isEqualToString:model.cnName]) {// 无唯一表示
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
    NSString* path = [NSString stringWithFormat:@"%@/Add_%@", documentsDirectory, self.typeTitle];
    if ([fileManager fileExistsAtPath:path]) {
    } else {
        BOOL status =  [fileManager createFileAtPath:path contents:nil attributes:nil];
        NSLog(@"创建成功%d", status);
    }
    [data writeToFile:path atomically:YES];
}

@end

@implementation JSDCayTypeDetailsModel

@end
