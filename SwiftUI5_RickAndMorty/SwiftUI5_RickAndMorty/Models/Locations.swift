//
//  Locations.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation

struct Locations: Decodable {
    let results: [LocationResult]
}

struct LocationResult: Decodable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
