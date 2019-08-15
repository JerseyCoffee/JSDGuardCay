//
//  JSDCollectViewModel.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSDCayTypeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JSDCollectViewModel : NSObject

@property (nonatomic, strong) NSMutableArray<JSDCayTypeDetailsModel* >* dataSource;

- (void)addCollect:(JSDCayTypeDetailsModel *)model;
- (void)cancelCollect:(JSDCayTypeDetailsModel *)model;
- (void)update;

@end

NS_ASSUME_NONNULL_END
