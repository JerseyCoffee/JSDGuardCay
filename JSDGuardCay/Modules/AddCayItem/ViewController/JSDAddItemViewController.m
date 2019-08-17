//
//  JSDAddItemViewController.m
//  JSDGuardCay
//
//  Created by Jersey on 2019/8/15.
//  Copyright © 2019 JerseyCafe. All rights reserved.
//

#import "JSDAddItemViewController.h"
#import "JSDTextFieldView.h"
#import "JSDSelectedNumberView.h"
#import "JSDTypeSelectedView.h"
#import "JSDCayTypeListModel.h"

@interface JSDAddItemViewController () <UITextViewDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *selectedPhotoButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentview;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UIView *namContentView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *cnTextFieldView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *enTextFieldView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *CNNameTextField;

@property (weak, nonatomic) IBOutlet JSDTypeSelectedView *typeContentView;
@property (weak, nonatomic) IBOutlet UIView *parameterContenView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *siyangNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *guangzhaoNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *shuiliuNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *yanduNumberView;
@property (weak, nonatomic) IBOutlet JSDSelectedNumberView *suanduNumberView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *xingqingTextFieldView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *chandiTextFieldView;
@property (weak, nonatomic) IBOutlet JSDTextFieldView *zhongshuTextFieldView;

@property (nonatomic, assign) BOOL havaImageView;
@property (weak, nonatomic) IBOutlet UIView *infoContentView;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *infoTipLabel;

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
    
    [self reloadView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TODO: 用通知回调刷新;
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(didTapBack:)];
    UIImage *backImage = [UIImage imageNamed:@"back"];
    backButton.image = backImage;
    backButton.tintColor = [UIColor jsd_colorWithHexString:@"#333333"];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didTapBack:(id)button {
    
    self.tabBarController.selectedIndex = 0;
}

#pragma mark - 2.SettingView and Style

- (void)setupNavBar {
    
    self.title = @"添加珊瑚";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(onTouchSave:)];
}

