#
#  Be sure to run `pod spec lint BjmobSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "BjmobSDK"
  spec.version      = "0.1.41"
  spec.ios.deployment_target = '12.0'
  spec.platform     = :ios, "12.0"
  spec.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7', '5.8', '5.9']
  spec.requires_arc = true

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.summary      = "BjmobSDK for iOS"
  spec.description  = <<-DESC
  欢迎大家使用BjmobSDK, 提供成熟聚合方案。
  为开发者提供便利，快速集成。
  DESC

  spec.homepage     = "https://github.com/bjmob/BjmobSDK"

  spec.author       = { "bjmob" => "769871707@qq.com" }
  spec.source       = { :git => "https://github.com/bjmob/BjmobSDK.git", :tag => "#{spec.version}" }
  
  spec.user_target_xcconfig = { 'OTHER_LDFLAGS' => ['-ObjC'], 'ENABLE_BITCODE' => 'NO' }
  spec.pod_target_xcconfig  = { 'ENABLE_BITCODE' => 'NO' }
  spec.info_plist = { 'GADApplicationIdentifier' => 'ca-app-pub-3940256099942544~1458002511' }
  
  spec.default_subspecs = 'Core'

  valid_archs = ['armv7', 'armv7s', 'x86_64', 'arm64']

  # ══════════ Core: 核心 + 广告位（合并） ══════════
  spec.subspec 'Core' do |core|
    core.vendored_frameworks = [
      'BjmobSDK/Frameworks/Core/BJAdsCore.xcframework',
      'BjmobSDK/Frameworks/Adspot/BJAdsAdspot.xcframework'
    ]
    core.frameworks = 'CoreLocation', 'SystemConfiguration', 'CoreGraphics',
                      'CoreMotion', 'CoreTelephony', 'AdSupport', 'QuartzCore',
                      'WebKit', 'MessageUI', 'SafariServices', 'AVFoundation',
                      'EventKit', 'CoreMedia', 'StoreKit'
    core.libraries = 'c++'
    core.weak_frameworks = 'WebKit'
  end

  # ══════════ CSJ: 穿山甲（国内）适配器 ══════════
  spec.subspec 'CSJ' do |csj|
    csj.dependency 'BjmobSDK/Core'
    csj.dependency 'Ads-CN', '6.7.0.8'
    csj.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_CSJ.xcframework'
    ]
  end

  # ══════════ GDT: 广点通适配器 ══════════
  spec.subspec 'GDT' do |gdt|
    gdt.dependency 'BjmobSDK/Core'
    gdt.dependency 'GDTMobSDK'
    gdt.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_GDT.xcframework'
    ]
  end

  # ══════════ KS: 快手适配器 ══════════
  spec.subspec 'KS' do |ks|
    ks.dependency 'BjmobSDK/Core'
    ks.dependency 'KSAdSDK', '4.12.20.3'
    ks.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_KS.xcframework'
    ]
  end

  # ══════════ BD: 百度适配器 ══════════
  spec.subspec 'BD' do |bd|
    bd.dependency 'BjmobSDK/Core'
    bd.dependency 'BaiduMobAdSDK', '10.032'
    bd.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_BD.xcframework'
    ]
  end

  # ══════════ GG: Google AdMob 适配器 ══════════
  spec.subspec 'GG' do |gg|
    gg.dependency 'BjmobSDK/Core'
    gg.dependency 'Google-Mobile-Ads-SDK', '12.8.0'
    gg.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_GG.xcframework'
    ]
    gg.resource = 'BjmobSDK/Resources/GGResource.bundle'
  end

  # ══════════ PAG: Pangle（海外穿山甲）适配器 ══════════
  spec.subspec 'PAG' do |pag|
    pag.dependency 'BjmobSDK/Core'
    pag.dependency 'Ads-Global/PangleSDK', '7.9.0.6'
    pag.vendored_frameworks = [
      'BjmobSDK/Frameworks/Adapter/BJAdsAdapter_PAG.xcframework'
    ]
  end

  

  spec.xcconfig = {
    'VALID_ARCHS' =>  valid_archs.join(' '),
  }

end
