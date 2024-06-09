//
//  MoviesData.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 09.06.2024.
//

import Foundation
import SwiftData

@Model
class MoviesData: Identifiable {
    let backdropPath: String
    let posterPath: String
    let title: String
    let voteAverage: Double
    let starCount: Int
    let voteCount: Int
    let releaseDate: String
    let language: String
    let overview: String
    
    init(backdropPath: String, posterPath: String, title: String, voteAverage: Double, starCount: Int, voteCount: Int, releaseDate: String, language: String, overview: String) {
        self.backdropPath = backdropPath
        self.posterPath = posterPath
        self.title = title
        self.voteAverage = voteAverage
        self.starCount = starCount
        self.voteCount = voteCount
        self.releaseDate = releaseDate
        self.language = language
        self.overview = overview
    }
    
}
