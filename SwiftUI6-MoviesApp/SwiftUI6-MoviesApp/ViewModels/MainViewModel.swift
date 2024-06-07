//
//  MainViewModel.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import Foundation
import NetworkServicePackage

class MainViewModel: ObservableObject {
    //MARK: Properies
    @Published var movies: [MoviesResults] = []
    @Published var genres: [GenreResults] = []
    @Published var searchText = ""
    @Published var searchOption: SearchOption = .title
    @Published var filteredMovies: [MoviesResults] = []
    @Published var showFetchError = false
    @Published var currentViewState: ViewState = .hello
    
    enum SearchOption: String, CaseIterable, Identifiable {
        case title = "Name"
        case genre = "Genre"
        case year = "Year"
        var id: String { self.rawValue }
    }
    
    enum ViewState {
        case hello
        case results
        case noResults
    }
    
    //MARK: Init
    init() {
        fetchMovies()
        fetchGenres()
    }
    
    //MARK: Functions
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
    
    func fetchGenres() {
        let urlString = "https://api.themoviedb.org/3/genre/movie/list?api_key=d0f1a138abd5d30a7958d5085db7e4f9"
        
        NetworkService().getData(urlString: urlString) { (result: Result<Genres, Error>) in
            switch result {
            case .success(let genres):
                self.genres = genres.genres
            case .failure:
                self.showFetchError = true
            }
        }
    }
    
    func filterMovies() {
        switch searchOption {
        case .title:
            filteredMovies = movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        case .genre:
            filteredMovies = movies.filter { movie in
                movie.genreIDS.contains { genreID in
                    if let genre = genres.first(where: { $0.id == genreID }) {
                        return genre.name.localizedCaseInsensitiveContains(searchText)
                    }
                    return false
                }
            }
        case .year:
            filteredMovies = movies.filter { $0.releaseDate.contains(searchText) }
        }
        checkContent()
    }
    
    func starCount(movieIndex: Double) -> Double {
        switch movieIndex {
        case 9...10:
            return 5
        case 7..<9:
            return 4
        case 5..<7:
            return 3
        case 3..<5:
            return 2
        default:
            return 1
        }
    }
    
    func checkContent() {
        if searchText.isEmpty {
            currentViewState = .hello
        } else if filteredMovies.isEmpty {
            currentViewState = .noResults
        } else {
            currentViewState = .results
        }
    }
    
}
