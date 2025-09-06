//
//  ViewController.swift
//  swift_demo
//
//  Created by ext.jiangyelin1 on 2023/7/12.
//

import UIKit
import BJAdsAdspot
import AppTrackingTransparency
import AdSupport
import BJAdsCore

class ViewController: UIViewController,BJAdNativeExpressDelegate,BJAdBannerDelegate {
    @IBOutlet weak var idfaLabel: UILabel!
    @IBOutlet weak var appid: UILabel!
    var adBanner: BJAdBanner?
    var adSplash: BJAdSplash?
    var adInTerstitial: BJAdInterstitial?
    var adRewardVideo: BJAdRewardVideo?
    var adNativeExpress: BJAdNativeExpress?
    var arrViewsM: NSMutableArray?
    var dataArrM: NSMutableArray?
    var firstView: BJAdNativeExpressView?
    var y: Double!
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
        adBanner = BJAdBanner.init(adViewController: self)
//        adBanner?.delegate = self
        adBanner?.loadAndShowAd()
    }
    
    @IBAction func loadSplashTapped(_ sender: Any) {
        adSplash = BJAdSplash.init(viewController: self)
        adSplash?.loadAndShowAd()
    }
    
    @IBAction func loadInterstitialTapped(_ sender: Any) {
        adInTerstitial = BJAdInterstitial.init(viewController: self)
        adInTerstitial?.loadAndShowAd()
    }
    
    @IBAction func loadRewardVideoTapped(_ sender: Any) {
        adRewardVideo = BJAdRewardVideo.init(viewController: self)
        adRewardVideo?.loadAndShowAd()
        
    }
    
    @IBAction func loadNativeExpressTapped(_ sender: Any) {
        adNativeExpress = BJAdNativeExpress.init(viewController: self, adSize: CGSize(width: self.view.bounds.size.width, height: 0))
        adNativeExpress?.delegate = self
        adNativeExpress?.loadAndShowAd()
        dataArrM = NSMutableArray()
        
    }
    
    @IBAction func getIdfaTapped(_ sender: Any) {
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        self.idfaLabel.text = idfa
        
    }
    
    func ad_NativeExpress(onAdLoadSuccess views: [BJAdNativeExpressView]?) {
        self.arrViewsM?.removeAllObjects()
        self.arrViewsM = NSMutableArray(array: views!)
        for view in views! {
            let tmpView = view as BJAdNativeExpressView
            tmpView.render()
            self.dataArrM?.addObjects(from: [tmpView])
        }
        if (self.dataArrM!.count <= 0) {
            return
        }
        firstView = (self.dataArrM?.firstObject as! BJAdNativeExpressView)
        self.view.addSubview(firstView!.expressView)
        firstView!.expressView.frame = CGRectMake(0, 450, self.view.bounds.size.width, 300)
    }

    func ad_NativeExpress(onAdRenderSuccess adView: BJAdNativeExpressView?) {
        firstView!.expressView.frame = CGRectMake(0, 450, self.view.bounds.size.width, (adView?.expressView.frame.size.height)!)
    }
    
    func ad_NativeExpress(onAdClosed adView: BJAdNativeExpressView?) {
        self.dataArrM?.remove(adView as Any)
        adView?.expressView.removeFromSuperview()
    }
    
}

