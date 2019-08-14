//
//  UIFont+JSDTool.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (JSDTool)

+ (UIFont* )jsd_fontSize:(CGFloat )size;
+ (UIFont* )jsd_fontSize:(CGFloat )size fontName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
