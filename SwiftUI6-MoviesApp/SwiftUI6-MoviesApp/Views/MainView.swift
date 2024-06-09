//
//  MainView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Text("Home")
                    Image("home")
                }
            
            SearchView()
                .tabItem {
                    Text("Search")
                    Image("search")
                }
            
            FavoritesView()
                .tabItem {
                    Text("Favorites")
                    Image(systemName: "heart.fill")
                }
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
