//
//  StoreModel.swift
//  SwiftUI3 - ClassWork30
//
//  Created by M1 on 26.05.2024.
//

import Foundation

////MARK: Model:
struct Product: Identifiable {
    let id = UUID()
    let name: String
    var price: Double
    let imageName: String
    var quantity: Int
    var stock: Int
    
    static var mockProducts: [Product] {
        [
            Product(name: "ვაშლი", price: 3.0, imageName: "apple", quantity: 0, stock: 10),
            Product(name: "კარტოფილი", price: 1.5, imageName: "potato", quantity: 0, stock: 9),
            Product(name: "ბანანი", price: 3.5, imageName: "banana", quantity: 0, stock: 5),
            Product(name: "სტაფილო", price: 2.75, imageName: "carrot", quantity: 0, stock: 0),
            Product(name: "პომიდორი", price: 4.2, imageName: "tomato", quantity: 0, stock: 22),
            Product(name: "მანდარინი", price: 3.5, imageName: "tangerine", quantity: 0, stock: 32),
            Product(name: "მარწყვი", price: 7, imageName: "strawberry", quantity: 0, stock: 11),
            Product(name: "ალუბალი", price: 5.7, imageName: "cherry", quantity: 0, stock: 0)
        
        ]
    }
    
}


