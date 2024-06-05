//
//  MovieDetailsView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let title: String
    let voteAverage: Double
    let starCount: Int
    let voteCount: Int
    let releaseDate: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            
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
            
            Text(releaseDate)
        }
        .frame(maxWidth: 100, maxHeight: 180, alignment: .leading)
    }
}
