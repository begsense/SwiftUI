//
//  StoreViewModel.swift
//  SwiftUI3 - ClassWork30
//
//  Created by M1 on 26.05.2024.
//

import Foundation

final class StoreViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "ვაშლი", price: 3.0, imageName: "apple", quantity: 0, stock: 10),
        Product(name: "კარტოფილი", price: 1.5, imageName: "potato", quantity: 0, stock: 9),
        Product(name: "ბანანი", price: 3.5, imageName: "banana", quantity: 0, stock: 5),
        Product(name: "სტაფილო", price: 2.75, imageName: "carrot", quantity: 0, stock: 0),
        Product(name: "პომიდორი", price: 4.2, imageName: "potato", quantity: 0, stock: 22),
        Product(name: "მანდარინი", price: 3.5, imageName: "tangerine", quantity: 0, stock: 32),
        Product(name: "მარწყვი", price: 7, imageName: "strawberry", quantity: 0, stock: 11),
        Product(name: "ალუბალი", price: 5.7, imageName: "cherry", quantity: 0, stock: 0)
    ]
    
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
    
    func deleteProduct(product: Product) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else { return }
        products.remove(at: index)
    }
    
    func applyDiscount() {
        for i in 0..<products.count {
            products[i].price *= 0.8
        }
        isDiscountApplied = true
    }
}
