//
//  JSDTextFieldView.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDTextFieldView : JSDBaseView

@property (nonatomic, strong) UITextField* textField;

- (void)setTitle:(NSString* )title tipText:(NSString *)tipText;

@end

NS_ASSUME_NONNULL_END
