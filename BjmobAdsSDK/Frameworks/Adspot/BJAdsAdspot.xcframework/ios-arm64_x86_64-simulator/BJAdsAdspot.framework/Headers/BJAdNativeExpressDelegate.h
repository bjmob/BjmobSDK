//
//  BJAdNativeExpressProtocol.h
//

#ifndef BJAdNativeExpressProtocol_h
#define BJAdNativeExpressProtocol_h

#import <BJAdsAdspot/BJAdCommonDelegate.h>

@class BJAdNativeExpressView;

@protocol BJAdNativeExpressDelegate <BJAdBaseDelegate>

@optional

/// 广告数据拉取成功
- (void)ad_NativeExpressOnAdLoadSuccess:(nullable NSArray<BJAdNativeExpressView *> *)views;
/// 广告数据拉取失败
- (void)ad_NativeExpressOnAdLoadFailWithError:(NSError *_Nullable)error;
/// 广告渲染成功
- (void)ad_NativeExpressOnAdRenderSuccess:(nullable BJAdNativeExpressView *)adView;
/// 广告渲染失败
- (void)ad_NativeExpressOnAdRenderFail:(nullable BJAdNativeExpressView *)adView withError:(NSError *_Nullable)error;
/// 广告视图为空
- (void)ad_NativeExpressOnAdGetViewIsEmpty;
/// 广告曝光
- (void)ad_NativeExpressOnAdShow:(nullable BJAdNativeExpressView *)adView;
/// 广告点击
- (void)ad_NativeExpressOnAdClicked:(nullable BJAdNativeExpressView *)adView;
/// 广告被关闭 (注: 百度广告(百青藤), 不支持该回调, 若使用百青藤,则该回到功能请自行实现)
- (void)ad_NativeExpressOnAdClosed:(nullable BJAdNativeExpressView *)adView;

@end

#endif
