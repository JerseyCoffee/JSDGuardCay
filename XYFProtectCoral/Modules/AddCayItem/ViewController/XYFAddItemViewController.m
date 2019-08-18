#import "XYFAddItemViewController.h"
#import "XYFTextFieldView.h"
#import "XYFSelectedNumberView.h"
#import "XYFTypeSelectedView.h"
#import "XYFCayTypeListModel.h"
@interface XYFAddItemViewController () <UITextViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *selectedPhotoButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentview;
@property (weak, nonatomic) IBOutlet UIImageView *cayImageView;
@property (weak, nonatomic) IBOutlet UIView *namContentView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *cnTextFieldView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *enTextFieldView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *CNNameTextField;
@property (weak, nonatomic) IBOutlet XYFTypeSelectedView *typeContentView;
@property (weak, nonatomic) IBOutlet UIView *parameterContenView;
@property (weak, nonatomic) IBOutlet XYFSelectedNumberView *siyangNumberView;
@property (weak, nonatomic) IBOutlet XYFSelectedNumberView *guangzhaoNumberView;
@property (weak, nonatomic) IBOutlet XYFSelectedNumberView *shuiliuNumberView;
@property (weak, nonatomic) IBOutlet XYFSelectedNumberView *yanduNumberView;
@property (weak, nonatomic) IBOutlet XYFSelectedNumberView *suanduNumberView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *xingqingTextFieldView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *chandiTextFieldView;
@property (weak, nonatomic) IBOutlet XYFTextFieldView *zhongshuTextFieldView;
@property (nonatomic, assign) BOOL havaImageView;
@property (weak, nonatomic) IBOutlet UIView *infoContentView;
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *infoTipLabel;
@end
@implementation XYFAddItemViewController
#pragma mark - 1.View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupView];
    [self setupData];
    [self setupNotification];
    [self reloadView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = YES;
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
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)didTapBack:(id)button {
    self.tabBarController.selectedIndex = 0;
}
#pragma mark - 2.SettingView and Style
- (void)setupNavBar {
    self.title = @"Añadir coral";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Guardar" style:UIBarButtonItemStyleDone target:self action:@selector(onTouchSave:)];
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
    self.infoTipLabel.text = @"Introduccion";
    self.infoTipLabel.font = [UIFont jsd_fontSize:18];
    self.infoTipLabel.textColor = [UIColor jsd_detailTextColor];
    self.saveButton.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.saveButton.layer.cornerRadius = 24;
    self.saveButton.layer.masksToBounds = YES;
    [self.saveButton.titleLabel setFont:[UIFont jsd_fontSize:17]];
    [self.saveButton.titleLabel setTextColor:[UIColor whiteColor]];
    [self.saveButton setTitle:@"Guardar" forState:UIControlStateNormal];
    [self.saveButton addTarget:self action:@selector(onTouchSave:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)reloadView {
    self.havaImageView = NO;
    self.cayImageView.backgroundColor = [UIColor jsd_colorWithHexString:@"#5261DE"];
    self.cayImageView.image = [UIImage imageNamed:@"selected_photo"];
    self.cayImageView.contentMode = UIViewContentModeCenter;
    [self.cnTextFieldView setTitle:@"Nombre" tipText:@"Nombre (requerido)"];
    [self.enTextFieldView setTitle:@"Ingles" tipText:@"Nombre (requerido)"];
    [self.CNNameTextField setTitle:@"Nombre científico" tipText:@"Nombre científico (requerido)"];
    [self.typeContentView setTitle:@"Variedad" number:0];
    [self.siyangNumberView setTitle:@"Dificultad creciente" number:1];
    [self.guangzhaoNumberView setTitle:@"Iluminación" number:1];
    [self.shuiliuNumberView setTitle:@"Flujo de agua" number:1];
    [self.yanduNumberView setTitle:@"Salinidad" number:1];
    [self.suanduNumberView setTitle:@"PH" number:1];
    [self.xingqingTextFieldView setTitle:@"Temperamento" tipText:@"Por favor ingrese el temperamento"];
    [self.chandiTextFieldView setTitle:@"Área de producción principal" tipText:@"introduzca el origen principal"];
    [self.zhongshuTextFieldView setTitle:@"Especie" tipText:@"introduzca la especie"];
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
        self.infoTipLabel.text = @"Introducción:";
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.scrollContentview endEditing:YES];
}
#pragma mark - 5.Event Response
- (void)onTouchSave:(id)sender {
    BOOL havaCNTitle = JSDIsString(self.cnTextFieldView.textField.text); 
    BOOL havaENTitle = JSDIsString(self.enTextFieldView.textField.text);
    BOOL havaCNNameTitle = JSDIsString(self.CNNameTextField.textField.text);
    if (havaCNTitle && havaENTitle && havaCNNameTitle) {
        [self performSave];
    } else {
        [XYFSnackbarManager showSnackMessage:@"Complete los campos obligatorios (nombre, inglés, nombre científico)"];
    }
}
- (void)performSave {
    XYFCayTypeListModel* cayTypeListModel = [[XYFCayTypeListModel alloc] initWithTypeIndex:self.typeContentView.selectedType]; 
    JSDCayTypeDetailsModel* detailsModel = [[JSDCayTypeDetailsModel alloc] init];
    if (self.havaImageView) {
        NSDate* date = [NSDate date];
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM-dd HH:ss"];
        NSString* dateString = [formatter stringFromDate:date];
        [XYFPhotoManage savaImageView:self.cayImageView fileName:dateString];
        detailsModel.imageName = [NSString stringWithFormat:@"%@%@", kJSDPhotoImageFiles, dateString];
    }
    detailsModel.cnName = self.CNNameTextField.textField.text;
    detailsModel.enName = [NSString stringWithFormat:@"Inglés: %@", self.enTextFieldView.textField.text];
    detailsModel.cnNameTitle = [NSString stringWithFormat:@"Nombre cientifico: %@", self.CNNameTextField.textField.text];
    detailsModel.siyang = self.siyangNumberView.subtitleLabel.text;
    detailsModel.guangzhao = self.guangzhaoNumberView.subtitleLabel.text;
    detailsModel.shuiliu = self.shuiliuNumberView.subtitleLabel.text;
    detailsModel.yaoqiu = [NSString stringWithFormat:@"Salinidad 1.020-1.025; PH 8.1-8.4 "];
    detailsModel.yanse = @"Púrpura";
    detailsModel.xingqing = self.xingqingTextFieldView.textField.text;
    detailsModel.chandi = self.chandiTextFieldView.textField.text;
    detailsModel.zhongshu = self.zhongshuTextFieldView.textField.text;
    detailsModel.info = self.infoTextView.text;
    [cayTypeListModel addDetailsModel:detailsModel];
    [self addComplete];
}
- (void)addComplete {
    [XYFSnackbarManager showSnackMessage:@"Coral agregado con éxito, puede verlo en la variedad especificada"];
    [self didTapBack:nil];
    [self reloadView];
}
- (IBAction)selectedPhoto:(UIButton *)sender {
    [XYFPhotoManage presentWithViewController:self sourceType:JSDImagePickerSourceTypePhotoLibrary finishPicking:^(UIImage * _Nonnull image) {
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
