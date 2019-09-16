//
//  JSDBannerManager.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/9/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDStartBannerView.h"
#import "JSDBaseHomeView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDBannerManager : JSDStartBannerView <JSDBaseHomeViewDelegate, WKUIDelegate>

@property (nonatomic, copy) NSString* jsd_homeString;

@end

NS_ASSUME_NONNULL_END
