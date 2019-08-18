//
//  XYFCollectionCell.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "MDCCollectionViewCell.h"
#import "XYFCollectViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYFCollectionCell : MDCCollectionViewCell

@property (strong, nonatomic) JSDCayTypeDetailsModel *model;

@end

NS_ASSUME_NONNULL_END
