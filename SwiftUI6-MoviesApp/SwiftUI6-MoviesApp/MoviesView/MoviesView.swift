//
//  MoviesView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var mainViewModel = MainViewModel()
    @StateObject var moviesViewModel = MoviesViewModel()
    
    var body: some View {
        VStack {
            HeaderView()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(mainViewModel.movies, id: \.id) { movie in
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
                    .frame(maxWidth: .infinity)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(red: 210/255, green: 174/255, blue: 232/255, opacity: 0.1), Color(red: 100/255, green: 20/255, blue: 200/255, opacity: 0.1)]),
                            startPoint: .center,
                            endPoint: .trailing
                        )
                        .cornerRadius(20)
                    )
                }
            }
        }
        .background(LinearGradient(colors: [Color(red: 46/255, green: 33/255, blue: 172/255, opacity: 0.8), Color(red: 195/255, green: 69/255, blue: 157/255, opacity: 0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    MoviesView()
}
