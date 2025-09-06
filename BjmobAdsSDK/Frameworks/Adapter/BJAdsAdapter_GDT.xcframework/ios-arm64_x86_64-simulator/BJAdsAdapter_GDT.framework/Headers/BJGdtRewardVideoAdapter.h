//
//  BJGdtRewardVideoAdapter.h
//

#if __has_include(<BJAdsAdspot/BJAdRewardVideoDelegate.h>)
#import <BJAdsAdspot/BJAdRewardVideoDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>
#else
#import "BJAdRewardVideoDelegate.h"
#import "BJAdBaseAdPosition.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BJGdtRewardVideoAdapter : BJAdBaseAdPosition
@property (nonatomic, weak) id<BJAdRewardVideoDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
