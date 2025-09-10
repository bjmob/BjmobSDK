//
//  BJGGNativeExpressAdapter.h
//

#import <BJAdsCore/BJAdBaseAdPosition.h>
#import <BJAdsAdspot/BJAdNativeExpressDelegate.h>

NS_ASSUME_NONNULL_BEGIN

@interface BJGGNativeExpressAdapter : BJAdBaseAdPosition

@property (nonatomic, weak) id<BJAdNativeExpressDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
