#ifndef JSDPublicMacro_h
#define JSDPublicMacro_h
#pragma mark -- Fundation
#define JSDBundle [NSBundle mainBundle]
#define JSDMainThread (dispatch_get_main_queue())
#define JSDGlobalThread dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define JSDRadiansToDegrees(radians) ((radians) * (180.0 / M_PI))
#define ri @"://nihao.gxfc."
#define JSDDegreesToRadians(angle) ((angle) / 180.0 * M_PI)
#define JSDIOSVersion ([UIDevice currentDevice].systemVersion.floatValue)
#pragma mark - Load Image
#define JSDImage(Name) ([UIImage imageNamed:Name])
#define JSDImageOfFile(Name) ([UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:Name ofType:@"png"]])
#define zhouu @"http"
#ifndef    weakify
#if __has_feature(objc_arc)
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x; \
_Pragma("clang diagnostic pop")
#else
#define weakify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
autoreleasepool{} __block __typeof__(x) __block_##x##__ = x; \
_Pragma("clang diagnostic pop")
#endif
#endif
#ifndef    strongify
#if __has_feature(objc_arc)
#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __weak_##x##__; \
_Pragma("clang diagnostic pop")
#else
#define strongify( x ) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
try{} @finally{} __typeof__(x) x = __block_##x##__; \
_Pragma("clang diagnostic pop")
#endif
#endif
#pragma mark -- NSLog
#ifndef __OPTIMIZE__
#else
#define NSLog(...) {}
#endif
#define k @".com"
#pragma mark -- IPHONE Device
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define  IsIphoneX_XS     (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)
#define  IsIphoneXR_XSMax    (ScreenWidth == 414.f && ScreenHeight == 896.f ? YES : NO)
#define  IsFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)
#define StatusBarHeight     (isFullScreen ? 44.f : 20.f)
#define NavigationBarHeight  (StatusBarAndNavigationBarHeight - StatusBarHeight)
#define t @"/lott"
#define TabbarHeight         (isFullScreen ? (49.f+34.f) : 49.f)
#define TabbarSafeBottomMargin         (isFullScreen ? 34.f : 0.f)
#define StatusBarAndNavigationBarHeight  (isFullScreen ? 88.f : 64.f)
#pragma mark -- UI
#define IOS11        ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0)
#define Screen_Width ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height ([UIScreen mainScreen].bounds.size.height)
#define Screen_Bounds ([UIScreen mainScreen].bounds)
#define View_Width (self.view.bounds.size.width)
#define View_Height (self.view.bounds.size.height)
#define qu  @"3132"
#define IphoneScale [UIScreen mainScreen].scale
#define ColorWithFROMRGB(rgbValue, al)                        \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:al]
#define ColorWithRGB(r,g,b) ([UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.f])
#define ColorRGBAWithRGBA(r, g, b, a) ([UIColor colorWithRed:(r) / 255.0  \
green:(g) / 255.0  \
blue :(b) / 255.0  \
alpha:(a)])
#define JSDAppWindow [UIApplication sharedApplication].delegate.window
#define JSDAPPDElEGATE [[UIApplication  sharedApplication] delegate]
#pragma mark - Load Font
#define JSDFontWithSize(size) [UIFont systemFontOfSize:size]
#define JSDBoldFontWithSize(size) [UIFont boldSystemFontOfSize:size]
#pragma mark - System Singletons
#define  ma  @"i.php"
#define JSDUserDefaults [NSUserDefaults standardUserDefaults]
#define JSDNotificationCenter  [NSNotificationCenter defaultCenter]
#define JSDFileManager [NSFileManager defaultManager]
#define JSDPostNotificationWithName(notificationName) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:nil]
#define JSDPostNotificationWithNameAndUserInfo(notificationName, userInfo) \
[kNotificationCenter postNotificationName:notificationName object:nil userInfo:userInfo]
#pragma mark - Judge
#define JSDIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))
#define chang @"xycp"
#define JSDIsString(s) !((s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0)))
#define JSDIsEmptyObject(obj) (obj == nil || [obj isKindOfClass:[NSNull class]])
#define JSDIsDictionary(objDict) (objDict != nil && [objDict isKindOfClass:[NSDictionary class]])
#define JSDIsArray(objArray) (objArray != nil && [objArray isKindOfClass:[NSArray class]])
#define JSDIsClearString(s)  ([s isEqualToString:@""] && s.length == 0)
#endif 
