//
//  BJCsjSplashAdapter.h
//

#import <BJAdsAdspot/BJAdSplashDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJCsjSplashAdapter : BJAdBaseAdPosition
@property (nonatomic, weak) id<BJAdSplashDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
