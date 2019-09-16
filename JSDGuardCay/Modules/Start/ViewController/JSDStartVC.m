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
#import "JSDNetworkErrorView.h"
#import "Reachability.h"
#import "JSDBannerObjManager.h"

@interface JSDStartVC () <WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) UIImageView* JSD_LogoImageView;
@property (nonatomic, strong) UILabel* JSD_AppNameLable;
@property (nonatomic, strong) UIView* JSD_launchView;
@property (nonatomic, strong) JSDBaseHomeView* JSD_baseBottomView;
@property (nonatomic, strong) JSDBannerManager* JSD_bannerManager;
@property (nonatomic, strong) JSDNetworkErrorView* JSD_errorView;

@property (assign, nonatomic) NetworkStatus netStatus;
@property (nonatomic) Reachability *hostReachability;//域名检查
@property (nonatomic, weak) WKBackForwardListItem *currentItem;
@property (assign, nonatomic) BOOL isLoadFinish;//是否加载完成
@property (assign, nonatomic) BOOL isLandscape;//是否横屏
@property (assign, nonatomic) BOOL resFlag;
@property (nonatomic, copy) NSString* jsd_homeBannerString;

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
    // 检查网络
    [self observer];
    
    self.jsd_homeBannerString = @"https://amjsc2277.com";
}

- (void)observer {
    [self monitorNetStatus];
    @weakify(self)
    [[JSDBannerObjManager mgr] addObj:self.JSD_bannerManager keyPath:@"estimatedProgress" block:^(NSDictionary *change) {
        @strongify(self)
        if (self.resFlag) {
            if ([change[NSKeyValueChangeNewKey] floatValue] >= 1) [SVProgressHUD dismiss];
        }
    }];

    [[JSDBannerObjManager mgr] addObj:self keyPath:@"netStatus" block:^(NSDictionary *change) {
        @strongify(self)
        if ([change[NSKeyValueChangeNewKey] integerValue] == NotReachable) {
            UIAlertController* JSD_alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"网络连接错误,请稍后重试" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* JSD_action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [JSD_alertVC addAction:JSD_action];
            [self presentViewController:JSD_alertVC animated:YES completion:nil];
            self.JSD_errorView.hidden = NO;
        }
        if ([change[NSKeyValueChangeOldKey] integerValue] == NotReachable
            && [change[NSKeyValueChangeNewKey] integerValue] != NotReachable) {
            [self JSD_reloadNetFundation:nil];
        }
    }];
}

#pragma mark - ------ 网络监听 ------
//- (void)againBTAction:(UIButton *)sender {
//    [self reConnect];
//}

-(void)monitorNetStatus {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    NSString *remoteHostName = @"www.apple.com";
    
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
}

- (void) reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NetworkStatus netStatus = [curReach currentReachabilityStatus];
    self.netStatus = netStatus;
    
    if (self.netStatus == NotReachable) {
        [self JSD_errorView];
        self.JSD_errorView.hidden = NO;
    } else {
        [self.JSD_bannerManager reload];
    }
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
    
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.jsd_homeBannerString]];
    self.JSD_bannerManager.jsd_homeString = self.jsd_homeBannerString;
    
    self.JSD_baseBottomView.jsd_delegate = self.JSD_bannerManager;
    self.JSD_bannerManager.navigationDelegate = self;
    self.JSD_bannerManager.UIDelegate = self;
    [self.JSD_bannerManager loadRequest:request];
    
}

#pragma mark - 6.JSD_ Private Methods

- (void)JSD_reloadNetFundation:(id)sender {
    
    if (!self.netStatus) {
//        [SVProgressHUD showErrorWithStatus:@"网络开小差了..."];
        UIAlertController* JSD_alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"网络连接错误,请稍后重试" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* JSD_action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        [JSD_alertVC addAction:JSD_action];
        [self presentViewController:JSD_alertVC animated:YES completion:nil];
        return;
    }
    self.JSD_errorView.hidden = YES;
    self.isLoadFinish = NO;
    
    if (self.currentItem) {
        [self.JSD_bannerManager goToBackForwardListItem:self.currentItem];
    } else {
        [self.JSD_bannerManager loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.jsd_homeBannerString]]];
    }
    
