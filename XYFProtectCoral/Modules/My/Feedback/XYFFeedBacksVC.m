#import <MessageUI/MessageUI.h>
#import "XYFFeedBacksVC.h"
static NSString* const kFeedBackSussessTip = @"¡Muchas gracias por usar Shanshan, revisaremos cuidadosamente la información que tenga y trataremos de mejorarla!";
static NSString* const kFeedBackTip = @"Muchas gracias por su uso de Protect Shanshan, bienvenido a darnos cualquier sugerencia.";
static NSString* const kFeedBackEmail = @"jerseycafesupport@163.com";
static NSString* const kFeedBackEmailTitle = @"Comentarios sobre el uso de la aplicación";
static NSString* const kFeedBackEmailSubTitle = @"Hi";
static NSString* const kFeedBackErrorTipTitle = @"Consejos";
static NSString* const kFeedBackErrorTipSubTitle = @"Abra \"(Aplicación de correo) \" para configurar su cuenta de correo electrónico";
@interface XYFFeedBacksVC () <MFMailComposeViewControllerDelegate>
@property (nonatomic, strong) UILabel* tipLabel;
@property (nonatomic, strong) MDCRaisedButton* senderEmail;
@property (nonatomic, copy) NSString* emailText;
@property (strong, nonatomic) UIImageView *logoImageView;
@end
@implementation XYFFeedBacksVC
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
#pragma mark - 2.SettingView and Style
- (void)xyf_setupNavBar {
    self.navigationItem.title = @"Retroalimentación";
}
- (void)xyf_setupView {
    self.view.backgroundColor = [UIColor jsd_maiBackgroundColor];
    [self.view addSubview:self.logoImageView];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.width.height.mas_equalTo(125);
    }];
    self.logoImageView.layer.cornerRadius = 10;
    self.logoImageView.layer.masksToBounds = YES;
    self.senderEmail = [[MDCRaisedButton alloc] init];
    [self.senderEmail setTitle:@"Enviar correo" forState:UIControlStateNormal];
    [self.senderEmail addTarget:self action:@selector(onTouchSendEmail:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.senderEmail];
    [self.senderEmail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(47);
        make.top.mas_equalTo(self.logoImageView.mas_bottom).mas_equalTo(30);
    }];
    if ([MFMailComposeViewController canSendMail]) {
        [self xyf_setupEmailAction]; 
    }else{
        UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:kFeedBackErrorTipTitle message:kFeedBackErrorTipSubTitle delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerView show];
    }
}
-(void)xyf_setupEmailAction{
    MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
    [mailCompose setMailComposeDelegate:self];
    [mailCompose setToRecipients:@[kFeedBackEmail]];
    [mailCompose setSubject:kFeedBackEmailTitle];
    NSString *emailContent = kFeedBackEmailSubTitle;
    [mailCompose setMessageBody:emailContent isHTML:NO];
    [self presentViewController:mailCompose animated:YES completion:nil];
}
- (void)reloadView {
}
#pragma mark - 3.Request Data
- (void)xyf_setupData {
}
#pragma mark - 4.UITableViewDataSource and UITableViewDelegate
#pragma mark - MFMailComposeViewControllerDelegate的代理方法：
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail send canceled: 用户取消编辑");
            [self dismissViewControllerAnimated:YES completion: ^{
            }];
            break;
        case MFMailComposeResultSaved:
            [self dismissViewControllerAnimated:YES completion: ^{
            }];
            break;
        case MFMailComposeResultSent: {
            NSLog(@"Mail sent: 用户点击发送");
            MDCSnackbarManager* manager = [MDCSnackbarManager defaultManager];
            MDCSnackbarMessage* message = [MDCSnackbarMessage messageWithText: kFeedBackSussessTip];
            [self dismissViewControllerAnimated:YES completion: ^{
                [manager showMessage:message];
            }];
            break;
        }
        case MFMailComposeResultFailed:
            NSLog(@"Mail send errored: %@ : 用户尝试保存或发送邮件失败", [error localizedDescription]);
            break;
    }
}
#pragma mark - 5.Event Response
- (void)onTouchSendEmail:(id) sender {
    if ([MFMailComposeViewController canSendMail]) {
        [self xyf_setupEmailAction]; 
    }else{
        UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:kFeedBackErrorTipTitle message:kFeedBackErrorTipSubTitle delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerView show];
    }
}
#pragma mark - 6.Private Methods
- (void)xyf_setupNotification {
}
#pragma mark - 7.GET & SET
- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.font = [UIFont systemFontOfSize:20];
        _tipLabel.numberOfLines = 0;
        _tipLabel.text = kFeedBackTip;
    }
    return _tipLabel;
}
- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    }
    return _logoImageView;
}
- (void)sp_getLoginState {
    NSLog(@"Continue");
}

- (void)sp_getMediaFailed {
    NSLog(@"Check your Network");
}
- (void)sp_getUsersMostLiked {
    NSLog(@"Check your Network");
}
- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Success");
}
- (void)sp_didGetInfoSuccess {
    NSLog(@"Continue");
}
@end
