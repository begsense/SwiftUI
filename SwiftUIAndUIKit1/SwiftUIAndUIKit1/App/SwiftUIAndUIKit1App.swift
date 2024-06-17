//
//  SwiftUIAndUIKit1App.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import SwiftUI

@main
struct SwiftUIAndUIKit1App: App {
    var body: some Scene {
        WindowGroup {
            NewsView(viewModel: NewsViewModel())
        }
    }
}
