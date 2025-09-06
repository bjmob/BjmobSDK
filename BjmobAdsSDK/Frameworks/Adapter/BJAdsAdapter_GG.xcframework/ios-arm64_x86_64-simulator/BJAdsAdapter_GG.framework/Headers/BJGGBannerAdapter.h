//
//  BJGGBannerAdapter.h
//

#if __has_include(<BJAdsAdspot/BJAdBannerDelegate.h>)
#import <BJAdsAdspot/BJAdBannerDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>
#else
#import "BJAdBannerDelegate.h"
#import "BJAdBaseAdPosition.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BJGGBannerAdapter : BJAdBaseAdPosition

@property (nonatomic, weak) id<BJAdBannerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
