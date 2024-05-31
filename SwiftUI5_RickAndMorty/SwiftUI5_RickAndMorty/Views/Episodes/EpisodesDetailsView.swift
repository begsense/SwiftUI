//
//  EpisodesDetailsView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 01.06.2024.
//

import SwiftUI

struct EpisodesDetailsView: View {
    @State var selectedEpisode: EpisodeResult
    @StateObject var detailsViewModel: EpisodesDetailsViewModel
    private let columns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        HeaderView()
        
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 25) {
                ForEach(0..<detailsViewModel.detailCharacters.count, id: \.self) { index in
                    ZStack {
                        VStack {
                            AsyncImage(url: URL(string: detailsViewModel.detailCharacters[index].image)) { image in
                                image.resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .cornerRadius(15)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Spacer(minLength: 20)
                            
                            VStack {
                                Text(detailsViewModel.detailCharacters[index].name)
                                Text(detailsViewModel.detailCharacters[index].species)
                                Text(detailsViewModel.detailCharacters[index].status)
                            }
                            .font(.custom("AppleSDGothicNeo-Heavy", size: 15))
                            .foregroundColor(.white)
                            .frame(width: 100, height: 30)
                        }
                    }
                    .buttonStyle(PlainButtonStyle()) // Ensures the NavigationLink behaves correctly inside a LazyVGrid
                }
            }
        }
        .onAppear {
            for characterUrl in selectedEpisode.characters {
                detailsViewModel.fetchCharacter(urlString: characterUrl)
            }
        }
        .alert(isPresented: $detailsViewModel.showFetchError) {
            Alert(title: Text("Error"),
                  message: Text("Failed to fetch data"),
                  dismissButton: .default(Text("OK")))
        }
        .background(Color(red: 39/255, green: 43/255, blue: 51/255))
        .padding(.top, -50)
    }
}
