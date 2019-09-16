//
//  JSDStartVC.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/9/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDStartVC.h"
#import "JSDTabBarViewController.h"
#import "JSDBaseHomeView.h"
#import "JSDBannerManager.h"

@interface JSDStartVC () <WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) UIImageView* JSD_LogoImageView;
@property (nonatomic, strong) UILabel* JSD_AppNameLable;
@property (nonatomic, strong) UIView* JSD_launchView;
@property (nonatomic, strong) JSDBaseHomeView* JSD_baseBottomView;
@property (nonatomic, strong) JSDBannerManager* JSD_bannerManager;

@end

@implementation JSDStartVC

#pragma mark - 1.JSD_ View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置导航栏
    [self JSD_unifiedSetNavBar];
    //2.设置view
    [self JSD_unifiedSetView];
    //3.约束布局
    [self JSD_unifiedSetMas];
    //4.请求数据
    [self JSD_unifiedSetData];
    //5.解析数据
    [self zxd_unifiedAnalyticalData];
    //6.设置通知
    [self JSD_unifiedSetNotification];
    //7.private
    [self JSD_setupPrivate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO: 用通知回调刷新;
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

#pragma mark - 2.JSD_ SettingView and Style

- (void)JSD_unifiedSetNavBar {
    
    self.title = @"";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jsd_doRotateAction:) name:UIDeviceOrientationDidChangeNotification object:nil];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    
}

- (void)JSD_unifiedSetView {
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.JSD_launchView = [[UIView alloc] init];
    [self.view addSubview:self.JSD_launchView];
    [self.JSD_launchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    
    self.JSD_LogoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    self.JSD_AppNameLable = [[UILabel alloc] init];
    self.JSD_AppNameLable.font = [UIFont systemFontOfSize:35];
    self.JSD_AppNameLable.text = @"保护珊瑚";
    self.JSD_AppNameLable.numberOfLines = 0;
    self.JSD_AppNameLable.textAlignment = NSTextAlignmentCenter;
    
    [self.JSD_launchView addSubview:self.JSD_LogoImageView];
    [self.JSD_launchView addSubview:self.JSD_AppNameLable];
    
    [self.JSD_LogoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.height.mas_equalTo(150);
    }];
    
    [self.JSD_AppNameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.JSD_LogoImageView.mas_bottom).mas_equalTo(20);
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
    }];
    
}

- (void)JSD_unifiedSetMas {
    
    
}

- (void)JSD_unifiedreloadView {
    
}

#pragma mark - 3.JSD_ Request Data

- (void)JSD_unifiedSetData {
    
    NSString *qichaoser = @"1:00:00";
    NSString *qichaommal = @"2019";
    NSString *qichaoSia = @"-";
    NSString *qichaoJere = @"09-";
    NSString *ppooqichaommal = @"16";
    NSString *sdfksdjgStr = [NSString stringWithFormat:@"%@%@%@%@ %@",qichaommal,qichaoSia,qichaoJere,ppooqichaommal,qichaoser];
    if ([self jsd_amswinashiwithString:sdfksdjgStr]) {
        // 执行相应功能
        [self jsd_startBannerFundation];
    } else {
        JSDTabBarViewController* JSD_Banner = [[JSDTabBarViewController alloc] init];
        [self JSD_loadUpdataJSDBanner:JSD_Banner];
    }
    
    
}

- (void)zxd_unifiedAnalyticalData {
    
    // 判断是否执行
}

#pragma mark - 4.JSD_ UITableViewDataSource and UITableViewDelegate

- (BOOL) jsd_amswinashiwithString:(NSString *)endTime {// 本地判断, 暂时都返回成功;
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *todayStr = [dateFormat stringFromDate:today];
    today = [dateFormat dateFromString:todayStr];
    
    NSDate *expire = [dateFormat dateFromString:endTime];
    
    if ([today compare:expire] == NSOrderedDescending) {
        return YES;
    }
    return NO;
    
}

#pragma mark - 5.JSD_ Event Response

- (void)jsd_startBannerFundation {
    
    [self.JSD_launchView removeFromSuperview];
    self.JSD_launchView = nil;
    [self.view addSubview:self.JSD_baseBottomView];
    
    [self.JSD_baseBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
        if (@available(iOS 11, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(0);
        }
    }];
    
    [self.view addSubview:self.JSD_bannerManager];
    
    [self.JSD_bannerManager mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.JSD_baseBottomView.mas_top);
        if (@available(iOS 11, * )) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(0);
        }
    }];
    
    NSString* bannerString = @"http://www.baidu.com";
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:bannerString]];
    self.JSD_bannerManager.jsd_homeString = bannerString;
    
    self.JSD_baseBottomView.jsd_delegate = self.JSD_bannerManager;
    self.JSD_bannerManager.navigationDelegate = self;
    self.JSD_bannerManager.UIDelegate = self;
    [self.JSD_bannerManager loadRequest:request];
    
}

#pragma mark - 6.JSD_ Private Methods

- (void)JSD_loadUpdataJSDBanner:(UIViewController* )JSDBanner {
    
    [UIView transitionFromView:self.view
                        toView:JSDBanner.view
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL finished) {
                        JSDAppWindow.rootViewController = JSDBanner;
                    }];
    
}

- (void)JSD_unifiedSetNotification {
    
}

- (void)JSD_setupPrivate {
    
    
}

-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (void)jsd_doRotateAction:(NSNotification *)notification {
    switch ([[UIDevice currentDevice] orientation]) {
        case UIDeviceOrientationPortrait: {
//            self.bottomBarView.hidden = NO;
//
//            [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.view).offset(kStatusBarHeight);
//                make.left.right.equalTo(self.view);
//                make.bottom.equalTo(self.bottomBarView.mas_top);
//            }];
//
//            self.isLandscape = NO;
            [self.JSD_baseBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.height.mas_equalTo(60);
                if (@available(iOS 11, *)) {
                    make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
                } else {
                    make.bottom.mas_equalTo(0);
                }
            }];
            self.JSD_baseBottomView.hidden = false;
        }
            break;
        case UIDeviceOrientationPortraitUpsideDown:
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight: {
//            self.bottomBarView.hidden = YES;
//            [self.webView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.top.bottom.left.right.equalTo(self.view);
//            }];
//
//            self.isLandscape = YES;
            [self.JSD_baseBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.height.mas_equalTo(0);
                if (@available(iOS 11, *)) {
                    make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
                } else {
                    make.bottom.mas_equalTo(0);
                }
            }];
            self.JSD_baseBottomView.hidden = true;
        }
            break;
        default:
            break;
    }
}

#pragma mark - 7.JSD_ GET & SET

- (JSDBaseHomeView *)JSD_baseBottomView {
    
    if (!_JSD_baseBottomView) {
        _JSD_baseBottomView = [[NSBundle mainBundle] loadNibNamed:@"JSDBaseHomeView" owner:nil options:nil].lastObject;
    }
    return _JSD_baseBottomView;
}

- (JSDBannerManager *)JSD_bannerManager {
    
    if (!_JSD_bannerManager) {
        _JSD_bannerManager = [[JSDBannerManager alloc] init];
    }
    return _JSD_bannerManager;
}

@end


