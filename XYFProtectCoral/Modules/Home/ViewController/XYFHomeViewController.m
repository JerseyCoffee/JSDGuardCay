//
//  XYFHomeViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/14.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "XYFHomeViewController.h"
#import "XYFCayTypeViewTextCell.h"
#import "XYFHomeViewModel.h"

static NSString * const kJSDreuseIdentifier = @"Cell";

@interface XYFHomeViewController ()

@property (nonatomic, strong) UIView* headerView;
@property (nonatomic, strong) XYFHomeViewModel* viewModel;

@end

@implementation XYFHomeViewController

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
    
    self.navigationController.navigationBar.hidden = YES;
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:animated];
    
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"Cay";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.collectionView.backgroundColor = [UIColor jsd_maiBackgroundColor];
//
    [self.collectionView registerNib:[UINib nibWithNibName:@"XYFCayTypeViewTextCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier: kJSDreuseIdentifier];
//
//    [self.view addSubview:self.collectionView];
//
    
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
    
    XYFCayTypeViewTextCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:kJSDreuseIdentifier forIndexPath:indexPath];
    JSDHomeModel* model = self.viewModel.dataSource[indexPath.item];
    [cell setModel:model];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake((ScreenWidth - 20), 140);
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
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
    JSDHomeModel* model = self.viewModel.dataSource[indexPath.item];
    XYFCayListViewController* cayListVC = [[XYFCayListViewController alloc] init];
    cayListVC.typeIndex = indexPath.item + 1;
    cayListVC.title = model.title;
    [self.navigationController pushViewController:cayListVC animated:YES];
}

#pragma mark - 5.Event Response

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (UIView *)headerView {
    
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor jsd_maiBackgroundColor];
        UILabel* label = [[UILabel alloc] init];
        label.font = [UIFont jsd_fontSize:27 fontName:@"STHeitiSC-Medium"];
        label.textColor = [UIColor jsd_mainTextColor];
        label.text = @"Protegiendo corales";
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

@end
