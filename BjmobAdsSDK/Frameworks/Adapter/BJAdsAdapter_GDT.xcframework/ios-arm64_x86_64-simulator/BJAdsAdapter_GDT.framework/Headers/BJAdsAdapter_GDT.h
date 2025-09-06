//
//  BJAdsAdapter_GDT.h
//  BJAdsAdapter_GDT
//
//  Created by cc on 2022/5/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - GDT
#import "BJGdtBannerAdapter.h"
#import "BJGdtInterstitialAdapter.h"
#import "BJGdtRewardVideoAdapter.h"
#import "BJGdtSplashAdapter.h"

#pragma mark - BJAdsCore
#if __has_include(<BJAdsCore/BJAdsCore.h>)
#import <BJAdsCore/BJAdsCore.h>
#import <BJAdsAdspot/BJAdsAdspot.h>
#else
#import "BJAdsCore/BJAdsCore.h"
#import "BJAdsAdspot/BJAdsAdspot.h"
#endif

//! Project version number for BJAdsAdapter_GDT.
FOUNDATION_EXPORT double BJAdsAdapter_GDTVersionNumber;

//! Project version string for BJAdsAdapter_GDT.
FOUNDATION_EXPORT const unsigned char BJAdsAdapter_GDTVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BJAdsAdapter_GDT/PublicHeader.h>


