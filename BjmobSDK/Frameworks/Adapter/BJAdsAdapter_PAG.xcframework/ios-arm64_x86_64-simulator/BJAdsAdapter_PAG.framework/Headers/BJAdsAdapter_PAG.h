//
//  BJAdsAdapter_PAG.h
//  BJAdsAdapter_PAG
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - Pangle
#import "BJPagSplashAdapter.h"
#import "BJPagRewardVideoAdapter.h"
#import "BJPagInterstitialAdapter.h"
#import "BJPagBannerAdapter.h"
#import "BJPagNativeExpressAdapter.h"

#pragma mark - BJAdsCore
#if __has_include(<BJAdsCore/BJAdsCore.h>)
#import <BJAdsCore/BJAdsCore.h>
#import <BJAdsAdspot/BJAdsAdspot.h>
#else
#import "BJAdsCore/BJAdsCore.h"
#import "BJAdsAdspot/BJAdsAdspot.h"
#endif

//! Project version number for BJAdsAdapter_PAG.
FOUNDATION_EXPORT double BJAdsAdapter_PAGVersionNumber;

//! Project version string for BJAdsAdapter_PAG.
FOUNDATION_EXPORT const unsigned char BJAdsAdapter_PAGVersionString[];
