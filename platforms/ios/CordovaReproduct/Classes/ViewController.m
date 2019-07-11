//
//  ViewController.m
//  CordovaReproduct
//
//  Created by Luo,Jianhua on 2019/7/2.
//

#import "ViewController.h"
#import "BDCCordovaWebViewController.h"
#import "BlockViewController.h"
#import "BDCWKWebViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *listView;
@property (nonatomic, copy) NSMutableArray<NSString *> *listDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI {
    [self.view addSubview:self.listView];
}

#pragma mark - UITableViewDataSources & UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [self.listDatas objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.listDatas.count - 1) {
        if (indexPath.row == 4) {
            BDCWKWebViewController *webView = [[BDCWKWebViewController alloc] init];
            webView.urlString = [self.listDatas objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:webView animated:YES];
        } else {
            BDCCordovaWebViewController *cordovaWebViewController = [[BDCCordovaWebViewController alloc] init];
            cordovaWebViewController.startPage = [self.listDatas objectAtIndex:indexPath.row];
            [self.navigationController pushViewController:cordovaWebViewController animated:YES];
        }
    } else {
        BlockViewController *blockVC = [[BlockViewController alloc] initWithAction:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [self.navigationController pushViewController:blockVC animated:YES];
    }
}

#pragma mark - lazy

- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_listView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _listView.tableFooterView = [UIView new];
        _listView.dataSource = self;
        _listView.delegate = self;
    }
    return _listView;
}

- (NSMutableArray<NSString *> *)listDatas {
    if (!_listDatas) {
        _listDatas = [[NSMutableArray alloc] initWithArray:@[@"https://www.baidu.com", @"https://cloud.baidu.com", @"https://cloud.baidu.com/campaign/PromotionActivity/index.html", @"https://cloud.baidu.com", @"https://cloud.baidu.com", @"BlockViewController"]];
    }
    return _listDatas;
}

@end
