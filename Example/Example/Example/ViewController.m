//
//  ViewController.m
//  test
//
//  Created by ext.jiangyelin1 on 2023/4/20.
//

#import "ViewController.h"
#import <Masonry.h>
#import <AdSupport/AdSupport.h>

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary<NSString *, NSString *> *> *dataArr;

@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *idfaLab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSubviews];
  
    _dataArr = @[
        @{@"title":@"开屏", @"targetVCName": @"DemoSplashViewController"},
        @{@"title":@"Banner", @"targetVCName": @"DemoBannerViewController"},
        @{@"title":@"插屏", @"targetVCName": @"DemoInterstitialViewController"},
        @{@"title":@"激励视频广告", @"targetVCName": @"DemoRewardVideoViewController"},
        @{@"title":@"原生", @"targetVCName": @"DemoListFeedExpressViewController"},
        @{@"title":@"IDFA", @"targetVCName": @""},
    ];
    
    [_tableView reloadData];
}

- (void)initSubviews {

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    _tableView.backgroundView = [UIView new];
    
    UILabel *vLbl = [[UILabel alloc] initWithFrame:CGRectZero];
    vLbl.textAlignment = NSTextAlignmentCenter;
    
    if (@available(iOS 15.0, *)) {
        self.tableView.sectionHeaderTopPadding = 0;
    }

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

// MARK: UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = _dataArr[indexPath.row][@"title"];
    if (indexPath.row == _dataArr.count - 1) {
        [self addIdfaLabeWithView:cell.contentView];
    }
    cell.detailTextLabel.text = [self getIDFA];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSDictionary *dic = _dataArr[indexPath.row];
    NSString *targetVCName = dic[@"targetVCName"];
    
    Class vcClass = NSClassFromString(targetVCName);
    
    

    UIViewController *vc = [[vcClass alloc] init];
//    UINavigationController * nv = [[UINavigationController alloc]initWithRootViewController:vc];
    vc.title = _dataArr[indexPath.row][@"title"];
    if (!vc) {
        [[UIPasteboard generalPasteboard] setString: [self getIDFA]];
        
        return;
    }
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSString *)getIDFA{
    
    NSString *idfa = @"";
    if ([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    } else {
        idfa = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    }
    return idfa;
}

- (void)addIdfaLabeWithView:(UIView *)view {
    [view addSubview:self.idfaLab];
    [self.idfaLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(view);
        make.left.equalTo(view).offset(100);
    }];
    
    self.idfaLab.text = [[self getIDFA] isEqualToString:@"00000000-0000-0000-0000-000000000000"] ? @"请在设置-隐私-跟踪中允许App请求跟踪" : [self getIDFA];
}

- (UILabel *)idfaLab {
    if (!_idfaLab) {
        _idfaLab = [UILabel new];
        _idfaLab.numberOfLines = 0;
    }
    return _idfaLab;
}

@end
