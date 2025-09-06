//
//  DemoRewardVideoViewController.m
//  BJAdsSDKDemo
//
//  Created by CherryKing on 2020/1/3.
//  Copyright © 2020 BAYESCOM. All rights reserved.
//

#import "DemoRewardVideoViewController.h"

#import <BJAdsAdspot/BJAdRewardVideo.h>
@interface DemoRewardVideoViewController () <BJAdRewardVideoDelegate>
@property (nonatomic, strong) BJAdRewardVideo *adRewardVideo;
@property (nonatomic) bool isAdLoaded; // 激励视频广告播放器 采用的是边下边播的方式, 理论上拉取数据成功 即可展示, 但如果网速慢导致缓冲速度慢, 则激励视频广告会出现卡顿
                                       // 广点通推荐在 ad_rewardVideoOnAdVideoCached 视频缓冲完成后 在掉用showad
@end

@implementation DemoRewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"激励视频广告";
    self.dic = [[AdDataJsonManager shared] loadAdDataWithType:JsonDataType_rewardVideo];
}

- (void)loadAd {
    [super loadAd];
    [self deallocAd];
    [self loadAdWithState:AdState_Normal];
    [self.adRewardVideo loadAd];
    [self loadAdWithState:AdState_Loading];
}

- (void)showAd {
    if (!self.adRewardVideo) {
        [DemoUtils showToast:@"请先加载广告"];
        return;
    }
    [self.adRewardVideo showAd];
}

- (void)loadAndShowAd {
    [super loadAd];
    [self deallocAd];
    [self loadAdWithState:AdState_Normal];
    [self.adRewardVideo loadAndShowAd];
    [self loadAdWithState:AdState_Loading];
}

- (void)deallocAd {
    if (_adRewardVideo) {
        _adRewardVideo.delegate = nil;
        _adRewardVideo = nil;
    }
    self.isLoaded = NO;
    [self loadAdWithState:AdState_Normal];
}

#pragma mark - BJAdRewardVideoDelegate
/// 广告数据加载成功
- (void)ad_loadSuccessWithAdsType:(adsType)adsType {
    NSLog(@"广告数据拉取成功, 正在缓存... %s", __func__);
    [DemoUtils showToast:@"广告加载成功"];
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告数据拉取成功", __func__]];
}

- (void)ad_loadFailure:(NSError *)error withAdsType:(adsType)adsType {
    NSLog(@"广告数据拉取失败  %@", error);
}

/// 视频缓存成功
- (void)ad_rewardVideoOnAdVideoCached {
    NSLog(@"视频缓存成功 %s", __func__);
    [DemoUtils showToast:@"视频缓存成功"];
    self.isLoaded = YES;
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 视频缓存成功", __func__]];
    [self loadAdWithState:AdState_LoadSucceed];
}

/// 到达激励时间
- (void)ad_rewardVideoAdDidRewardEffective {
    NSLog(@"到达激励时间 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 到达激励时间", __func__]];
}

/// 广告曝光
- (void)ad_exposuredWithAdsType:(adsType)adsType {
    NSLog(@"广告曝光回调 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告曝光回调", __func__]];
}

/// 广告点击
- (void)ad_clickedWithAdsType:(adsType)adsType {
    NSLog(@"广告点击 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告点击", __func__]];
}

/// 广告展示失败
- (void)ad_failedWithError:(NSError *)error description:(NSDictionary *)description {
    NSLog(@"广告展示失败 %s  error: %@ 详情:%@", __func__, error,description);
    [DemoUtils showToast:@"广告加载失败"];
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告加载失败", __func__]];
    [self showErrorWithDescription:description];
    [self loadAdWithState:AdState_LoadFailed];
    [self deallocAd];
}

/// 内部渠道开始加载时调用
- (void)ad_supplierWillLoad:(NSString *)supplierId {
    NSLog(@"内部渠道开始加载 %s  supplierId: %@", __func__, supplierId);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 内部渠道开始加载", __func__]];
}

/// 广告关闭
- (void)ad_didCloseWithAdsType:(adsType)adsType {
    NSLog(@"广告关闭了 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 广告关闭了", __func__]];
    [self deallocAd];
}

/// 播放完成
- (void)ad_rewardVideoAdDidPlayFinish {
    NSLog(@"播放完成 %s", __func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 播放完成", __func__]];
}

- (void)ad_successSortTag:(NSString *)sortTag {
    NSLog(@"选中了 rule '%@' %s", sortTag,__func__);
    [self showProcessWithText:[NSString stringWithFormat:@"%s\r\n 选中了 rule '%@' ", __func__, sortTag]];
}

#pragma mark - lazy
- (BJAdRewardVideo *)adRewardVideo{
    if(!_adRewardVideo){
        if ([self isDebug]) {
//            _adRewardVideo = [[BJAdRewardVideo alloc] initWithJsonDic:self.dic viewController:self];
        }else {
            _adRewardVideo = [[BJAdRewardVideo alloc] initWithViewController:self];
        }
        _adRewardVideo.delegate = self;
    }
    return _adRewardVideo;
}
@end
