//
//  BDCCordovaWebViewController.m
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/2.
//

#import "BDCCordovaWebViewController.h"
#import <WebKit/WebKit.h>

@interface BDCCordovaWebViewController ()
@property (nonatomic, strong) UIWebView *uiWebView;
@property (nonatomic, strong) WKWebView *wkWebView;
@end

@implementation BDCCordovaWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.webView isKindOfClass:[UIWebView class]]) {
        UIWebView *webView = (UIWebView *)self.webView;
        webView.scalesPageToFit = YES;
        self.uiWebView = webView;
        [self.uiWebView addObserver:self forKeyPath:@"canGoBack" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:nil];
    } else if([self.webView isKindOfClass:[WKWebView class]]) {
        WKWebView *wkWebView = (WKWebView *)self.webView;
        self.wkWebView = wkWebView;
        [self.wkWebView addObserver:self forKeyPath:@"title" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:NULL];
        [self.wkWebView addObserver:self forKeyPath:@"canGoBack" options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:NULL];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bdc_changeNavigationTitle:) name:CDVPageDidLoadNotification object:nil];
    // Do any additional setup after loading the view.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (object == self.uiWebView && [keyPath isEqualToString:@"canGoBack"]) {
        NSLog(@"canGoBack = %@", [change objectForKey:NSKeyValueChangeNewKey]);
    } else if ([keyPath isEqualToString:@"title"]) {
        if (object == self.wkWebView) {
            self.title = self.wkWebView.title;
        } else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    } else if ([keyPath isEqualToString:@"canGoBack"]) {
        NSLog(@"canGoBack = %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}

- (void)bdc_changeNavigationTitle:(NSNotification *)notification {
//    NSString *title = [notification.object stringByEvaluatingJavaScriptFromString:@"document.title"];
//    NSLog(@"title = %@", title);
}

- (void)dealloc {
    [self.uiWebView removeObserver:self forKeyPath:@"canGoBack"];
    [self.wkWebView removeObserver:self forKeyPath:@"canGoBack"];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
