//
//  MovieDetailsView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 07.06.2024.
//

import SwiftUI
import SwiftData

struct MovieDetailsView: View {
    @State var selectedMovie: MoviesResults?
    @StateObject var viewModel = MainViewModel()
    @Environment(\.modelContext) private var context
    @State private var isFavoriteClicked = false
    @State var selectedFavoritedMovie: MoviesData?
    @Query private var favoritedMovies: [MoviesData]
    
    var body: some View {
        VStack {
            coverImage
            
            titleAndPoster
            
            details
            
            Spacer()
                .frame(height: 25)
            
            overview
        }
        .multilineTextAlignment(.leading)
        .foregroundColor(.primary)
        .navigationBarTitle(Text("\(selectedMovie?.title ?? selectedFavoritedMovie?.title ?? "Error! Sorry")"), displayMode: .inline)
        .onAppear {
            isFavoriteClicked = selectedMovie.map { viewModel.checkIfFavorited(movie: $0, favoritedMovies: favoritedMovies) } ?? (selectedFavoritedMovie != nil)
        }
    }
    
    //MARK: ComputedProperties
    private var coverImage: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(selectedMovie?.backdropPath ?? selectedFavoritedMovie?.backdropPath ?? "Error! Sorry")") ) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 210)
                .cornerRadius(1)
                .overlay(alignment: .bottomTrailing) {
                    HStack {
                        Image("star")
                        Text(String(format: "%.1f", selectedMovie?.voteAverage ?? selectedFavoritedMovie?.voteAverage ?? 0))
                            .foregroundColor(Color(red: 255/255, green: 135/255, blue: 0/255))
                            .padding(.trailing, 14)
                    }
                }
        } placeholder: {
            ProgressView()
        }
    }
    
    private var titleAndPoster: some View {
        Text(selectedMovie?.originalTitle ?? selectedFavoritedMovie?.title ?? "Error! Sorry")
            .frame(width: 210, height: 48, alignment: .center)
            .padding(.leading, 70)
            .overlay(alignment: .leading) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(selectedMovie?.posterPath ?? selectedFavoritedMovie?.posterPath  ?? "Error! Sorry")") ) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 95, maxHeight: 120)
                        .cornerRadius(16)
                        .padding(EdgeInsets(top: -78, leading: -30, bottom: 0, trailing: 0))
                } placeholder: {
                    ProgressView()
                }
            }
    }
    
    private var details: some View {
        HStack {
            Image("calendar")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(selectedMovie?.releaseDate.prefix(4) ?? selectedFavoritedMovie?.releaseDate.prefix(4) ?? "Error! Sorry")
                .font(.custom("Poppins", size: 14))
            
            Text("|")
            
            Image("language")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text(selectedMovie?.originalLanguage.rawValue ?? selectedFavoritedMovie?.language ?? "Error! Sorry")
                .font(.custom("Poppins", size: 14))
            
            Text("|")
            
            Image("ticket")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
            
            Text("Action")
                .font(.custom("Poppins", size: 14))
        }
        .foregroundColor(Color(red: 146/255, green: 146/255, blue: 157/255))
    }
    
    private var overview: some View {
        VStack {
            HStack {
                Text("About Movie")
                    .font(.custom("Poppins", size: 24))
                
                Spacer()
                
                Button(action: {
                    viewModel.toggleFavoriteStatus(movie: selectedMovie, favoritedMovie: selectedFavoritedMovie, favoritedMovies: favoritedMovies, context: context)
                    isFavoriteClicked.toggle()
                }, label: {
                    isFavoriteClicked ? Image(systemName: "heart.fill") : Image(systemName: "heart")
                })
                .foregroundColor(.red)
                
            }
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 4, alignment: .center)
                .foregroundColor(Color(red: 146/255, green: 146/255, blue: 157/255))
            
            Text(selectedMovie?.overview ?? selectedFavoritedMovie?.overview ?? "Error! Sorry")
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
    
}
