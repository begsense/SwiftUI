//
//  StoreModel.swift
//  SwiftUI3 - ClassWork30
//
//  Created by M1 on 26.05.2024.
//

import Foundation

//MARK: Model:
struct Product: Identifiable {
    let id = UUID()
    let name: String
    var price: Double
    let imageName: String
    var quantity: Int
    var stock: Int
}
