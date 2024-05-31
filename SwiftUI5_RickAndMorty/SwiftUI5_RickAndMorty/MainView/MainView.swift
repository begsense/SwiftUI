//
//  MainView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    private let columns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem { Text("Characters") }
            LocationsView()
                .tabItem { Text("Locations") }
            EpisodesView()
                .tabItem { Text("Episodes") }
            SearchView()
                .tabItem { Text("Search") }
        }
        .alert(isPresented: $viewModel.showFetchError) {
            Alert(title: Text("რო იცოდე"),
                  message: Text("ვერ მოიქაჩა ინფორმაცია"),
                  dismissButton: .default(Text("კაი ჩემო ძმაო!")))
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
}
