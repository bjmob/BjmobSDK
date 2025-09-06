//
//  BJAdSplashProtocol.h
//

#ifndef BJAdSplashProtocol_h
#define BJAdSplashProtocol_h

#import <BJAdsAdspot/BJAdBaseDelegate.h>

@protocol BJAdSplashDelegate <BJAdBaseDelegate>

@optional
/// 广告点击跳过
- (void)ad_splashOnAdSkipClicked;
/// 广告倒计时结束回调
- (void)ad_splashOnAdCountdownToZero;

@end

#endif 
