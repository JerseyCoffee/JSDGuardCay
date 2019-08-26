#import "XYFBaseViewController.h"
@implementation XYFBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController.viewControllers.count > 1) {
        [self xyf_setupNavigation];
    }
}
- (void)xyf_setupNavigation {
    self.fd_interactivePopDisabled = NO;
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(didTapBack:)];
    UIImage *backImage = [UIImage imageNamed:@"back"];
    backButton.image = backImage;
    backButton.tintColor = [UIColor jsd_colorWithHexString:@"#333333"];
    self.navigationItem.leftBarButtonItem = backButton;
}
- (void)didTapBack:(id)button {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing: YES];
}
- (void)sp_getUsersMostLiked:(NSString *)followCount {
    NSLog(@"Continue");
}
- (void)sp_getUserFollowSuccess:(NSString *)string {
    NSLog(@"Get Info Success");
}
- (void)sp_getUserName:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}
- (void)sp_checkDefualtSetting:(NSString *)string {
    NSLog(@"Get Info Success");
}
- (void)sp_getUsersMostFollowerSuccess:(NSString *)mediaCount {
    NSLog(@"Check your Network");
}
- (void)sp_upload:(NSString *)string {
    NSLog(@"Get Info Success");
}
@end
