#import "XYFAppDelegate.h"
#import "XYFTabBarViewController.h"
#import <UMCommon/UMConfigure.h>
#import "Growing.h"
@interface XYFAppDelegate ()
@end
@implementation XYFAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    XYFTabBarViewController* tabBarViewController = [[XYFTabBarViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyWindow];
    [UMConfigure initWithAppkey:@"5d5ba9a24ca35786500004da" channel:@"App Store"];
     [Growing startWithAccountId:@"9d9c9e2608bef325"];
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
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([Growing handleUrl:url]) 
    {
        return YES;
    }
    return NO;
}
- (void)sp_checkDefualtSetting {
    NSLog(@"Check your Network");
}
@end
