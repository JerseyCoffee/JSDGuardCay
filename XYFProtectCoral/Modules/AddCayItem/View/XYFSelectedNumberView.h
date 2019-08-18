//
//  XYFSelectedNumberView.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "XYFBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYFSelectedNumberView : XYFBaseView

@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UILabel* subtitleLabel;

- (void)setTitle:(NSString* )title number:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
