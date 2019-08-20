#import "XYFAbounMyVC.h"
@interface XYFAbounMyVC ()
@property (weak, nonatomic) IBOutlet UIImageView *logImage;
@end
@implementation XYFAbounMyVC
#pragma mark - 1.View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupView];
    [self setupData];
    [self setupNotification];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - 2.SettingView and Style
- (void)setupNavBar {
    self.title = @"Acerca de nosotros";
}
- (void)setupView {
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.logImage.layer.cornerRadius = 10;
    self.logImage.layer.masksToBounds = YES;
}
- (void)reloadView {
}
#pragma mark - 3.Request Data
- (void)setupData {
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
#pragma mark - 5.Event Response
#pragma mark - 6.Private Methods
- (void)setupNotification {
}
#pragma mark - 7.GET & SET
- (void)sp_checkInfo {
    NSLog(@"Get Info Failed");
}
@end
