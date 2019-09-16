//
//  JSDBaseHomeView.h
//  JSDCodeBusinessCard
//
//  Created by Jersey on 2019/8/30.
//  Copyright © 2019 AdaTeam. All rights reserved.
//

#import "JSDBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol JSDBaseHomeViewDelegate <NSObject>

- (void)jsd_onTouchHome:(id)sender;
- (void)jsd_onTouchGoBack:(id)sender;
- (void)jsd_onTouchGoNext:(id)sender;
- (void)jsd_onTouchReloadView:(id)sender;
- (void)jsd_onTouchCleanMemory:(id)sender;

@end

@interface JSDBaseHomeView : JSDBaseView

@property (nonatomic, weak) id<JSDBaseHomeViewDelegate> jsd_delegate;

@end

NS_ASSUME_NONNULL_END
