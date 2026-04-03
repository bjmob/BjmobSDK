//
//  BJAdsAdapter_BD.h
//  BJAdsAdapter_BD
//
//  Created by 李秀然 on 2026/3/25.
//

#import <Foundation/Foundation.h>
#pragma mark - 百度
#import "BJBdSplashAdapter.h"
#import "BJBdInterstitialAdapter.h"
#import "BJBdRewardVideoAdapter.h"
#import "BJBdNativeExpressAdapter.h"

#pragma mark - BJAdsCore

#if __has_include(<BJAdsCore/BJAdsCore.h>)
#import <BJAdsCore/BJAdsCore.h>
#import <BJAdsAdspot/BJAdsAdspot.h>
#else
#import "BJAdsCore/BJAdsCore.h"
#import "BJAdsAdspot/BJAdsAdspot.h"
#endif

//! Project version number for BJAdsAdapter_BD.
FOUNDATION_EXPORT double BJAdsAdapter_BDVersionNumber;

//! Project version string for BJAdsAdapter_BD.
FOUNDATION_EXPORT const unsigned char BJAdsAdapter_BDVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BJAdsAdapter_BD/PublicHeader.h>
