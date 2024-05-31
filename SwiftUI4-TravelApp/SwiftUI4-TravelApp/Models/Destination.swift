//
//  Destination.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 29.05.2024.
//

import Foundation

struct Destination: Decodable, Hashable {
    let slug: String
    let cover, poster: String
    let title, shortdescription, description, country: String
    let price: Int
    let transport: String
    let transportimage: String
    let transportinfo, mustsee, mustseedetails: String
    let mustseeimage: String
    let hotels: [Hotel]
}

struct Hotel: Codable, Hashable {
    let name, description: String
    let image: String
}
