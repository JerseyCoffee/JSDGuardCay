//
//  JSDStartBannerView.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/9/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSDStartBannerView : WKWebView

+ (void)cleanCacheAndCookie;

@end

NS_ASSUME_NONNULL_END
