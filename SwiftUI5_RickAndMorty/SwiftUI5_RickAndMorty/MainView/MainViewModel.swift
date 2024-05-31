//
//  MainViewModel.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation
import NetworkService

class MainViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var characters: [CharacterResult] = []
    @Published var locations: [LocationResult] = []
    @Published var episodes: [EpisodeResult] = []
    @Published var showFetchError = false
    
    //MARK: Init
    init() {
        fetchCharacters()
        fetchLocations()
        fetchEpisodes()
    }
    
    //MARK: Functions
    func fetchCharacters() {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        NetworkService().getData(urlString: urlString) { (result: Result<Characters, Error>) in
            switch result {
            case .success(let characters):
                self.characters = characters.results
            case .failure:
                self.showFetchError = true
            }
        }
    }
    
    func fetchLocations() {
        let urlString = "https://rickandmortyapi.com/api/location"
        
        NetworkService().getData(urlString: urlString) { (result: Result<Locations, Error>) in
            switch result {
            case .success(let locations):
                self.locations = locations.results
            case .failure:
                self.showFetchError = true
            }
        }
    }
    
    func fetchEpisodes() {
        let urlString = "https://rickandmortyapi.com/api/episode"
        
        NetworkService().getData(urlString: urlString) { (result: Result<Episodes, Error>) in
            switch result {
            case .success(let episodes):
                self.episodes = episodes.results
            case .failure:
                self.showFetchError = true
            }
        }
    }
}