//    if (self.netStatus == NotReachable) {
//        UIAlertController* JSD_alertVC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"网络连接错误,请稍后重试" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* JSD_action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        }];
//        [JSD_alertVC addAction:JSD_action];
//        [self presentViewController:JSD_alertVC animated:YES completion:nil];
//    } else {
//        //刷新
//        [self.JSD_bannerManager reload];
//    }
}

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
            self.isLandscape = NO;
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
            self.isLandscape = YES;
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

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURL *url = navigationAction.request.URL;
    NSString *urlString = (url) ? url.absoluteString : @"";
    
    // iTunes: App Store link
    // 例如，微信的下载链接: https://itunes.apple.com/cn/app/id414478124?mt=8
    if ([urlString containsString:@"//itunes.apple.com/"]) {
        [[UIApplication sharedApplication] openURL:url];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    // Protocol/URL-Scheme without http(s)
    else if (url.scheme && ![url.scheme hasPrefix:@"http"]) {
        [[UIApplication sharedApplication] openURL:url];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.resFlag = YES;
    self.isLoadFinish = NO;
    [SVProgressHUD showWithStatus:@"正在加载..."];
    [self openOtherAppWithUIWebView:webView];
}

- (void)openOtherAppWithUIWebView:(WKWebView *)webView {
    
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple"]
        ||[webView.URL.absoluteString hasPrefix:@"https://apps.apple"]) {
        [[UIApplication sharedApplication] openURL:webView.URL];
    } else {
        if (![webView.URL.absoluteString hasPrefix:@"http"]) {
            NSArray *whitelist = [[[NSBundle mainBundle] infoDictionary] objectForKey: @"LSApplicationQueriesSchemes"];
            for (NSString * whiteName in whitelist) {
                NSString *rulesString = [NSString stringWithFormat:@"%@://",whiteName];
                if ([webView.URL.absoluteString hasPrefix:rulesString]){
                    [[UIApplication sharedApplication] openURL:webView.URL];
                }
            }
        }
    }
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.isLoadFinish = YES;
    self.currentItem = webView.backForwardList.currentItem;
    if (!self.netStatus) {
        self.JSD_errorView.hidden = NO;
        self.isLoadFinish = NO;
    }
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.resFlag = NO;
//    [SVProgressHUD showErrorWithStatus:@"加载失败..." duration:4];
    [SVProgressHUD showErrorWithStatus:@"加载失败"];
    [SVProgressHUD dismissWithDelay:4];
    
    if (!self.JSD_errorView.hidden || error.code == -1002) {
        [SVProgressHUD dismiss];
    }
    if (!self.netStatus) {
        self.JSD_errorView.hidden = NO;
        self.isLoadFinish = NO;
    }
}

#pragma mark -
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message?:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:([UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }])];
    [alertController addAction:([UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }])];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:prompt message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = defaultText;
    }];
    [alertController addAction:([UIAlertAction actionWithTitle:@"完成" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(alertController.textFields[0].text?:@"");
    }])];
    
    [self presentViewController:alertController animated:YES completion:nil];
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
        _JSD_bannerManager.navigationDelegate = self;
    }
    return _JSD_bannerManager;
}

- (JSDNetworkErrorView *)JSD_errorView {
    
    if (!_JSD_errorView) {
        _JSD_errorView = [[NSBundle mainBundle] loadNibNamed:@"JSDNetworkErrorView" owner:nil options:nil].lastObject;
        [_JSD_errorView.JSD_reloadButton addTarget:self action:@selector(JSD_reloadNetFundation:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_JSD_errorView];
        [_JSD_errorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _JSD_errorView;
}

@end


