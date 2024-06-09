//
//  FavoritesView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 09.06.2024.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var favoritedMovies: [MoviesData]
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            NavigationStack {
                if favoritedMovies.isEmpty {
                    Spacer()
                    
                    VStack {
                        Text("No favourites yet")
                            .font(.custom("Montserrat", size: 16))
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("All moves marked as favourite will be added here")
                            .font(.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                    }
                    .navigationTitle("Favourites")
                    .frame(maxWidth: 252)
                    
                    Spacer()
                }
                else {
                    ScrollView {
                        ForEach(favoritedMovies) { movie in
                            NavigationLink(destination: MovieDetailsView(selectedFavoritedMovie: movie)) {
                                MovieCellView(posterPath: movie.posterPath, title: movie.title, voteAverage: movie.voteAverage, starCount: Int(viewModel.starCount(movieIndex: movie.voteAverage)), voteCount: movie.voteCount, releaseDate: movie.releaseDate, language: movie.language)
                            }
                        }
                    }
                    .navigationTitle("Favourites")
                }
            }
            .foregroundColor(.primary)
            .alert(isPresented: $viewModel.showFetchError) {
                Alert(title: Text("Error"), message: Text("Failed to fetch data"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    FavoritesView()
}
