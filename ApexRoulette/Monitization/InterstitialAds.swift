//
//  InterstitialAds.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//
import SwiftUI
import GoogleMobileAds
import UIKit

final class Interstitial: GADInterstitialAd, GADFullScreenContentDelegate {
    private var interstitial: GADInterstitialAd?
    
    
    override init() {
        super.init()
        LoadInterstitial()
    }
    
    func LoadInterstitial(){
        
        //TEST ID IN THE LOADED ADS
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
        }
        )
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad presented full screen content.
    func adDidPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
    func showAd(_ sender: Any){
        let adOdds = Int.random(in: 1...4)
        let root = UIApplication.shared.windows.first?.rootViewController
        
        if interstitial != nil {
            if adOdds == 2 {
                interstitial!.present(fromRootViewController: root!)
            }
        } else {
            print("Ad wasn't ready")
        }
    }
    
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
