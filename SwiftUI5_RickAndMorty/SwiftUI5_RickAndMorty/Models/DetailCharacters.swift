//
//  DetailCharacters.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation

struct DetailCharacters: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
