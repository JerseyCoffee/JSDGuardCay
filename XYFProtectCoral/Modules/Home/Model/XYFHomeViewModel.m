//
//  XYFHomeViewModel.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "XYFHomeViewModel.h"

@implementation XYFHomeViewModel

- (NSArray<JSDHomeModel *> *)dataSource {
    
    if (!_dataSource) {
        _dataSource = [JSDHomeModel mj_objectArrayWithKeyValuesArray:@[@{@"title": @"Pequeño coral duro",
                                                                         @"imageName": @"home_cay1",
                                                                            },
                                                                       @{@"title": @"Coral duro grande",
                                                                         @"imageName": @"home_cay2",
                                                                         },
                                                                       @{@"title": @"Coral de setas",
                                                                         @"imageName": @"home_cay3",
                                                                         },
                                                                       @{@"title": @"Coral blando",
                                                                         @"imageName": @"home_cay4",
                                                                         },
                                                                       @{@"title": @"Nutria coral",
                                                                         @"imageName": @"home_cay5",
                                                                         },
                                                                       @{@"title": @"Abanico de mar",
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
