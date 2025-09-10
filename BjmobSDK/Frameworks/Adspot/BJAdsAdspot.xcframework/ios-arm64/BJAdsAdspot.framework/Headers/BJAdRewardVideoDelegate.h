//
//  BJAdRewardVideoProtocol.h
//

#ifndef BJAdRewardVideoProtocol_h
#define BJAdRewardVideoProtocol_h

#import <BJAdsAdspot/BJAdBaseDelegate.h>

@protocol BJAdRewardVideoDelegate <BJAdBaseDelegate>
@optional

/// 广告视频缓存完成
- (void)ad_rewardVideoOnAdVideoCached;

/// 广告视频播放完成
- (void)ad_rewardVideoAdDidPlayFinish;

/// 广告到达激励时间
- (void)ad_rewardVideoAdDidRewardEffective;

@end

#endif
