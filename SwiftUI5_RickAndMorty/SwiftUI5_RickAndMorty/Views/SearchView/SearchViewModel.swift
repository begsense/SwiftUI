//
//  SearchViewModel.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 01.06.2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    //MARK: Properties
    var mainViewModel = MainViewModel()
    @Published var searchText = ""
    @Published var selectedSegment = Segment.character
    
    enum Segment: String, CaseIterable, Identifiable {
        case character = "Characters"
        case episode = "Episodes"
        case location = "Locations"
        var id: String { self.rawValue }
    }
    
    //MARK: Functions
    var filteredCharacters: [CharacterResult] {
        if searchText.isEmpty {
            return mainViewModel.characters
        } else {
            return mainViewModel.characters.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var filteredLocations: [LocationResult] {
        if searchText.isEmpty {
            return []
        } else {
            return mainViewModel.locations.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var filteredEpisodes: [EpisodeResult] {
        if searchText.isEmpty {
            return []
        } else {
            return mainViewModel.episodes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}
