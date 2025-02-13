//
//  InterstitialAdView.swift
//  MovieSwift
//
//  Created by Akshat Goyal on 11/02/25.
//  Copyright © 2025 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import AdsFramework

struct AdView: View {
    @StateObject var viewModel: AdViewModel
    
    var body: some View {
        Button("Show Interstitial Ad") {
            viewModel.loadAdActivity(key: "gam_interstitial_1")
        }
        Button("Show Rewarded Ad") {
            viewModel.loadAdActivity(key: "gam_rewarded_0")
        }
        
        Button("Show Banner Ad") {
            viewModel.loadAdActivity(key: "gam_banner_0")
        }
        
        if let bannerView = viewModel.bannerView {
            bannerView
        }
    }
}

class AdViewModel: ObservableObject, MediationAdDelegate {
    @Published var bannerView: BannerAdView?
    
    func loadAdActivity(key: String) {
        if bannerView != nil {
            bannerView = nil
        }
        let loader = AdSterAdLoader()
        loader.delegate = self
        loader.loadAd(
            adRequestConfiguration: AdRequestConfiguration(
                placement: key,
                viewController: UIApplication.shared.windows.first?.rootViewController,
                publisherProvidedId: "Test",
                customTargetingValues: ["test": "123"]
            )
        )
    }
    
    func onBannerAdLoaded(bannerAd: any AdsFramework.MediationBannerAd) {
        guard let bannerview = bannerAd.view else {
            print("Banner Ad request failed with reason banner ad null")
            return
        }
        addBannerViewToView(bannerview)
        bannerAd.eventDelegate = self
    }
    
    func addBannerViewToView(_ bannerView: UIView) {
        self.bannerView = .init(bannerView: bannerView)
    }
    
    func onInterstitialAdLoaded(interstitialAd: any AdsFramework.MediationInterstitialAd) {
        interstitialAd.presentInterstitial(from: UIApplication.shared.windows.first?.rootViewController)
        interstitialAd.eventDelegate = self
    }
    
    func onRewardedAdLoaded(rewardedAd: any AdsFramework.MediationRewardedAd) {
        rewardedAd.presentRewarded(from: UIApplication.shared.windows.first?.rootViewController)
        rewardedAd.eventDelegate = self
    }
    
    func onNativeAdLoaded(nativeAd: any AdsFramework.MediationNativeAd) {
        
    }
    
    func onCustomNativeAdLoaded(customNativeAd: any AdsFramework.MediationNativeCustomFormatAd) {
        
    }
    
    func onAdFailedToLoad(error: AdsFramework.AdError) {
        print("Interstitial Ad request failed with reason \(String(describing: error.description))")
    }
}

extension AdViewModel: MediationInterstitialAdEventDelegate {
    func ad(didFailToPresentFullScreenContentWithError error: AdsFramework.AdError) {
        
    }
    
    func adWillPresentFullScreenContent() {
        
    }
    
    func adDidDismissFullScreenContent() {
        
    }
    
    func recordClick() {
        
    }
    
    func recordImpression() {
        
    }
}

extension AdViewModel: MediationRewardedAdEventDelegate {
    func didRewardUser() {
        
    }
    
    func didStartVideo() {
        
    }
    
    func didEndVideo() {
        
    }
}

extension AdViewModel: MediationBannerAdEventDelegate {
    
}
