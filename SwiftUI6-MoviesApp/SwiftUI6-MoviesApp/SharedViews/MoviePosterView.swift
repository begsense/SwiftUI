//
//  MoviePosterView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct MoviePosterView: View {
    let posterPath: String
    
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)") ) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 135, height: 180)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(red: 46/255, green: 33/255, blue: 172/255), lineWidth: 1.5)
                )
                .shadow(color: .black.opacity(0.4), radius: 10, x: 0, y: 5)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                        startPoint: .bottom,
                        endPoint: .center
                    )
                    .cornerRadius(20)
                )
        } placeholder: {
            ProgressView()
                .frame(width: 90, height: 150)
        }
    }
}
