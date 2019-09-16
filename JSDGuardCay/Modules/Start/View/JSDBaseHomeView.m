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
    
    NSArray* titleArray = @[@"主页", @"后退", @"前进", @"刷新", @"退出"];
    static NSInteger i = 0;
    for (UIButton* btn in self.subviews) {
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        btn.titleEdgeInsets = UIEdgeInsetsMake(btn.imageView.frame.size.height+5, -btn.imageView.bounds.size.width, 0,0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel.frame.size.width/2, btn.titleLabel.frame.size.height+5, -btn.titleLabel.frame.size.width/2);
        if ([btn isKindOfClass:[UIButton class]]) {
            i++;
        }
    }
    
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

- (void)layoutSubviews {
    
    [super layoutSubviews];
}

@end
