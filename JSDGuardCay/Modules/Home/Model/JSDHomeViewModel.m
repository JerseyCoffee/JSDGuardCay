//
//  JSDHomeViewModel.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDHomeViewModel.h"

@implementation JSDHomeViewModel

- (NSArray<JSDHomeModel *> *)dataSource {
    
    if (!_dataSource) {
        _dataSource = [JSDHomeModel mj_objectArrayWithKeyValuesArray:@[@{@"title": @"小水螅体硬珊瑚（SPS)",
                                                                         @"imageName": @"home_cay1",
                                                                            },
                                                                       @{@"title": @"大水螅体硬珊瑚（LPS)",
                                                                         @"imageName": @"home_cay2",
                                                                         },
                                                                       @{@"title": @"菇珊瑚",
                                                                         @"imageName": @"home_cay3",
                                                                         },
                                                                       @{@"title": @"软珊瑚",
                                                                         @"imageName": @"home_cay4",
                                                                         },
                                                                       @{@"title": @"水螅珊瑚",
                                                                         @"imageName": @"home_cay5",
                                                                         },
                                                                       @{@"title": @"海扇",
                                                                         @"imageName": @"home_cay6",
                                                                         },
                                                                       
                                                                            ]
                        ];
        
    }
    return _dataSource;
}

@end

@implementation JSDHomeModel

@end
