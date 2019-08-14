//
//  JSDTabBarViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDTabBarViewController.h"


@interface JSDTabBarViewController ()

@end

@implementation JSDTabBarViewController

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    CYLTabBarController* tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers  tabBarItemsAttributes:[self setupTabbarItem] imageInsets:UIEdgeInsetsZero titlePositionAdjustment:UIOffsetZero];
    
    [self customizeTabBarAppearance:tabBarController];
    self.navigationController.navigationBar.hidden = YES;
    return (self = (JSDTabBarViewController *)tabBarController);
    
    return self;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
//    [tabBarController setTintColor:[UIColor jsd_skyBluecolor]];
}

- (NSArray *)setupTabbarItem {
    
    NSDictionary *cayAttributes = @{
                                           
                                            CYLTabBarItemImage : @"cay_normal",
                                            CYLTabBarItemSelectedImage : @"home_selected",  /* NSString and UIImage are supported*/
                                            };
    NSDictionary *AddAttributes = @{
                                             
                                              CYLTabBarItemImage : @"add_normal",
                                              CYLTabBarItemSelectedImage : @"add_normal",
                                              };
    NSDictionary *collectAttributes = @{
                                        
                                         CYLTabBarItemImage : @"collect_normal",
                                         CYLTabBarItemSelectedImage : @"collect_selected",
                                         };
    
    return @[
             cayAttributes,
             AddAttributes,
             collectAttributes,
             ];
}

#pragma mark -- set  && get

- (NSArray *)viewControllers {
    
    UIViewController *homeViewController = [[JSDHomeViewController alloc] init];
    JSDBaseNavigationController *homeNaviVC = [[JSDBaseNavigationController alloc]
                                                initWithRootViewController:homeViewController];
    
    [homeNaviVC cyl_setHideNavigationBarSeparator:YES];
    [homeNaviVC cyl_setNavigationBarHidden:YES];
    [homeNaviVC cyl_setNavigationBarHidden:YES];
    UIViewController *materialVC = [[JSDHomeViewController alloc] init];
    JSDBaseNavigationController *materialVCNaiVC = [[JSDBaseNavigationController alloc]
                                                    initWithRootViewController:materialVC];
    UIViewController *kitTypeVC = [[JSDHomeViewController alloc] init];
    JSDBaseNavigationController *kitTypeNaiVC = [[JSDBaseNavigationController alloc]
                                                 initWithRootViewController:kitTypeVC];
    [kitTypeNaiVC cyl_setHideNavigationBarSeparator:NO];
    
    [materialVCNaiVC cyl_setHideNavigationBarSeparator:NO];
    UIViewController *myCenterVC = [[JSDHomeViewController alloc] init];
    JSDBaseNavigationController *myCenterNaiVC = [[JSDBaseNavigationController alloc]
                                                  initWithRootViewController:myCenterVC];
    [myCenterNaiVC cyl_setHideNavigationBarSeparator:NO];
    NSArray *viewControllers = @[
                                 homeNaviVC,
                                 materialVCNaiVC,
                                 kitTypeNaiVC,
                                 ];
    return viewControllers;
}


@end
