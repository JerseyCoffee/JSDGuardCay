#import "XYFTabBarViewController.h"
@interface XYFTabBarViewController ()
@end
@implementation XYFTabBarViewController
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    CYLTabBarController* tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers  tabBarItemsAttributes:[self setupTabbarItem] imageInsets:UIEdgeInsetsZero titlePositionAdjustment:UIOffsetZero];
    [self customizeTabBarAppearance:tabBarController];
    self.navigationController.navigationBar.hidden = YES;
    return (self = (XYFTabBarViewController *)tabBarController);
    return self;
}
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
}
- (NSArray *)setupTabbarItem {
    NSDictionary *cayAttributes = @{
                                            CYLTabBarItemImage : @"cay_normal",
                                            CYLTabBarItemSelectedImage : @"cay_selected",  
                                            };
    NSDictionary *AddAttributes = @{
                                              CYLTabBarItemImage : @"add_normal",
                                              CYLTabBarItemSelectedImage : @"add_normal",
                                              };
    NSDictionary *collectAttributes = @{
                                         CYLTabBarItemImage : @"myItem_normal",
                                         CYLTabBarItemSelectedImage : @"myItem_selected",
                                         };
    return @[
             cayAttributes,
             AddAttributes,
             collectAttributes,
             ];
}
#pragma mark -- set  && get
- (NSArray *)viewControllers {
    UIViewController *homeViewController = [[XYFHomeViewController alloc] init];
    XYFBaseNavigationController *homeNaviVC = [[XYFBaseNavigationController alloc]
                                                initWithRootViewController:homeViewController];
    [homeNaviVC cyl_setHideNavigationBarSeparator:YES];
    [homeNaviVC cyl_setNavigationBarHidden:YES];
    [homeNaviVC cyl_setNavigationBarHidden:YES];
    UIViewController *materialVC = [[XYFHomeViewController alloc] init];
    XYFBaseNavigationController *materialVCNaiVC = [[XYFBaseNavigationController alloc]
                                                    initWithRootViewController:materialVC];
    UIViewController *addItemVC = [[XYFAddItemViewController alloc] init];
    XYFBaseNavigationController *addItemVCNaivVC = [[XYFBaseNavigationController alloc]
                                                 initWithRootViewController:addItemVC];
    [addItemVCNaivVC cyl_setHideNavigationBarSeparator:NO];
    [materialVCNaiVC cyl_setHideNavigationBarSeparator:NO];
    UIViewController *myCenterVC = [[XYFMyCenterVC alloc] init];
    XYFBaseNavigationController *collectionNaviVC = [[XYFBaseNavigationController alloc]
                                                  initWithRootViewController:myCenterVC];
    [collectionNaviVC cyl_setHideNavigationBarSeparator:NO];
    NSArray *viewControllers = @[
                                 homeNaviVC,
                                 addItemVCNaivVC,
                                 collectionNaviVC,
                                 ];
    return viewControllers;
}
- (void)sp_checkDefualtSetting {
    NSLog(@"Get Info Success");
}
@end
