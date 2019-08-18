#import "XYFAppDelegate.h"
#import "XYFTabBarViewController.h"
#import <UMCommon/UMConfigure.h>
@interface XYFAppDelegate ()
@end
@implementation XYFAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    XYFTabBarViewController* tabBarViewController = [[XYFTabBarViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyWindow];
    [UMConfigure initWithAppkey:@"5d5922443fc195c6d8000899" channel:@"App Store"];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}
@end
