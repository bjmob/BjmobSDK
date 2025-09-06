//
//  BJCsjInterstitialProAdapter.h
//

#import <BJAdsAdspot/BJAdInterstitialDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJCsjInterstitialProAdapter : BJAdBaseAdPosition
@property (nonatomic, weak) id<BJAdInterstitialDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
