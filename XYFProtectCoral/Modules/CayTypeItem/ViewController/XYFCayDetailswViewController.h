//
//  JSDCayDetailsViewController.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "XYFBaseViewController.h"

#import "XYFCayTypeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYFCayDetailswViewController : XYFBaseViewController

@property (nonatomic, strong) JSDCayTypeDetailsModel* detailsModel;
@property (nonatomic, strong) XYFCayTypeListModel* viewModel;

@end

NS_ASSUME_NONNULL_END
