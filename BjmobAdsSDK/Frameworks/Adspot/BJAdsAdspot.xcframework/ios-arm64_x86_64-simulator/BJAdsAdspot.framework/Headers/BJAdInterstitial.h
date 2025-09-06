//
//  BJAdInterstitial.h
//

#import <BJAdsCore/BJAdBaseAdapter.h>
#import <BJAdsAdspot/BJAdInterstitialDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJAdInterstitial : BJAdBaseAdapter

/// 广告方法回调代理
@property (nonatomic, weak) id<BJAdInterstitialDelegate> delegate;

#pragma mark - 构造方法
- (instancetype)initWithViewController:(UIViewController *)viewController;
#ifdef DEBUG
/// 仅限于debug模式下使用
- (instancetype)initWithJsonDic:(NSDictionary *)jsonDic
                 viewController:(UIViewController *)viewController;
#endif
@end

NS_ASSUME_NONNULL_END
