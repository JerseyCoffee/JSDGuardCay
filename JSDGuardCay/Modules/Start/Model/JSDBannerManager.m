//
//  JSDBannerManager.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/9/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBannerManager.h"

@implementation JSDBannerManager

#pragma mark -- JSDBaseHomeViewDelegate

- (void)jsd_onTouchHome:(id)sender {
    
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: self.jsd_homeString]]];
}
- (void)jsd_onTouchGoBack:(id)sender {
    
    if (self.canGoBack) {
        [self goBack];
    }
}
- (void)jsd_onTouchGoNext:(id)sender {
    
    if (self.canGoForward) {
        [self goForward];
    }
    
}
- (void)jsd_onTouchReloadView:(id)sender {
    
    [self reload];
    
}
- (void)jsd_onTouchCleanMemory:(id)sender {
    
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"缓存已清理" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:action];
        [JSDAppWindow.rootViewController presentViewController: alertVC animated:YES completion:nil];
    }];
}


@end
