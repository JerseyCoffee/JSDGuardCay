//
//  JSDHomeViewModel.h
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JSDHomeModel;
@interface JSDHomeViewModel : NSObject

@property (nonatomic, strong) NSArray<JSDHomeModel *>* dataSource;

@end

@interface JSDHomeModel : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* imageName;

@end

NS_ASSUME_NONNULL_END
