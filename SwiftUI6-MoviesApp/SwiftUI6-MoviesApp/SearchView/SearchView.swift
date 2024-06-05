//
//  SearchView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    @StateObject var moviesViewModel = MoviesViewModel()
    
    var body: some View {
        VStack {
            HeaderView()
            
            HStack {
                Spacer()
                    .frame(width: 50)
                
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(Color(red: 210/255, green: 174/255, blue: 232/255))
                
                SearchBar(text: $searchViewModel.searchText)
                
                Spacer()
                    .frame(width: 50)
            }
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(searchViewModel.filteredMovies, id: \.id) { movie in
                        HStack {
                            MoviePosterView(posterPath: movie.posterPath)
                            
                            Spacer()
                                .frame(width: 30)
                            
                            MovieDetailsView(
                                title: movie.title,
                                voteAverage: movie.voteAverage,
                                starCount: Int(moviesViewModel.starColor(movieIndex: movie.voteAverage)),
                                voteCount: movie.voteCount,
                                releaseDate: movie.releaseDate
                            )
                            .frame(maxWidth: 100, maxHeight: 180, alignment: .leading)
                            
                            Spacer()
                                .frame(width: 30)
                        }
                    }
                }
            }
        }
        .background(LinearGradient(colors: [Color(red: 46/255, green: 33/255, blue: 172/255, opacity: 0.8), Color(red: 195/255, green: 69/255, blue: 157/255, opacity: 0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search Movies", text: $text)
                .padding(10)
                .background(Color(red: 210/255, green: 174/255, blue: 232/255))
                .cornerRadius(10)
        }
        .padding(10)
    }
}

#Preview {
    SearchView()
}
