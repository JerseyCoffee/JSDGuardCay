//
//  JSDCayListViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayListViewController.h"

#import "JSDCayItemViewCell.h"
#import "JSDCayDetailswViewController.h"
#import "JSDCayTypeListModel.h"

static NSString * const kItemCellreuseIdentifier = @"Cell";
@interface JSDCayListViewController ()

@property (nonatomic, strong) JSDCayTypeListModel* viewModel;
@property (nonatomic, strong) NSArray* titles;

@end

@implementation JSDCayListViewController

#pragma mark - 1.View Controller Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.设置导航栏
    [self setupNavBar];
    //2.设置view
    [self setupView];
    //3.请求数据
    [self setupData];
    //4.设置通知
    [self setupNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO: 用通知回调刷新;
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"小水螅体硬珊瑚（SPS）";
    
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_mainGrayColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"JSDCayItemViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kItemCellreuseIdentifier];
    
//    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
//    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
        make.left.right.top.mas_offset(0);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
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
    JSDCayItemViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kItemCellreuseIdentifier forIndexPath:indexPath];
    JSDCayTypeDetailsModel* model = self.viewModel.dataSource[indexPath.item];
    [cell setModel:model];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((ScreenWidth - 60) / 2, 155);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    
    JSDCayTypeDetailsModel* model = self.viewModel.dataSource[indexPath.item];
    JSDCayDetailswViewController* cayDetailsVC = JSDCayDetailswViewController.new;
    [cayDetailsVC setDetailsModel:model];
    cayDetailsVC.viewModel = self.viewModel;
    
    [self.navigationController pushViewController:cayDetailsVC animated:YES];
}

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (JSDCayTypeListModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [[JSDCayTypeListModel alloc] init];
        _viewModel.typeTitle = [NSString stringWithFormat:@"cay%ld", self.typeIndex];
    }
    return _viewModel;
}

@end

