#import "XYFAppDelegate.h"
#import "XYFTabBarViewController.h"
#import <UMCommon/UMConfigure.h>
#import "Growing.h"
#import <JPUSHService.h>
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
    //新增推送功能
    [self setupPushApplication:application Options:launchOptions];
    
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
- (void)sp_getMediaFailed {
    NSLog(@"Continue");
}
- (void)sp_getUsersMostLikedSuccess {
    NSLog(@"Get User Succrss");
}
- (void)sp_didUserInfoFailed {
    NSLog(@"Get User Succrss");
}
- (void)sp_checkUserInfo {
    NSLog(@"Check your Network");
}
- (void)sp_getMediaData {
    NSLog(@"Get Info Failed");
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [application registerForRemoteNotifications];
}

- (void) setupPushApplication:(UIApplication *)application Options:(NSDictionary *)launchOptions {
    
    NSString *appKey = @"ba974b8ee25a453e5f7764ad";
    NSString *channel = @"channel";
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    }
    else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                          UIUserNotificationTypeSound |
                                                          UIUserNotificationTypeAlert)
                                              categories:nil];
    }
    
    BOOL isProduction = true;
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];  //
    
    [application registerForRemoteNotifications];
}

@end
