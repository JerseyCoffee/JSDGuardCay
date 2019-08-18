#import "XYFCayListViewController.h"
#import "XYFCayItemViewCell.h"
#import "XYFCayDetailswViewController.h"
#import "XYFCayTypeListModel.h"
static NSString * const kItemCellreuseIdentifier = @"Cell";
@interface XYFCayListViewController ()
@property (nonatomic, strong) XYFCayTypeListModel* viewModel;
@property (nonatomic, strong) NSArray* titles;
@end
@implementation XYFCayListViewController
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
}
- (void)setupView {
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    self.collectionView.backgroundColor = [UIColor jsd_mainGrayColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYFCayItemViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kItemCellreuseIdentifier];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_offset(0);
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
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"数量:%ld",self.viewModel.dataSource.count);
    return self.viewModel.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XYFCayItemViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kItemCellreuseIdentifier forIndexPath:indexPath];
    JSDCayTypeDetailsModel* model = self.viewModel.dataSource[indexPath.item];
    [cell setModel:model];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((ScreenWidth - 60) / 2, 155);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 10, 20);
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
    JSDCayTypeDetailsModel* model = self.viewModel.dataSource[indexPath.item];
    XYFCayDetailswViewController* cayDetailsVC = XYFCayDetailswViewController.new;
    [cayDetailsVC setDetailsModel:model];
    cayDetailsVC.viewModel = self.viewModel;
    [self.navigationController pushViewController:cayDetailsVC animated:YES];
}
#pragma mark - 5.Event Response
#pragma mark - 6.Private Methods
- (void)setupNotification {
}
#pragma mark - 7.GET & SET
- (XYFCayTypeListModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[XYFCayTypeListModel alloc] init];
        _viewModel.typeTitle = [NSString stringWithFormat:@"cay%ld", self.typeIndex];
    }
    return _viewModel;
}
@end
