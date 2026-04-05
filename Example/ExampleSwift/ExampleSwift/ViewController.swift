//
//  ViewController.swift
//  BJAdsSwift
//
//  Created by ext.jiangyelin1 on 2023/8/2.
//

import UIKit

// 1.添加引用
import BJAdsAdspot
import AppTrackingTransparency
import AdSupport
import Masonry


class ViewController: UIViewController, BJAdNativeExpressDelegate {
    
    // 2.声明变量
    var adBanner: BJAdBanner?
    var adSplash: BJAdSplash?
    var adInTerstitial: BJAdInterstitial?
    var adRewardVideo: BJAdRewardVideo?
    var adNativeExpress: BJAdNativeExpress?
    var arrViewsM: NSMutableArray?
    var dataArrM: NSMutableArray?
    /// 与 DemoListFeedExpressViewController：首个广告视图的 `expressView`，用于布局与更新高度
    var nativeExpressContainerView: UIView?
    /// 与 DemoBannerViewController 一致：固定比例高度，贴底上方留白，供 Banner 展示
    var bannerContainer: UIView?

    /// Main.storyboard 中 5 个按钮栈在 safeArea 下约 310pt；信息流贴在其下方，避免与按钮重叠（Demo 的 330 针对带导航栏的页面）
    private let nativeExpressTopOffsetFromSafeArea: CGFloat = 322

    /// 移除 Banner（加载其它类型广告前调用）
    private func dismissBanner() {
        adBanner = nil
        bannerContainer?.subviews.forEach { $0.removeFromSuperview() }
    }

    /// 移除信息流广告视图与实例（与其它广告互斥时调用）
    private func dismissNativeExpress() {
        adNativeExpress = nil
        nativeExpressContainerView?.removeFromSuperview()
        nativeExpressContainerView = nil
        arrViewsM?.removeAllObjects()
        dataArrM?.removeAllObjects()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        setupBannerContainer()
    }

    /// 对齐 `DemoBannerViewController`：宽高比约 640:100，距底 safeArea + 100pt
    private func setupBannerContainer() {
        if bannerContainer != nil {
            return
        }
        let scale: CGFloat = 100.0 / 640.0
        let h = view.bounds.size.width * scale
        var insets = UIEdgeInsets.zero
        if #available(iOS 11.0, *) {
            insets = view.safeAreaInsets
        }
        let y = view.bounds.size.height - insets.bottom - h - 100
        let container = UIView(frame: CGRect(x: 0, y: y, width: view.bounds.size.width, height: h))
        container.autoresizingMask = [.flexibleTopMargin, .flexibleWidth]
        container.backgroundColor = .clear
        view.addSubview(container)
        bannerContainer = container
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - 与 DemoListFeedExpressViewController `-showNativeAd` 一致：先 render，再挂首个 expressView，左/右/顶约束，高度在渲染/曝光里更新

