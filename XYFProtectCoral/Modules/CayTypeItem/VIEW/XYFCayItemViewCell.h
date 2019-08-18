//
//  XYFCayItemViewCell.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "MDCCollectionViewCell.h"

#import "XYFCayTypeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYFCayItemViewCell : MDCCollectionViewCell

@property (nonatomic, strong) JSDCayTypeDetailsModel* model;

@end

NS_ASSUME_NONNULL_END
