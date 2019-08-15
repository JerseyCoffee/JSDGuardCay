//
//  JSDAddItemViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDAddItemViewController.h"
#import "JSDTextFieldView.h"

@interface JSDAddItemViewController ()

@property (weak, nonatomic) IBOutlet UIButton *selectedPhotoButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentview;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UIView *namContentView;
@property (weak, nonatomic) IBOutlet UIView *typeContentView;
@property (weak, nonatomic) IBOutlet UIView *parameterContenView;
@property (weak, nonatomic) IBOutlet UIView *infoContentView;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;

@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation JSDAddItemViewController

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
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(didTapBack:)];
    UIImage *backImage = [UIImage imageNamed:@"back"];
    backButton.image = backImage;
    backButton.tintColor = [UIColor jsd_colorWithHexString:@"#333333"];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)didTapBack:(id)button {
    
    self.tabBarController.selectedIndex = 0;
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"添加珊瑚";
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    
    self.scrollView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.scrollContentview.backgroundColor = [UIColor jsd_maiBackgroundColor];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchTap:)];
    [self.scrollContentview addGestureRecognizer:tapGesture];
    
    self.cayImageView.layer.cornerRadius = 40;
    self.cayImageView.layer.masksToBounds = YES;
    self.cayImageView.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.cayImageView.image = [UIImage imageNamed:@"selected_photo"];
    self.cayImageView.contentMode = UIViewContentModeCenter;
    
    self.namContentView.backgroundColor = [UIColor whiteColor];
    for (UILabel* subView in self.namContentView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            subView.text = nil;
            subView.backgroundColor = [UIColor jsd_colorWithHexString:@"#EEEEEE"];
        }
    }
    
    self.typeContentView.backgroundColor = [UIColor whiteColor];
    
    self.parameterContenView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel* subView in self.parameterContenView.subviews) {
        if ([subView isKindOfClass:[UILabel class]]) {
            subView.text = nil;
            subView.backgroundColor = [UIColor jsd_colorWithHexString:@"#EEEEEE"];
        }
    }
    
    self.infoTextView.font = [UIFont jsd_fontSize:18];
    self.infoTextView.text = nil;
    
    self.saveButton.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.saveButton.layer.cornerRadius = 24;
    self.saveButton.layer.masksToBounds = YES;
    [self.saveButton.titleLabel setFont:[UIFont jsd_fontSize:17]];
    [self.saveButton.titleLabel setTextColor:[UIColor whiteColor]];
    [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
}

- (void)reloadView {
    
}

#pragma mark - 3.Request Data

- (void)setupData {
    
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

#pragma mark - 5.Event Response

- (IBAction)selectedPhoto:(UIButton *)sender {
    
    
}

- (void)onTouchTap:(id)sender {
    
    [self.scrollContentview endEditing:YES];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end
