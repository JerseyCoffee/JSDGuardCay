//
//  XYFCollectVC.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

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
    
    self.title = @"Mi coleccion";
}

- (void)setupView {
    
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

- (void)setupData {
    
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

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 15, 10);
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
    
    XYFCayDetailswViewController* cayDetailsVC = XYFCayDetailswViewController.new;
    [cayDetailsVC setDetailsModel:self.viewModel.dataSource[indexPath.item]];
    
    [self.navigationController pushViewController:cayDetailsVC animated:YES];
}

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
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

@end

