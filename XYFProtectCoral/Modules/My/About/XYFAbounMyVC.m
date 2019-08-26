#import "XYFAbounMyVC.h"
@interface XYFAbounMyVC ()
@property (weak, nonatomic) IBOutlet UIImageView *logImage;
@end
@implementation XYFAbounMyVC
#pragma mark - 1.View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self xyf_xyf_setupNavBar];
    [self xyf_xyf_setupView];
    [self xyf_xyf_setupData];
    [self xyf_xyf_setupNotification];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - 2.SettingView and Style
- (void)xyf_xyf_setupNavBar {
    self.title = @"Acerca de nosotros";
}
- (void)xyf_xyf_setupView {
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.logImage.layer.cornerRadius = 10;
    self.logImage.layer.masksToBounds = YES;
}
- (void)reloadView {
}
#pragma mark - 3.Request Data
- (void)xyf_xyf_setupData {
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
#pragma mark - 5.Event Response
#pragma mark - 6.Private Methods
- (void)xyf_xyf_setupNotification {
}
#pragma mark - 7.GET & SET
- (void)sp_checkInfo {
    NSLog(@"Get Info Failed");
}
- (void)sp_getUsersMostLiked {
    NSLog(@"Continue");
}
- (void)sp_checkDefualtSetting {
    NSLog(@"Get User Succrss");
}
- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}

- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Check your Network");
}
@end
