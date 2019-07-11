//
//  BDCWKWebViewController.m
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/3.
//

#import "BDCWKWebViewController.h"
#import <WebKit/WebKit.h>

@interface BDCWKWebViewController ()
@property (nonatomic, strong) WKWebView *wkWebView;
@end

@implementation BDCWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wkWebView];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    // Do any additional setup after loading the view.
}

- (WKWebView *)wkWebView {
    if (!_wkWebView) {
        _wkWebView = [[WKWebView alloc] init];
        _wkWebView.frame = self.view.bounds;
        _wkWebView.backgroundColor = [UIColor whiteColor];
    }
    return _wkWebView;
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
