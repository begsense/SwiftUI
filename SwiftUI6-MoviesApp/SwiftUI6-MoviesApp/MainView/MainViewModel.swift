//
//  MainViewModel.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import Foundation
import NetworkServicePackage

class MainViewModel: ObservableObject {
    
    @Published var movies: [MoviesResults] = []
    @Published var showFetchError = false
    
    init() {
        fetchMovies()
    }
    
    func fetchMovies() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=d0f1a138abd5d30a7958d5085db7e4f9"
        
        NetworkService().getData(urlString: urlString) { (result: Result<Movies, Error>) in
            switch result {
            case .success(let movies):
                self.movies = movies.results
            case .failure:
                self.showFetchError = true
            }
        }
    }
    
}
