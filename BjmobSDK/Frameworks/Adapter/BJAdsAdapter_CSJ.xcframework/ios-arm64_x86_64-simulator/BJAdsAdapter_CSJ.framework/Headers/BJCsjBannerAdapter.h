//
//  BJCsjBannerAdapter.h
//

#import <BJAdsAdspot/BJAdBannerDelegate.h>
#import <BJAdsCore/BJAdBaseAdPosition.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJCsjBannerAdapter : BJAdBaseAdPosition

@property (nonatomic, weak) id<BJAdBannerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
