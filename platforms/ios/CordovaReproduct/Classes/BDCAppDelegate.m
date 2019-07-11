//
//  BDCAppDelegate.m
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/2.
//

#import "BDCAppDelegate.h"
#import "ViewController.h"
#import "BDCCordovaWebViewController.h"

@implementation BDCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // init uiwindow
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    BDCCordovaWebViewController *cordovaWebViewController = [[BDCCordovaWebViewController alloc] init];
    cordovaWebViewController.startPage = @"https://cloud.baidu.com/campaign/PromotionActivity/index.html";
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cordovaWebViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
