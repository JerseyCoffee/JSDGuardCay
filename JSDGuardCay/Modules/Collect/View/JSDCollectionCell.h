//
//  JSDCollectionCell.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "MDCCollectionViewCell.h"
#import "JSDCollectViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDCollectionCell : MDCCollectionViewCell

@property (strong, nonatomic) JSDCayTypeDetailsModel *model;

@end

NS_ASSUME_NONNULL_END
