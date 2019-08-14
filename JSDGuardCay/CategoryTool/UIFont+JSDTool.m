//
//  UIFont+JSDTool.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "UIFont+JSDTool.h"

static NSString* const kJSDFontName = @"Helvetica Neue";

@implementation UIFont (JSDTool)

+ (UIFont *)jsd_fontSize:(CGFloat)size {
    
    UIFont* font = [UIFont jsd_fontSize:size fontName:kJSDFontName];
    
    return font;
}

+ (UIFont *)jsd_fontSize:(CGFloat)size fontName:(NSString *)name {
    
    UIFont *font = [UIFont fontWithName:name size:size];
    
    return font;
}

@end
