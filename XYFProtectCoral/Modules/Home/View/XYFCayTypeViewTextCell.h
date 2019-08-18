//
//  XYFCayTypeViewTextCell.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "MDCCollectionViewTextCell.h"
#import "XYFHomeViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYFCayTypeViewTextCell : MDCCollectionViewCell

@property (nonatomic, strong) JSDHomeModel* model;

@end

NS_ASSUME_NONNULL_END
