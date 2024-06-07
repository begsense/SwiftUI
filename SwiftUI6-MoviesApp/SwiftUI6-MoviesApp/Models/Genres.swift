//
//  Genres.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 07.06.2024.
//

import Foundation

struct Genres: Decodable {
    let genres: [GenreResults]
}

struct GenreResults: Decodable {
    let id: Int
    let name: String
}
