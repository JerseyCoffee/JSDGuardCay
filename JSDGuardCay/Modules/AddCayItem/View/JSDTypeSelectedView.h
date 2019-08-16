//
//  JSDTypeSelectedView.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDTypeSelectedView : JSDBaseView

@property (nonatomic, assign) NSInteger selectedType;
@property (nonatomic, copy) NSString* title;

- (void)setTitle:(NSString* )title number:(NSInteger)number;

@end

NS_ASSUME_NONNULL_END
