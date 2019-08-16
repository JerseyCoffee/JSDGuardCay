//
//  JSDSelectedNumberView.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDSelectedNumberView : JSDBaseView

@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UILabel* subtitleLabel;

- (void)setTitle:(NSString* )title number:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
