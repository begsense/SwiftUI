//
//  SwiftUI4_TravelApp.swift
//  SwiftUI4-TravelApp
//
//  Created by M1 on 29.05.2024.
//

import SwiftUI

@main
struct SwiftUI4_TravelApp: App {
    var body: some Scene {
        WindowGroup {
            TravelMainView(viewModel: TravelMainViewModel())
        }
    }
}
