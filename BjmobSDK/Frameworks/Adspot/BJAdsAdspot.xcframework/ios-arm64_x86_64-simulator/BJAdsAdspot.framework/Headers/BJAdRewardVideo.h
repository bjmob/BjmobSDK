//
//  BJAdRewardVideo.h
//  

#if __has_include(<BJAdsCore/BJAdBaseAdapter.h>)
#import <BJAdsCore/BJAdBaseAdapter.h>
#import <BJAdsCore/BJAdRewardServerParams.h>
#import <BJAdsAdspot/BJAdRewardVideoDelegate.h>
#else
#import "BJAdBaseAdapter.h"
#import "BJAdRewardServerParams.h"
#import "BJAdRewardVideoDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BJAdRewardVideo : BJAdBaseAdapter
/// 广告方法回调代理
@property (nonatomic, weak) id<BJAdRewardVideoDelegate> delegate;

/// 激励视频服务端参数；渠道适配器会读取并在广告返回后写回 rewardName / rewardAmount（若 SDK 提供）。
/// 首次读取时若为空会自动创建实例，可直接 `rewardServerParams.userId = ...`；置为 nil 可丢弃后再读会重新创建。
@property (nonatomic, strong, nullable) BJAdRewardServerParams *rewardServerParams;

- (instancetype)initWithViewController:(nonnull UIViewController *)viewController;
#ifdef DEBUG
/// 仅限于debug模式下使用
- (instancetype)initWithJsonDic:(NSDictionary *)jsonDic
                 viewController:(nonnull UIViewController *)viewController;
#endif
@end

NS_ASSUME_NONNULL_END
