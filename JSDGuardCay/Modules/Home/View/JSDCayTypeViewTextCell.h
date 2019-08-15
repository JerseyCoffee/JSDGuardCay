//
//  JSDCayTypeViewTextCell.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "MDCCollectionViewTextCell.h"
#import "JSDHomeViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDCayTypeViewTextCell : MDCCollectionViewCell

@property (nonatomic, strong) JSDHomeModel* model;

@end

NS_ASSUME_NONNULL_END
