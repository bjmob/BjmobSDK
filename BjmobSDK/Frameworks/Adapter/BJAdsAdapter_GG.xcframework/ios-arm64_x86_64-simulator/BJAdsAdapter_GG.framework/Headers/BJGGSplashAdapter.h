//
//  BJGGSplashAdapter.h
//

#if __has_include(<BJAdsAdspot/BJAdSplashDelegate.h>)
#import <BJAdsAdspot/BJAdSplashDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>
#else
#import "BJAdSplashDelegate.h"
#import "BJAdBaseAdPosition.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface BJGGSplashAdapter : BJAdBaseAdPosition

@property (nonatomic, weak) id<BJAdSplashDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
