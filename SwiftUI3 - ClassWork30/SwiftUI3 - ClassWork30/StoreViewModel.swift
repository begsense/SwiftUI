//
//  StoreViewModel.swift
//  SwiftUI3 - ClassWork30
//
//  Created by M1 on 26.05.2024.
//

import Foundation

final class StoreViewModel: ObservableObject {
    //MARK: Properties:
    @Published var products = Product.mockProducts
    var isDiscountApplied = false
    
    var googleUrl: URL = {
        guard let url = URL(string: "https://www.google.com") else {
            fatalError("Invalid URL")
        }
        return url
    }()
    
    var totalCost: Double {
        products.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    var totalItems: Int {
        products.reduce(0) { $0 + $1.quantity }
    }
    
    //MARK: Functions:
    func addToCart(product: Product) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        if products[index].quantity < products[index].stock {
            products[index].quantity += 1
        }
    }
    
    func removeFromCart(product: Product) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        if products[index].quantity > 0 {
            products[index].quantity -= 1
        }
    }
    
    func deleteFromCart(product: Product) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        if products[index].quantity > 0 {
            products[index].quantity = 0
        }
    }
    
    func applyDiscount() {
        for i in 0..<products.count {
            products[i].price *= 0.8
        }
        isDiscountApplied = true
    }
}
