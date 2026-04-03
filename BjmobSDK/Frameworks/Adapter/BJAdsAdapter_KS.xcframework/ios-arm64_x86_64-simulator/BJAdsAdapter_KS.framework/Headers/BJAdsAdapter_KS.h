//
//  BJAdsAdapter_KS.h
//  BJAdsAdapter_KS
//
//  Created by 李秀然 on 2026/3/24.
//

#import <Foundation/Foundation.h>
#pragma mark - 快手
#import "BJKsBannerAdapter.h"
#import "BJKsInterstitialAdapter.h"
#import "BJKsRewardVideoAdapter.h"
#import "BJKsNativeExpressAdapter.h"
#import "BJKsSplashAdapter.h"

#pragma mark - BJAdsCore

#if __has_include(<BJAdsCore/BJAdsCore.h>)
#import <BJAdsCore/BJAdsCore.h>
#import <BJAdsAdspot/BJAdsAdspot.h>
#else
#import "BJAdsCore/BJAdsCore.h"
#import "BJAdsAdspot/BJAdsAdspot.h"
#endif

//! Project version number for BJAdsAdapter_KS.
FOUNDATION_EXPORT double BJAdsAdapter_KSVersionNumber;

//! Project version string for BJAdsAdapter_KS.
FOUNDATION_EXPORT const unsigned char BJAdsAdapter_KSVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BJAdsAdapter_KS/PublicHeader.h>
