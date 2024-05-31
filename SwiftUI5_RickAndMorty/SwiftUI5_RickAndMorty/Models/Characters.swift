//
//  Characters.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation

struct Characters: Decodable {
    let info: Info
    let results: [CharacterResult]
}

struct CharacterResult: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String
}

//MARK: - Helper enums/struct

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Decodable {
    let name: String
    let url: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

