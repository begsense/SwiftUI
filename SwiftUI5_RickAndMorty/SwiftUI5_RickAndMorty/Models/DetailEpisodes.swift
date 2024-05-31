//
//  DetailEpisodes.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation

struct DetailEpisodes: Decodable, Hashable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
