//
//  BJGGInterstitialAdapter.h
//

#import <BJAdsAdspot/BJAdInterstitialDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJGGInterstitialAdapter : BJAdBaseAdPosition

@property (nonatomic, weak) id<BJAdInterstitialDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
