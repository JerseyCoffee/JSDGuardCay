//
//  XYFSnackbarManager.m
//  JSDGuardCay
//
//  Created by ada on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "XYFSnackbarManager.h"

@implementation XYFSnackbarManager

+ (void)showSnackMessage:(NSString *)text {
    
    MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
    MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText:text];
    message.duration = 1;
    
    [manager showMessage:message];
}

@end
