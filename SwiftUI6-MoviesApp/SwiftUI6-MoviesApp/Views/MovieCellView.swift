//
//  MovieCellView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct MovieCellView: View {
    //MARK: Properties
    let posterPath: String
    let title: String
    let voteAverage: Double
    let starCount: Int
    let voteCount: Int
    let releaseDate: String
    let language: String
    
    //MARK: View
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)") ) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 95, height: 130)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.primary)
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: 90, height: 150)
            }
            
            Spacer()
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.custom("Poppins", size: 16))
                
                HStack {
                    ForEach(0..<starCount, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color.yellow)
                    }
                }
                
                HStack {
                    Text(String(format: "%.1f", voteAverage))
                    
                    Text("(\(voteCount))")
                }
                .font(.custom("Poppins", size: 14))
                
                HStack {
                    Image("language")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    Text(language)
                        .font(.custom("Poppins", size: 14))
                }
                
                HStack {
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text(releaseDate.prefix(4))
                        .font(.custom("Poppins", size: 14))
                }
            }
            .frame(maxWidth: 200, maxHeight: 130, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundColor(.primary)
    }
}
