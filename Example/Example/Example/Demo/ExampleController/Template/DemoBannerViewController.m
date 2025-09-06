//
//  DemoBannerViewController.m
//  Example
//

#import "DemoBannerViewController.h"
#import <BJAdsAdspot/BJAdBanner.h>

@interface DemoBannerViewController () <BJAdBannerDelegate>
@property (nonatomic, strong) BJAdBanner *adBanner;
@end

@implementation DemoBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Banner";
    self.dic = [[AdDataJsonManager shared] loadAdDataWithType:JsonDataType_banner];
    self.isOnlyLoad = NO;
}

- (void)loadAndShowAd{
    [super loadAndShowAd];
    [self loadAdWithState:AdState_Normal];
    [self.adBanner loadAndShowAd];
    [self loadAdWithState:AdState_Loading];
}

- (void)deallocAd {
    if (_adBanner) {
        _adBanner.delegate = nil;
        _adBanner = nil;
    }
    [self loadAdWithState:AdState_Normal];
}

#pragma mark - BJAdBannerDelegate

/// 内部渠道开始加载时调用
- (void)ad_supplierWillLoad:(NSString *)supplierId {
    NSLog(@"内部渠道开始加载 %s  supplierId: %@", __func__, supplierId);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 内部渠道开始加载时调用", __func__]];
}

- (void)ad_successSortTag:(NSString *)sortTag {
    NSLog(@"选中了 rule '%@' %s", sortTag,__func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 选中了 rule '%@' ", __func__, sortTag]];
}

/// 广告数据拉取成功回调
- (void)ad_loadSuccessWithAdsType:(adsType)adsType {
    NSLog(@"广告数据拉取成功 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告拉取成功", __func__]];
    [self loadAdWithState:AdState_LoadSucceed];
}

- (void)ad_loadFailure:(NSError *)error withAdsType:(adsType)adsType {
    NSLog(@"广告数据拉取失败%@",error);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告加载失败", __func__]];
    [self loadAdWithState:AdState_LoadFailed];
}

/// 广告展示失败
- (void)ad_exposuredFailed:(NSError *)error withAdsType:(adsType)adsType {
    
}
- (void)ad_failedWithError:(NSError *)error description:(NSDictionary *)description {
    NSLog(@"广告展示失败 %s  error: %@ 详情:%@", __func__, error, description);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告加载失败", __func__]];
    [self showErrorWithDescription:description];
    [self loadAdWithState:AdState_LoadFailed];
    [self deallocAd];
}

/// 广告曝光
- (void)ad_exposuredWithAdsType:(adsType)adsType {
    NSLog(@"广告曝光回调 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告曝光成功", __func__]];
}

/// 广告点击
- (void)ad_clickedWithAdsType:(adsType)adsType {
    NSLog(@"广告点击 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告点击", __func__]];
}

/// 广告关闭回调
- (void)ad_didCloseWithAdsType:(adsType)adsType {
    NSLog(@"广告关闭了 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告关闭了", __func__]];

}

#pragma mark - lazy
- (BJAdBanner *)adBanner{
    if(!_adBanner){
        
        if ([self isDebug]) {
//            _adBanner = [[BJAdBanner alloc]initWithJsonDic:self.dic viewController:self];
        }else {
            _adBanner = [[BJAdBanner alloc] initWithAdViewController:self];
        }
//        _adBanner.y = 300;
        _adBanner.delegate = self;
    }
    return _adBanner;
}

@end
