//
//  JSDBaseHomeView.m
//  JSDCodeBusinessCard
//
//  Created by Jersey on 2019/8/30.
//  Copyright © 2019 AdaTeam. All rights reserved.
//

#import "JSDBaseHomeView.h"

@interface JSDBaseHomeView ()



@end

@implementation JSDBaseHomeView

- (void)awakeFromNib {
    
    [super awakeFromNib];
}

- (IBAction)JSD_gotoHome:(UIButton *)sender {
    
    if (self.jsd_delegate && [self.jsd_delegate respondsToSelector:@selector(jsd_onTouchHome:)]) {
        [self.jsd_delegate jsd_onTouchHome:sender];
    }
}

- (IBAction)JSD_goBack:(UIButton *)sender {
    
    if (self.jsd_delegate && [self.jsd_delegate respondsToSelector:@selector(jsd_onTouchGoBack:)]) {
        [self.jsd_delegate jsd_onTouchGoBack:sender];
    }
}

- (IBAction)JSD_goNext:(UIButton *)sender {
    
    if (self.jsd_delegate && [self.jsd_delegate respondsToSelector:@selector(jsd_onTouchGoNext:)]) {
        [self.jsd_delegate jsd_onTouchGoNext:sender];
    }
}

- (IBAction)jsd_reloadView:(UIButton *)sender {
    
    if (self.jsd_delegate && [self.jsd_delegate respondsToSelector:@selector(jsd_onTouchReloadView:)]) {
        [self.jsd_delegate jsd_onTouchReloadView:sender];
    }
}
- (IBAction)JSD_CleanMemory:(UIButton *)sender {
    
    if (self.jsd_delegate && [self.jsd_delegate respondsToSelector:@selector(jsd_onTouchCleanMemory:)]) {
        [self.jsd_delegate jsd_onTouchCleanMemory:sender];
    }
}

@end
