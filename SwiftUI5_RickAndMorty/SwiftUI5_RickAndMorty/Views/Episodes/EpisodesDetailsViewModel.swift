//
//  EpisodesDetailsViewModel.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 01.06.2024.
//

import Foundation
import NetworkService

class EpisodesDetailsViewModel: ObservableObject {
    
    @Published var detailCharacters: [DetailCharacters] = []
    @Published var showFetchError = false
    
    func fetchCharacter(urlString: String) {
        NetworkService().getData(urlString: urlString) { (result: Result<DetailCharacters, Error>) in
            switch result {
            case .success(let character):
                self.detailCharacters.append(character)
            case .failure:
                self.showFetchError = true
            }
        }
    }
}
