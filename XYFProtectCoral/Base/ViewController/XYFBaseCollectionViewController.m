#import "XYFBaseCollectionViewController.h"
@interface XYFBaseCollectionViewController ()
@end
@implementation XYFBaseCollectionViewController
static NSString * const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    if (self.navigationController.viewControllers.count > 1) {
        [self xyf_setupNavigation];
    }
}
- (void)xyf_setupNavigation {
    self.fd_interactivePopDisabled = NO;
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
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)sp_getUsersMostLiked {
    NSLog(@"Check your Network");
}
- (void)sp_checkInfo {
    NSLog(@"Get User Succrss");
}
- (void)sp_didGetInfoSuccess {
    NSLog(@"Get Info Success");
}
- (void)sp_checkUserInfo {
    NSLog(@"Get Info Success");
}
- (void)sp_getUsersMostFollowerSuccess {
    NSLog(@"Get Info Success");
}

@end
