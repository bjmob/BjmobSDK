//
//  BJAdFullScreenVideoDelegate.h
//

#ifndef BJAdFullScreenVideoDelegate_h
#define BJAdFullScreenVideoDelegate_h

#import <BJAdsAdspot/BJAdBaseDelegate.h>

@protocol BJAdFullScreenVideoDelegate <BJAdBaseDelegate>
@optional
/// 视频播放完成
- (void)ad_FullScreenVideoOnAdPlayFinish;

@end

#endif
