//
//  BJAdRewardVideo.h
//  

#if __has_include(<BJAdsCore/BJAdBaseAdapter.h>)
#import <BJAdsCore/BJAdBaseAdapter.h>
#import <BJAdsAdspot/BJAdRewardVideoDelegate.h>
#else
#import "BJAdBaseAdapter.h"
#import "BJAdRewardVideoDelegate.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BJAdRewardVideo : BJAdBaseAdapter
/// 广告方法回调代理
@property (nonatomic, weak) id<BJAdRewardVideoDelegate> delegate;

- (instancetype)initWithViewController:(nonnull UIViewController *)viewController;
#ifdef DEBUG
/// 仅限于debug模式下使用
- (instancetype)initWithJsonDic:(NSDictionary *)jsonDic
                 viewController:(nonnull UIViewController *)viewController;
#endif
@end

NS_ASSUME_NONNULL_END