- (void)setupView {
    
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    
    self.scrollView.backgroundColor = [UIColor jsd_maiBackgroundColor];
    self.scrollView.delegate = self;
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
    self.infoTextView.delegate = self;
    
    self.infoTipLabel.text = @"简介";
    self.infoTipLabel.font = [UIFont jsd_fontSize:18];
    self.infoTipLabel.textColor = [UIColor jsd_detailTextColor];
    
    self.saveButton.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.saveButton.layer.cornerRadius = 24;
    self.saveButton.layer.masksToBounds = YES;
    [self.saveButton.titleLabel setFont:[UIFont jsd_fontSize:17]];
    [self.saveButton.titleLabel setTextColor:[UIColor whiteColor]];
    [self.saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(onTouchSave:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)reloadView {
 
    //刷新数据;
    self.havaImageView = NO;
    self.cayImageView.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.cayImageView.image = [UIImage imageNamed:@"selected_photo"];
    self.cayImageView.contentMode = UIViewContentModeCenter;
    
    [self.cnTextFieldView setTitle:@"名称" tipText:@"请输入名称(必填)"];
    [self.enTextFieldView setTitle:@"英文" tipText:@"请输入英文名称(必填)"];
    [self.CNNameTextField setTitle:@"学名" tipText:@"请输入学名(必填)"];
    
    [self.typeContentView setTitle:@"品种" number:0];
    
    [self.siyangNumberView setTitle:@"饲养难度" number:1];
    [self.guangzhaoNumberView setTitle:@"光照" number:1];
    [self.shuiliuNumberView setTitle:@"水流" number:1];
    [self.yanduNumberView setTitle:@"盐度" number:1];
    [self.suanduNumberView setTitle:@"酸碱度" number:1];
    
    [self.xingqingTextFieldView setTitle:@"性情" tipText:@"请输入性情(选填)"];
    [self.chandiTextFieldView setTitle:@"主要产地" tipText:@"请输入主要产地(选填)"];
    [self.zhongshuTextFieldView setTitle:@"种属" tipText:@"请输入种属(选填)"];
    
    [self.scrollView setScrollsToTop:YES];
}

#pragma mark - 3.Request Data

- (void)setupData {
    
    
}

#pragma mark - 4.UITableViewDataSource and UITableViewDelegate

- (void)textViewDidChange:(UITextView *)textView {
    
    if (textView.text.length) {
        self.infoTipLabel.text = nil;
    } else {
        self.infoTipLabel.text = @"简介:";
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.scrollContentview endEditing:YES];
}

#pragma mark - 5.Event Response

- (void)onTouchSave:(id)sender {
    
    BOOL havaCNTitle = JSDIsString(self.cnTextFieldView.textField.text); //
    BOOL havaENTitle = JSDIsString(self.enTextFieldView.textField.text);
    BOOL havaCNNameTitle = JSDIsString(self.CNNameTextField.textField.text);
    if (havaCNTitle && havaENTitle && havaCNNameTitle) {
        [self performSave];
    } else {
        [JSDSnackbarManager showSnackMessage:@"请填写必填字段(名称,英文,学名)"];
    }
}

- (void)performSave {
    
    //先判断选择品种;
    JSDCayTypeListModel* cayTypeListModel = [[JSDCayTypeListModel alloc] initWithTypeIndex:self.typeContentView.selectedType]; // 品种下标; 从 0 算起. 默认是 0
    JSDCayTypeDetailsModel* detailsModel = [[JSDCayTypeDetailsModel alloc] init];
    if (self.havaImageView) {
        
        //TODO: 未计算首次设置时间
        NSDate* date = [NSDate date];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM-dd HH:ss"];
        NSString* dateString = [formatter stringFromDate:date];
        [JSDPhotoManage savaImageView:self.cayImageView fileName:dateString];
        detailsModel.imageName = [NSString stringWithFormat:@"%@%@", kJSDPhotoImageFiles, dateString];
    }
    detailsModel.cnName = self.CNNameTextField.textField.text;
    detailsModel.enName = [NSString stringWithFormat:@"英文: %@", self.enTextFieldView.textField.text];
    detailsModel.cnNameTitle = [NSString stringWithFormat:@"学名: %@", self.CNNameTextField.textField.text];
    detailsModel.siyang = self.siyangNumberView.subtitleLabel.text;
    detailsModel.guangzhao = self.guangzhaoNumberView.subtitleLabel.text;
    detailsModel.shuiliu = self.shuiliuNumberView.subtitleLabel.text;
    detailsModel.yaoqiu = [NSString stringWithFormat:@"盐度 1.020-1.025; 酸碱度 8.1-8.4 "];
//    detailsModel.yaoqiu = [NSString stringWithFormat:@"盐度 %@;%@", self.yanduNumberView.subtitleLabel.text, self.suanduNumberView.subtitleLabel.text];
    detailsModel.yanse = @"紫色";
    detailsModel.xingqing = self.xingqingTextFieldView.textField.text;
    detailsModel.chandi = self.chandiTextFieldView.textField.text;
    detailsModel.zhongshu = self.zhongshuTextFieldView.textField.text;
    detailsModel.info = self.infoTextView.text;
    
    [cayTypeListModel addDetailsModel:detailsModel];
    
    [self addComplete];
}

- (void)addComplete {
    
    [JSDSnackbarManager showSnackMessage:@"成功添加珊瑚, 你可以到指定的品种中查看它"];
    //返回
    [self didTapBack:nil];
    
    //刷新数据
    [self reloadView];
}

- (IBAction)selectedPhoto:(UIButton *)sender {
    
    [JSDPhotoManage presentWithViewController:self sourceType:JSDImagePickerSourceTypePhotoLibrary finishPicking:^(UIImage * _Nonnull image) {
        self.cayImageView.contentMode = UIViewContentModeScaleToFill;
        self.cayImageView.image = image;
        self.havaImageView = YES;
    }];
}

- (void)onTouchTap:(id)sender {
    
    [self.scrollContentview endEditing:YES];
}

#pragma mark - 6.Private Methods

- (void)setupNotification {
    
}

#pragma mark - 7.GET & SET

@end
