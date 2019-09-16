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
    
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"是否退出" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* jsd_cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction* jsd_affirmAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [UIView animateWithDuration:1.0f animations:^{
            JSDAppWindow.alpha = 0;
            JSDAppWindow.frame = CGRectMake(0, JSDAppWindow.bounds.size.width, 0, 0);
            
        } completion:^(BOOL finished) {
            
            exit(0);
            
        }];
    }];
    [alertVC addAction:jsd_cancelAction];
    [alertVC addAction:jsd_affirmAction];
    [JSDAppWindow.rootViewController presentViewController: alertVC animated:YES completion:nil];
    
   
}


@end
