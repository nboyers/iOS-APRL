//
//  Store.swift
//  Store
//
//  Created by Noah Boyers on 8/27/21.
//
import StoreKit
import SwiftUI

class Store: ObservableObject {
    
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
            print("Verified")
            DispatchQueue.main.async {
                self.purchasedID.append(transaction.productID)
            }
        case .unverified(_, _):
            print("Not Verified")
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






