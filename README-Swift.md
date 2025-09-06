
# BjmobAdsSDK-Swift 快速指引

## 1.1 引入SDK

### 在项目Podfile文件中加入

``` ruby
  pod 'BjmobAdsSDK', '0.0.28'
```

执行 pod install 命令


## 1.2 编辑info.plist

``` 
<key>NSUserTrackingUsageDescription</key>
<string>请求idfa权限</string>

<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
</dict>

<key>GADApplicationIdentifier</key>
<string>ca-app-pub-5692427479924499~6281062921</string>

<key>SKAdNetworkItems</key>
	<array>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>v9wttpbfk9.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>n38lu8286q.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>su67r6k2v3.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>22mmun2rn5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>238da6jt44.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>r3y5dwb26t.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>cstr6suwn9.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>4fzdc2evr5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>2fnua5tdw4.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>ydx93a7ass.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>5a6flpkh64.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>p78axxw29g.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>v72qych5uu.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>c6k4g5qg8m.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>s39g8k73mm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>3qy4746246.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>3sh42y64q3.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>f38h382jlk.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>hs6bdukanm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>prcb7njmu6.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>v4nxqhlyqp.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>wzmmz9fp6w.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>yclnxrl5pm.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>t38b2kh725.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>7ug5zh24hu.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>9rd848q2bz.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>n6fk4nfna4.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>kbd757ywx3.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>9t245vhmpl.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>4468km3ulz.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>2u9pt9hc89.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>8s468mfl3y.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>av6w8kgt66.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>klf5c3l5u5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>ppxm28t8ap.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>424m5254lk.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>uw77j35x4d.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>578prtvx9j.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>4dzt52r2t5.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>e5fvkxwrpn.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>8c4e2ghe7u.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>zq492l623r.skadnetwork</string>
		</dict>
		<dict>
			<key>SKAdNetworkIdentifier</key>
			<string>3qcr597p9d.skadnetwork</string>
		</dict>
	</array>

```

## 1.3 编辑 AppDelegate.swift

``` swift
import UIKit

// 1.添加引用
import BJAdsCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	// 2.调用初始化方法
        self.settingBJAds()
        return true

    }
    // 2.初始化SDK
    func settingBJAds() {

        BJAdSdkConfig.shareInstance().level = .debug;
        let model = BJConfigModel();
        model.debugMode = false;
        BJAdSdkConfig.shareInstance().registerAppID("a06460e31fce62fa", withConfig: model)

    }
}
```

## 1.4 编辑 SceneDelegate.swift

``` swift
import UIKit

// 1.添加引用
import AppTrackingTransparency
import AdSupport

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func sceneDidBecomeActive(_ scene: UIScene) {
	// 3.调用idfa授权方法
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.requestTracking()
        }

    }

    // 2.请求idfa授权
    func requestTracking() {

        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                if status == .authorized {
                    let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                    print("idfa = \(idfa)");
                    
                }
            }
        }

    }
}
```

## 1.5 编辑ViewController.swift

``` swift

import UIKit

// 1.添加引用
import BJAdsAdspot
import AppTrackingTransparency
import AdSupport

class ViewController: UIViewController {
    @IBOutlet weak var idfaLabel: UILabel!
    @IBOutlet weak var appid: UILabel!

    // 2.声明变量
    var adBanner: BJAdBanner? 
    var adSplash: BJAdSplash?
    var adInTerstitial: BJAdInterstitial?

    override func viewDidLoad() {
        super.viewDidLoad()
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        self.idfaLabel.text = idfa
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    func setIdfa(idfa: String) {
        self.idfaLabel.text = idfa;
    }
    
    @IBAction func loadBannerTapped(_ sender: Any) {
	// 3.初始化Banner广告并展示
        adBanner = BJAdBanner.init(adViewController: self)
        adBanner?.loadAndShowAd()
    }
    
    @IBAction func loadSplashTapped(_ sender: Any) {
        // 4.初始化Splash广告并展示
        adSplash = BJAdSplash.init(viewController: self)
        adSplash?.loadAndShowAd()
    }
    
    @IBAction func loadInterstitialTapped(_ sender: Any) {
        // 5.初始化Interstitial广告并展示
        adInTerstitial = BJAdInterstitial.init(viewController: self)
        adInTerstitial?.loadAndShowAd()
    }
    
    @IBAction func getIdfaTapped(_ sender: Any) {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        self.idfaLabel.text = idfa
    }
}


```



