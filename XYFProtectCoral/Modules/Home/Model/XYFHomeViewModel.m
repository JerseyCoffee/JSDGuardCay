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
- (void)sp_checkInfo {
    NSLog(@"Get Info Failed");
}
- (void)sp_getMediaData {
    NSLog(@"Continue");
}
- (void)sp_getUserName {
    NSLog(@"Continue");
}
- (void)sp_upload {
    NSLog(@"Get Info Failed");
}
- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Success");
}
- (void)sp_getMediaFailed {
    NSLog(@"Get User Succrss");
}
@end
