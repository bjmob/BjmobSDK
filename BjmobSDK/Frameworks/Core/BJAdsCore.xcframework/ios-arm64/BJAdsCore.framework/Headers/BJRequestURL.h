//
//  BJRequestURL.h
//  Pods
//
//  Created by cc on 2022/5/4.
//

#ifndef BJRequestURL_h
#define BJRequestURL_h

#ifdef DEBUG

#define BaseURL         @"https://sdk.bjmob.com"        // 广告配置接口API
#define BaseURLOSS      @"https://oss.bjmob.com"        // 广告配置兜底OSS

#else

#define BaseURL         @"https://sdk.bjmob.com"        // 广告配置接口API
#define BaseURLOSS      @"https://oss.bjmob.com"        // 广告配置兜底OSS

#endif

/// 状态上报
#define  URL_ADS_REPORTSTATE     @"/ads/reportState"
/// 加密广告信息接口
#define  URL_ADS_RULE            @"/ads/ruleInfo"


#endif /* BJRequestURL_h */
