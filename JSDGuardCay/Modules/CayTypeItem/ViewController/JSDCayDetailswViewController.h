//
//  JSDCayDetailsViewController.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDBaseViewController.h"

#import "JSDCayTypeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDCayDetailswViewController : JSDBaseViewController

@property (nonatomic, strong) JSDCayTypeDetailsModel* detailsModel;
@property (nonatomic, strong) JSDCayTypeListModel* viewModel;

@end

NS_ASSUME_NONNULL_END
