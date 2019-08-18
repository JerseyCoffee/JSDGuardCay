#import "XYFMyCenterViewModel.h"
#import "XYFMyCenterVC.h"
@implementation XYFMyCenterViewModel
- (NSArray<JSDMyCenterModel *> *)listArray {
    if (!_listArray) {
        NSArray *array = @[@{
                               @"imageName": @"collet",
                               @"title": @"Mi coleccion",
                               @"detail": @"",
                               @"route": @"XYFCollectVC",
                               },
                          @{
                               @"imageName": @"about_us",
                               @"title": @"Acerca de nosotros",
                               @"detail": @"",
                               @"route": @"XYFAbounMyVC",
                               },
                           @{
                               @"imageName": @"feedback",
                               @"title": @"Retroalimentación",
                               @"detail": @"",
                               @"route": @"XYFFeedBacksVC",
                               },
                           @{
                               @"imageName": @"grade",
                               @"title": @"Fomento de la evaluación",
                               @"detail": @"",
                               @"route": @"App",
                               @"subTitle": @""
                               },
                           ];
        _listArray = [JSDMyCenterModel mj_objectArrayWithKeyValuesArray:array];
    }
    return _listArray;
}
- (void)setupUserData {
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* userPath = [documentsDirectory stringByAppendingPathComponent:@"user"];
    if ([fileManager fileExistsAtPath:userPath]) {
    } else {
        [fileManager createFileAtPath:userPath contents:nil attributes:nil];
    }
    NSData* data = [NSData dataWithContentsOfFile:userPath];
    if (data) {
        NSArray* array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (array.count) {
            self.userData = [JSDUserModel mj_objectArrayWithKeyValuesArray:array].firstObject;
        } else {
            self.userData = [[JSDUserModel alloc] init];
        }
    } else {
        self.userData = [[JSDUserModel alloc] init];
    }
}
- (void)saveUserData {
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString* userPath = [documentsDirectory stringByAppendingPathComponent:@"user"];
    NSArray* array = [JSDUserModel mj_keyValuesArrayWithObjectArray: @[self.userData]];
    NSData* data = array.mj_JSONData;
    [data writeToFile:userPath atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:kMyUserDataNotification object:nil];
}
- (JSDUserModel *)userData {
    if (!_userData) {
        [self setupUserData];
    }
    return _userData;
}
@end
@implementation JSDUserModel
- (NSString *)userName {
    if (!_userName) {
        _userName = @"Pequeño coral";
    }
    return _userName;
}
@end
@implementation JSDMyCenterModel
@end
