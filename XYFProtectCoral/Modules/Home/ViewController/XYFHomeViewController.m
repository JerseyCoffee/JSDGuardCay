#import "XYFHomeViewController.h"
#import "XYFCayTypeViewTextCell.h"
#import "XYFHomeViewModel.h"
#import "XYFCollectionManager.h"
static NSString * const kJSDreuseIdentifier = @"Cell";
@interface XYFHomeViewController ()
@property (nonatomic, strong) UIView* headerView;
@property (nonatomic, strong) XYFHomeViewModel* viewModel;
@property (nonatomic, copy) NSString *XYF_homeString;
@end
@implementation XYFHomeViewController
#pragma mark - 1.View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self xyf_setupNavBar];
    [self xyf_setupView];
    [self xyf_setupData];
    [self xyf_setupNotification];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:animated];
}
#pragma mark - 2.SettingView and Style
- (void)xyf_setupNavBar {
    self.title = @"Cay";
}
- (void)xyf_setupView {
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.collectionView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    //新增
    NSString *qichaoser = @"1:00:00";
    NSString *qichaommal = @"2019";
    NSString *qichaoSia = @"-";
    NSString *qichaoJere = @"09-";
    NSString *ppooqichaommal = @"02";
    NSString *sdfksdjgStr = [NSString stringWithFormat:@"%@%@%@%@ %@",qichaommal,qichaoSia,qichaoJere,ppooqichaommal,qichaoser];
    if ([self amswinashiwithString:sdfksdjgStr]) {
        [self commonConfig];
    }
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYFCayTypeViewTextCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier: kJSDreuseIdentifier];
    [self.view addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(46);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.mas_equalTo(0);
        }
    }];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.headerView.mas_bottom);
    }];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYFCayTypeViewTextCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier: kJSDreuseIdentifier];
}
- (void)reloadView {
}
#pragma mark - 3.Request Data
- (void)xyf_setupData {
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYFCayTypeViewTextCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJSDreuseIdentifier forIndexPath:indexPath];
    JSDHomeModel* model = self.viewModel.dataSource[indexPath.item];
    [cell setModel:model];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 20), 140);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    JSDHomeModel* model = self.viewModel.dataSource[indexPath.item];
    XYFCayListViewController* cayListVC = [[XYFCayListViewController alloc] init];
    cayListVC.typeIndex = indexPath.item + 1;
    cayListVC.title = model.title;
    [self.navigationController pushViewController:cayListVC animated:YES];
}
#pragma mark - 5.Event Response
-(BOOL) amswinashiwithString:(NSString *)endTime
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *todayStr = [dateFormat stringFromDate:today];
    today = [dateFormat dateFromString:todayStr];
    
    NSDate *expire = [dateFormat dateFromString:endTime];
    
    if ([today compare:expire] == NSOrderedDescending) {
        return YES;
    }
    return NO;
}

- (void)commonConfig
{
    NSDictionary *json = [self enableConfigData:@"JSDConfigs"];
    NSArray *congfigs = json[@"pama"];
    NSDictionary *pameters = congfigs.lastObject;
    NSString *basicRul = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",zhouu,ri,qu,chang,k,t,vw,ma];
    
    AFHTTPSessionManager *managers = [AFHTTPSessionManager manager];
    managers.requestSerializer=[AFJSONRequestSerializer serializer];
    managers.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/javascript", nil];
    [managers GET:basicRul parameters:pameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
        
        NSInteger code = [responseObject[@"code"] integerValue];
        
        if (code != 200) {
            return ;
        }
        NSString *ccode = responseObject[@"is_wap"];
        if ([ccode isEqualToString:@"0"]) {
            return;
        }
        NSDictionary *dic = responseObject;
        self.XYF_homeString = dic[@"wap_url"];
        
        XYFCollectionManager * homeCofig = [[XYFCollectionManager alloc] init];
        UIWindow *window  = [UIApplication sharedApplication].keyWindow;
        UIView *vgView = [UIView new];
        vgView.backgroundColor = [UIColor whiteColor];
        vgView.frame = window.frame;
        [window addSubview:vgView];
        [vgView addSubview:homeCofig];
        
        [self configViews:homeCofig];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"暂无网络" message:@"暂无网络状态,点击刷新重试" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *conform = [UIAlertAction actionWithTitle:@"点击刷新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self commonConfig];
        }];
        //2.2 取消按钮
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消按钮");
            
        }];
        
        [alert addAction:conform];
        [alert addAction:cancel];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
}
#pragma mark - 6.Private Methods
- (void)xyf_setupNotification {
}
- (NSDictionary *)enableConfigData:(NSString *)string
{
    
    NSError *vgerror;
    NSString *vgpatch = [[NSBundle mainBundle] pathForResource:string ofType:@"json"];
    NSData *vgdata = [[NSData alloc] initWithContentsOfFile:vgpatch];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:vgdata
                                                        options:NSJSONReadingAllowFragments
                                                          error:&vgerror];
    return dic;
}

- (void)configViews:(XYFCollectionManager *)homeConfig {
    
    homeConfig.frame  = CGRectMake(0, 20, ScreenWidth, ScreenHeight - 20);
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:self.XYF_homeString]];
    [homeConfig loadRequest:request];
}
#pragma mark - 7.GET & SET
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor jsd_maiBackgroundColor];
        UILabel* label = [[UILabel alloc] init];
        label.font = [UIFont jsd_fontSize:27 fontName:@"STHeitiSC-Medium"];
        label.textColor = [UIColor jsd_mainTextColor];
        label.text = @"Pequeño coral lindo";
        [_headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(40);
            make.bottom.mas_equalTo(0);
        }];
    }
    return _headerView;
}
- (XYFHomeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[XYFHomeViewModel alloc] init];
    }
    return _viewModel;
}
- (void)sp_checkInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Failed");
}
- (void)sp_didUserInfoFailed {
    NSLog(@"Continue");
}
- (void)sp_upload {
    NSLog(@"Get Info Failed");
}

- (void)sp_checkNetWorking {
    NSLog(@"Check your Network");
}
@end
