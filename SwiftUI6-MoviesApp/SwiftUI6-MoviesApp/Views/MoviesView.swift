//
//  MoviesView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var mainViewModel = MainViewModel()
    private let columns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5) {
                        ForEach(0..<mainViewModel.movies.count, id: \.self) { index in
                            NavigationLink(value: index) {
                                VStack {
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(mainViewModel.movies[index].posterPath)")) { image in
                                        image.resizable()
                                            .frame(width: 100, height: 145)
                                            .scaledToFill()
                                            .cornerRadius(16)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(mainViewModel.movies[index].title)
                                        .font(.custom("Poppins", size: 12))
                                        .foregroundColor(.primary)
                                        .frame(width: 100, height: 36)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) { index in
                    MovieDetailsView(selectedMovie: mainViewModel.movies[index],
                                     selectedFavoritedMovie: MoviesData(backdropPath: mainViewModel.movies[index].backdropPath, posterPath: mainViewModel.movies[index].posterPath, title: mainViewModel.movies[index].title, voteAverage: mainViewModel.movies[index].voteAverage, starCount: Int(mainViewModel.starCount(movieIndex: mainViewModel.movies[index].voteAverage)), voteCount: mainViewModel.movies[index].voteCount, releaseDate: mainViewModel.movies[index].releaseDate, language: mainViewModel.movies[index].originalLanguage.rawValue, overview: mainViewModel.movies[index].overview))
                }
                .navigationTitle("Movies")
            }
        }
    }
}



#Preview {
    MoviesView()
}
