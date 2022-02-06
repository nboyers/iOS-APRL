//
//  InterstitialAds.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//
import SwiftUI
import GoogleMobileAds
import UIKit
import AppTrackingTransparency
import AdSupport



final class Interstitial: GADInterstitialAd, GADFullScreenContentDelegate {
    private var interstitial: GADInterstitialAd?
    
    
    override init() {
        super.init()
        requestIDFA()
    }
    
    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { [self] status in
            LoadInterstitial()
        })
    }
    func LoadInterstitial(){
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-7542723422099323/2747333409",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad ?? nil
            interstitial?.fullScreenContentDelegate = self
        })
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad presented full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    func showAd(_ sender: Any){
        let root = UIApplication.shared.windows.first?.rootViewController
        
        if interstitial != nil {
            interstitial!.present(fromRootViewController: root!)
        } else {
            print("Ad wasn't ready")
            return
        }
    }
    
}

