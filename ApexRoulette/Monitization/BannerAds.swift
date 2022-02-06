//
//  BannerAds.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 2/6/22.
//

import SwiftUI
import GoogleMobileAds
import UIKit
import AppTrackingTransparency
import AdSupport

final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)

        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-7542723422099323/3228985376"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeSmartBannerPortrait.size)
        requestIDFA()
        view.load(GADRequest())

        return viewController
    }
    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
      })
    }


    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct Banner: View {
    var body: some View {
        HStack{
            Spacer()
            BannerVC()
                .frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
