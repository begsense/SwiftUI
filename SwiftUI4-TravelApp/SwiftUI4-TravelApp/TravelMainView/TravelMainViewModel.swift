//
//  TravelMainViewModel.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 29.05.2024.
//

import Foundation

final class TravelMainViewModel: ObservableObject {
    
    @Published var tips = Tip.tips
    @Published var destinations: [Destination] = []
    @Published var errorMessage: String? = nil
    
    func fetchDestinations() {
        let urlString = "https://mocki.io/v1/baaf6de9-0bda-435a-bd6d-2fbe425d6c7e"
        
        NetworkService().getData(urlString: urlString) { (result: Result<[Destination], Error>) in
            switch result {
            case .success(let destinations):
                self.destinations = destinations
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func randomTip() -> Tip {
        tips.randomElement()!
    }
}