    private func showNativeAd() {
        guard let arr = arrViewsM as? [BJAdNativeExpressView], !arr.isEmpty else {
            return
        }
        if dataArrM == nil {
            dataArrM = NSMutableArray()
        } else {
            dataArrM?.removeAllObjects()
        }
        for item in arr {
            item.render()
            dataArrM?.add(item)
        }
        guard let dataArr = dataArrM as? [Any], !dataArr.isEmpty,
              let first = dataArr.first as? BJAdNativeExpressView else {
            return
        }
        let express = first.expressView
        nativeExpressContainerView?.removeFromSuperview()
        nativeExpressContainerView = express
        view.addSubview(express)
        view.bringSubviewToFront(express)
        // 与 ObjC Demo 一致：只约束左/右/顶，不在此处写死高度（原先 height=1 会导致几乎不可见）
        if #available(iOS 11.0, *) {
            express.mas_remakeConstraints { [weak self] make in
                guard let self = self else { return }
                make?.left.mas_equalTo()(0)
                make?.right.mas_equalTo()(0)
                make?.top.equalTo()(self.view.mas_safeAreaLayoutGuideTop)?.offset()(self.nativeExpressTopOffsetFromSafeArea)
            }
        } else {
            express.mas_remakeConstraints { make in
                make?.left.mas_equalTo()(0)
                make?.right.mas_equalTo()(0)
                make?.top.mas_equalTo()(330)
            }
        }
        view.layoutIfNeeded()
    }

    @IBAction func loadBannerTapped(_ sender: Any) {
        dismissNativeExpress()
        adBanner = BJAdBanner(adViewController: self)
        if let container = bannerContainer {
            adBanner?.adContainer = container
        }
        adBanner?.loadAndShowAd()
    }
    
    @IBAction func loadSplashTapped(_ sender: Any) {
        dismissBanner()
        dismissNativeExpress()
        adSplash = BJAdSplash(viewController: self)
        adSplash?.loadAndShowAd()
    }
    
    @IBAction func loadInterstitialTapped(_ sender: Any) {
        dismissBanner()
        dismissNativeExpress()
        adInTerstitial = BJAdInterstitial(viewController: self)
        adInTerstitial?.loadAndShowAd()
    }
    
    @IBAction func loadRewardVideoTapped(_ sender: Any) {
        dismissBanner()
        dismissNativeExpress()
        adRewardVideo = BJAdRewardVideo(viewController: self)
        adRewardVideo?.loadAndShowAd()
    }
    
    @IBAction func loadNativeExpressTapped(_ sender: Any) {
        dismissBanner()
        dismissNativeExpress()
        dataArrM = NSMutableArray()
        arrViewsM = NSMutableArray()
        adNativeExpress = BJAdNativeExpress(viewController: self, adSize: CGSize(width: view.bounds.size.width, height: 0))
        adNativeExpress?.delegate = self
        adNativeExpress?.loadAndShowAd()
    }

    // MARK: - BJAdNativeExpressDelegate
    // 显式 @objc 选择子，保证各渠道 Adapter 里 respondsToSelector: 能通过（否则仅有 SDK 日志、界面不展示）

    @objc(ad_NativeExpressOnAdLoadSuccess:)
    func ad_NativeExpress(onAdLoadSuccess views: [BJAdNativeExpressView]?) {
        guard let views = views, !views.isEmpty else {
            return
        }
        arrViewsM = NSMutableArray(array: views)
        showNativeAd()
    }

    @objc(ad_NativeExpressOnAdLoadFailWithError:)
    func ad_NativeExpress(onAdLoadFailWithError error: Error?) {
        dismissNativeExpress()
    }

    @objc(ad_NativeExpressOnAdRenderSuccess:)
    func ad_NativeExpress(onAdRenderSuccess adView: BJAdNativeExpressView?) {
        updateNativeExpressHeight(adView: adView)
    }

    @objc(ad_NativeExpressOnAdRenderFail:withError:)
    func ad_NativeExpress(onAdRenderFail adView: BJAdNativeExpressView?, withError error: Error?) {
        if let adView = adView {
            dataArrM?.remove(adView)
        }
    }

    func ad_NativeExpressOnAdGetViewIsEmpty() {
        // 与 Demo 一致：可按需提示
    }

    @objc(ad_NativeExpressOnAdShow:)
    func ad_NativeExpress(onAdShow adView: BJAdNativeExpressView?) {
        updateNativeExpressHeight(adView: adView)
    }

    @objc(ad_NativeExpressOnAdClicked:)
    func ad_NativeExpress(onAdClicked adView: BJAdNativeExpressView?) {
    }

    @objc(ad_NativeExpressOnAdClosed:)
    func ad_NativeExpress(onAdClosed adView: BJAdNativeExpressView?) {
        if let adView = adView {
            dataArrM?.remove(adView)
        }
        if let ev = adView?.expressView {
            ev.removeFromSuperview()
        }
        if let ev = adView?.expressView, nativeExpressContainerView === ev {
            nativeExpressContainerView = nil
        }
    }

    @objc(ad_NativeExpressOnAdDislike:)
    func ad_NativeExpress(onAdDislike adView: BJAdNativeExpressView?) {
        if let adView = adView {
            dataArrM?.remove(adView)
        }
    }

    /// 与 Demo：`mas_updateConstraints` 高度为 `expressView.frame.size.height`；高度为 0 时用占位高度，避免空白
    private func updateNativeExpressHeight(adView: BJAdNativeExpressView?) {
        guard let expressView = adView?.expressView else { return }
        expressView.setNeedsLayout()
        expressView.layoutIfNeeded()
        var h = expressView.frame.size.height
        if h <= 0 {
            let size = expressView.systemLayoutSizeFitting(
                CGSize(width: view.bounds.width, height: UIView.layoutFittingExpandedSize.height),
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )
            h = size.height
        }
        if h <= 0 {
            h = 300
        }
        expressView.mas_updateConstraints { make in
            make?.height.mas_equalTo()(h)
        }
        view.layoutIfNeeded()
    }
}
