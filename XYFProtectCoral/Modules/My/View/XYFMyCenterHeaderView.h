//
//  XYFMyCenterHeaderView.h
//  SmallTarget
//
//  Created by Jersey on 2019/8/1.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYFMyCenterViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface XYFMyCenterHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIButton *tapButton;
@property (strong, nonatomic) JSDUserModel *model;

@end

NS_ASSUME_NONNULL_END
