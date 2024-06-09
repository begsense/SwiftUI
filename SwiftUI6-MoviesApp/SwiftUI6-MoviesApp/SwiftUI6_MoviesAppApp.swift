//
//  SwiftUI6_MoviesAppApp.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI6_MoviesAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
        .modelContainer(for: MoviesData.self)
    }
}
