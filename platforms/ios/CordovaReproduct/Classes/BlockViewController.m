//
//  BlockViewController.m
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/2.
//

#import "BlockViewController.h"

@interface BlockViewController ()
@property (nonatomic, copy) BDCVoidBlock backDismissAction;
@end

@implementation BlockViewController

- (instancetype)initWithAction:(BDCVoidBlock)block {
    if (self = [super init]) {
        self.backDismissAction = block;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(bdc_backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)bdc_backClick:(UIButton *)sender {
    if (self.backDismissAction) {
        self.backDismissAction();
    }
}

- (void)dealloc {
    NSLog(@"BlockViewController dealloc");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
