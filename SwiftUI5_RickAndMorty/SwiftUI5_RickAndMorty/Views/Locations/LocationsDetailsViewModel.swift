//
//  LocationsDetailsViewModel.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation
import NetworkServicePackage

class LocationsDetailsViewModel: ObservableObject {
    
    @Published var detailCharacters: [DetailCharacters] = []
    @Published var showFetchError = false
    
    func fetchEpisodes(urlString: String) {
        NetworkService().getData(urlString: urlString) { (result: Result<DetailCharacters, Error>) in
            switch result {
            case .success(let episode):
                self.detailCharacters.append(episode)
            case .failure:
                self.showFetchError = true
            }
        }
    }
}
