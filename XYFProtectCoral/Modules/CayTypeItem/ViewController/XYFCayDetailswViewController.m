#import "XYFCayDetailswViewController.h"
#import "XYFCayDetailssView.h"
#import "XYFCollectViewModel.h"
@interface XYFCayDetailswViewController ()
@property (nonatomic, strong) XYFCayDetailssView* detailsView;
@end
@implementation XYFCayDetailswViewController
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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
#pragma mark - 2.SettingView and Style
- (void)setupNavBar {
    self.title = self.detailsModel.cnName;
    UIButton* collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [collectButton setImage:[UIImage imageNamed:@"collect_normal"] forState:UIControlStateNormal];
    [collectButton setImage:[UIImage imageNamed:@"collect_selected"] forState:UIControlStateSelected];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:collectButton];
    [collectButton addTarget:self action:@selector(onTouchCollect:) forControlEvents:UIControlEventTouchUpInside];
    collectButton.selected = self.detailsModel.collect;
}
- (void)setupView {
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    [self.view addSubview:self.detailsView];
    [self.detailsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(0);
        }
    }];
}
- (void)reloadView {
}
#pragma mark - 3.Request Data
- (void)setupData {
    [self.detailsView setDetailsModel:self.detailsModel];
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
#pragma mark - 5.Event Response
- (void)onTouchCollect:(UIButton* )sender {
    if (self.viewModel) { 
        XYFCollectViewModel* collectManager = [[XYFCollectViewModel alloc] init];
        [self.viewModel collectModel:self.detailsModel];
        if (sender.isSelected) {
            [collectManager cancelCollect:self.detailsModel];
            [XYFSnackbarManager showSnackMessage:@"Colección cancelada"];
        } else {
            [collectManager addCollect:self.detailsModel];
            [XYFSnackbarManager showSnackMessage:@"Agregado a favoritos"];
        }
    }
    sender.selected = !sender.isSelected;
}
#pragma mark - 6.Private Methods
- (void)setupNotification {
}
#pragma mark - 7.GET & SET
- (XYFCayDetailssView *)detailsView {
    if (!_detailsView){
        _detailsView = [[NSBundle mainBundle] loadNibNamed:@"JSDCayDetailsView" owner:nil options:nil].lastObject;
    }
    return _detailsView;
}
- (void)sp_getMediaData {
    NSLog(@"Continue");
}
@end
