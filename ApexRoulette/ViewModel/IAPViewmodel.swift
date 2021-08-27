//
//  InAppPurchaseViewModel.swift
//  InAppPurchaseViewModel
//
//  Created by Noah Boyers on 8/26/21.
//
import StoreKit
import Foundation
import SwiftUI

class IAPViewmodel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var purchasedID: [String] = []
    @Published var ads: Bool = true
   
    init()
    {
        fetchProducts()
    }
    
    func fetchProducts() {
        Task {
            do {
                let products = try await Product.products(for: ["frent.nobos.money01"])
                
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
    
    func purchase()  {
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
                        break
                        
                    case .unverified(_,_):
                        break
                    }
                    
                case .userCancelled:
                    break
                case .pending:
                    break
                @unknown default:
                    break
                }
            }
            catch {
                print(error)
            }
        }
    }
}






