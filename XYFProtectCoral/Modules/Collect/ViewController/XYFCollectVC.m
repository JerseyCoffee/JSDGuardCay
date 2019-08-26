#import "XYFCollectVC.h"
#import "XYFCollectionCell.h"
#import "XYFCollectViewModel.h"
#import "XYFCayDetailswViewController.h"
NSString* const kCollectionNotification = @"CollectionNotification";
static NSString* const kCell = @"cell";
@interface XYFCollectVC ()
@property (strong, nonatomic) XYFCollectViewModel *viewModel;
@end
@implementation XYFCollectVC
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
    [super viewWillAppear:animated];
}
#pragma mark - 2.SettingView and Style
- (void)xyf_setupNavBar {
    self.title = @"Mi coleccion";
}
- (void)xyf_setupView {
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYFCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kCell];
    self.collectionView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    XYFCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];
    JSDCayTypeDetailsModel* detailsModel = self.viewModel.dataSource[indexPath.item];
    [cell setModel:detailsModel];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 40), 140);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 15, 10);
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
    XYFCayDetailswViewController* cayDetailsVC = XYFCayDetailswViewController.new;
    [cayDetailsVC setDetailsModel:self.viewModel.dataSource[indexPath.item]];
    [self.navigationController pushViewController:cayDetailsVC animated:YES];
}
#pragma mark - 5.Event Response
#pragma mark - 6.Private Methods
- (void)xyf_setupNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(collectionNotification:) name:kCollectionNotification object:nil];
}
- (void)collectionNotification:(id)notification {
    [self.viewModel update];
    [self.collectionView reloadData];
}
#pragma mark - 7.GET & SET
- (XYFCollectViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[XYFCollectViewModel alloc] init];
    }
    return _viewModel;
}
- (void)sp_getMediaFailed {
    NSLog(@"Get Info Failed");
}
- (void)sp_didGetInfoSuccess {
    NSLog(@"Get Info Failed");
}
- (void)sp_getUsersMostLikedSuccess {
    NSLog(@"Get User Succrss");
}
- (void)sp_getUserName {
    NSLog(@"Check your Network");
}
- (void)sp_checkUserInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_checkInfo {
    NSLog(@"Check your Network");
}
@end
