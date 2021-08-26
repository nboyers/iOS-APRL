//
//  InAppPurchaseViewModel.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/22/21.
//

import StoreKit

//Class that drives if the user has paid or not


typealias FetchCompletionhandler  = (([SKProduct]) -> Void)
typealias PurchaseCompleteHandler = ((SKPaymentTransaction?)-> Void)

public class Store : NSObject, ObservableObject  {
    
    
    @Published var allRecipes = [Recipes]()
    
    private let allProductsIDs = Set([
        "frent.nobos.rewards",
    ])
    
    private var productRequest: SKProductsRequest?
    private var fetchProducts = [SKProduct]()
    private var fetchCompletionHandler: FetchCompletionhandler?
    
    private var completedPurChases = [String]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self  else { return }
                for index in self.allRecipes.indices {
                    self.allRecipes[index].isLocked = !self.completedPurChases
                        .contains(self.allRecipes[index].id)
                }
                
            }
        }
    }
    
    private var purchaseCompletionHandler: PurchaseCompleteHandler?
    
    override init() {
        super.init()
        startObservingPaymentQueue()
        fetchProducts { products in
            self.allRecipes = products.map{ Recipes(product: $0) }
        }
    }
    
    private func startObservingPaymentQueue(){
        SKPaymentQueue.default().add(self)
    }
    
    private func fetchProducts(_ completion: @escaping
                                FetchCompletionhandler) {
        guard self.productRequest == nil else { return }
        
        fetchCompletionHandler = completion
        productRequest = SKProductsRequest(productIdentifiers: allProductsIDs)
        
        productRequest?.delegate = self
        productRequest?.start()
        
    }
    
    private func buy(_ product: SKProduct, completion: @escaping
                        PurchaseCompleteHandler) {
        purchaseCompletionHandler = completion
        
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
}

extension Store {
    func product(for id: String ) -> SKProduct? {
        return fetchProducts.first(where: {$0.productIdentifier == id})
    }
    
    func purchaseProduct(_ product: SKProduct){
        startObservingPaymentQueue()
        buy(product) { _ in}
    }
    
    func restorePurchase(){
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}


extension Store: SKPaymentTransactionObserver {
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions
                                transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            var shouldFinishTransactions = false
            
            
            switch transaction.transactionState {
            case .purchased, .restored:
                completedPurChases.append(transaction.payment
                                            .productIdentifier)
                shouldFinishTransactions = true
            case .failed:
                shouldFinishTransactions = true
            case .deferred, .purchasing:
                break
            @unknown default:
                break
            }
            if shouldFinishTransactions {
                SKPaymentQueue.default().finishTransaction(transaction)
                DispatchQueue.main.async {
                    self.purchaseCompletionHandler?(transaction)
                    self.purchaseCompletionHandler = nil
                }
            }
        }
    }
}

extension Store: SKProductsRequestDelegate {
    public func productsRequest(_ request: SKProductsRequest, didReceive response:
                                    SKProductsResponse) {
        let loadedProducts = response.products
        let invalidProdut = response.invalidProductIdentifiers
        
        guard !loadedProducts.isEmpty else {
            print("Could not load the products")
            if !invalidProdut.isEmpty {
                print("Invalid products found \(invalidProdut)")
            }
            productRequest = nil
            return
        }
        
        // Cache the fetched products
        fetchProducts = loadedProducts
        
        //Notify anyone waiting on the product load
        DispatchQueue.main.async {
            self.fetchCompletionHandler?(loadedProducts)
            self.fetchCompletionHandler = nil
            self.productRequest = nil
        }
    }
}
