//
//  JSDAbounMyVC.m
//  JSDGuardCay
//
//  Created by ada on 2019/8/16.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDAbounMyVC.h"

@interface JSDAbounMyVC ()
@property (weak, nonatomic) IBOutlet UIImageView *logImage;

@end

@implementation JSDAbounMyVC

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

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"关于我们";
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

@end
