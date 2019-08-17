//
//  JSDMyCenterViewModel.h
//  JerseyCoffee
//
//  Created by ada on 2019/7/25.
//  Copyright © 2019 jerseyCafe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JSDMyCenterModel;
@class JSDUserModel;

@interface JSDMyCenterViewModel : NSObject

@property (strong, nonatomic) NSArray<JSDMyCenterModel* > *listArray;
@property (strong, nonatomic) JSDUserModel *userData;

- (void)setupUserData;
- (void)saveUserData;

@end

@interface JSDUserModel : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *userImageView;

@end

@interface JSDMyCenterModel : NSObject

@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *detail;
@property (copy, nonatomic) NSString *route;
@property (copy, nonatomic) NSString *subTitle;

@end

NS_ASSUME_NONNULL_END
