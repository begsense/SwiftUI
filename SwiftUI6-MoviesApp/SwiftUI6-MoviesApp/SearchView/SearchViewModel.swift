//
//  SearchViewModel.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    private var mainViewModel = MainViewModel()
    
    @Published var searchText = ""
    
    var filteredMovies: [MoviesResults] {
        if searchText.isEmpty {
            return []
        } else {
            return mainViewModel.movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}
