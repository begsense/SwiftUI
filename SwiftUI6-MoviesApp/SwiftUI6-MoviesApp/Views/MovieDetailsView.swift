//
//  MovieDetailsView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 07.06.2024.
//

import SwiftUI

struct MovieDetailsView: View {
    @State var selectedMovie: MoviesResults
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(selectedMovie.backdropPath)") ) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 210)
                    .cornerRadius(1)
                    .overlay(alignment: .bottomTrailing) {
                        HStack {
                            Image("star")
                            Text(String(format: "%.1f", selectedMovie.voteAverage))
                                .foregroundColor(Color(red: 255/255, green: 135/255, blue: 0/255))
                                .padding(.trailing, 14)
                        }
                    }
            } placeholder: {
                ProgressView()
            }
            
            Text(selectedMovie.originalTitle)
                .frame(width: 210, height: 48, alignment: .center)
                .padding(.leading, 70)
                .overlay(alignment: .leading) {
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(selectedMovie.posterPath)") ) { image in
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
            
            HStack {
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(selectedMovie.releaseDate.prefix(4))
                    .font(.custom("Poppins", size: 14))
                
                Text("|")
                
                Image("language")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                Text(selectedMovie.originalLanguage.rawValue)
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
            
            Spacer()
                .frame(height: 25)
            
            VStack {
                HStack {
                    Text("About Movie")
                        .font(.custom("Poppins", size: 24))
                    Spacer()
                }
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 4, alignment: .center)
                    .foregroundColor(Color(red: 146/255, green: 146/255, blue: 157/255))
                
                Text(selectedMovie.overview)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        }
        .multilineTextAlignment(.leading)
        .foregroundColor(.primary)
        .navigationBarTitle(Text("\(selectedMovie.title)"), displayMode: .inline)
    }
}
