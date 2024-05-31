//
//  SwiftUI5_RickAndMortyApp.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

@main
struct SwiftUI5_RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
