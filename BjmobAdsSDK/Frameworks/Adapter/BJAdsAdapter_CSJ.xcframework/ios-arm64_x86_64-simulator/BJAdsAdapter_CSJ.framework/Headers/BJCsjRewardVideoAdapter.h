//
//  BJCsjRewardVideoAdapter.h
//

#import <BJAdsAdspot/BJAdRewardVideoDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJCsjRewardVideoAdapter : BJAdBaseAdPosition
@property (nonatomic, weak) id<BJAdRewardVideoDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
