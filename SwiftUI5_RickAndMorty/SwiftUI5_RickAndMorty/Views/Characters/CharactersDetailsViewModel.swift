//
//  CharactersDetailsViewModel.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import Foundation
import NetworkService

class CharactersDetailsViewModel: ObservableObject {
    
    @Published var detailEpisodes: [DetailEpisodes] = []
    @Published var showFetchError = false
    
    func fetchEpisodes(urlString: String) {
        NetworkService().getData(urlString: urlString) { (result: Result<DetailEpisodes, Error>) in
            switch result {
            case .success(let episode):
                self.detailEpisodes.append(episode)
            case .failure:
                self.showFetchError = true
            }
        }
    }
}
