//
//  BJGdtSplashAdapter.h
//

#import <BJAdsAdspot/BJAdSplashDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJGdtSplashAdapter : BJAdBaseAdPosition
@property (nonatomic, weak) id<BJAdSplashDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
