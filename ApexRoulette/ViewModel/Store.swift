//
//  Store.swift
//  Store
//
//  Created by Noah Boyers on 8/27/21.
//
import StoreKit
import SwiftUI

enum AppReviewRequest {
    static var threshhold = 5
    @AppStorage("RunSinceLastRequest") static var RunSinceLastRequest = 0
    @AppStorage("version") static var version = ""
    
    static func reviewRequestIfNeeded() {
        RunSinceLastRequest+=1
        let appBuild = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let thisVersion = "\(appVersion) Build: \(appBuild)"
        print("Version: \(thisVersion)")
        
        if thisVersion != version {
            if RunSinceLastRequest >= threshhold {
                if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                    version = thisVersion
                    RunSinceLastRequest = 0
                }
            }
        } else {
            RunSinceLastRequest = 0
        }
    }
}

class Store: UIViewController, ObservableObject  {
    
    @Published var products: [Product] = []
    @Published var purchasedID: [String] = []
    @Published var ads: Bool = true
    
    func fetchProducts() {
        Task {
            do {
                let products = try await Product.products(for: ["frent.nobos.ApexRoulette"])
                
                DispatchQueue.main.async {
                    self.products = products
                }
                
                if let product = products.first {
                    await isPurchased(product: product)
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    func isPurchased(product: Product) async {
        guard let state = await product.currentEntitlement else {
            return
        }
        
        switch state {
        case .verified(let transaction):
            DispatchQueue.main.async {
                self.purchasedID.append(transaction.productID)
            }
        case .unverified(_, _):
            break
        }
    }
    
    func purchase() {
        Task {
            guard let product = products.first else { return }
            
            do {
                let result = try await product.purchase()
                
                switch result {
                    
                case .success(let varification):
                    
                    switch varification {
                    case .verified(let transaction):
                        DispatchQueue.main.async {
                            self.purchasedID.append(transaction.productID)
                        }
                        //Always finish a transaction.
                        await transaction.finish()
                        break
                        
                    case .unverified:
                        break
                    }
                case .userCancelled, .pending:
                    break
                @unknown default:
                    break
                }
            } catch {
                print(error)
            }
        }
    }
}






