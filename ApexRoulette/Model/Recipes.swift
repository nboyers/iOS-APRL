//
//  Recipes.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/22/21.
//

import Foundation
import StoreKit

struct Recipes: Hashable {
    let id: String
    let title: String
    let description: String
    var isLocked: Bool
    var price: String?
    let locale: Locale
    let imageName: String
    lazy var formatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = locale
        return nf
        
    }()
    
    init(product: SKProduct, isLocked: Bool = true) {
        id = product.productIdentifier
        title = product.localizedTitle
        description = product.localizedDescription
        self.isLocked = isLocked
        locale = product.priceLocale
        imageName = product.productIdentifier
        
        if isLocked {
            price = formatter.string(from: product.price)
            
        }
    }
}
