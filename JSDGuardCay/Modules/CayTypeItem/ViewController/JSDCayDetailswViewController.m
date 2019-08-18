//
//  JSDCayDetailsViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDCayDetailswViewController.h"

#import "JSDCayDetailssView.h"
#import "JSDCollectViewModel.h"

@interface JSDCayDetailswViewController ()

@property (nonatomic, strong) JSDCayDetailssView* detailsView;

@end

@implementation JSDCayDetailswViewController

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
            // Fallback on earlier versions
            make.bottom.mas_equalTo(0);
        }
    }];
}

- (void)reloadView {
    
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    //设置
    [self.detailsView setDetailsModel:self.detailsModel];
    
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

- (void)onTouchCollect:(UIButton* )sender {
    
    if (self.viewModel) { //收藏页,详情无取消收藏功能
        JSDCollectViewModel* collectManager = [[JSDCollectViewModel alloc] init];
        [self.viewModel collectModel:self.detailsModel];
        if (sender.isSelected) {
            //收藏
            [collectManager cancelCollect:self.detailsModel];
            [JSDSnackbarManager showSnackMessage:@"Colección cancelada"];
        } else {
            //收藏
            [collectManager addCollect:self.detailsModel];
            [JSDSnackbarManager showSnackMessage:@"Agregado a favoritos"];
        }
    }
    sender.selected = !sender.isSelected;
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

- (JSDCayDetailssView *)detailsView {
    
    if (!_detailsView){
        
        _detailsView = [[NSBundle mainBundle] loadNibNamed:@"JSDCayDetailsView" owner:nil options:nil].lastObject;
    }
    return _detailsView;
}

@end

