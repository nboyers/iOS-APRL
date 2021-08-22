//
//  InterstitialAds.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 7/23/21.
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
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
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
