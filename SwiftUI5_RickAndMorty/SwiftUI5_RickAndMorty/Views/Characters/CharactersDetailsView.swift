//
//  CharactersDetailsView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct CharactersDetailsView: View {
    @State var selectedCharacter: CharacterResult
    @StateObject var detailsViewModel: CharactersDetailsViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(selectedCharacter.name)")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Gender: \(selectedCharacter.gender.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("Status: \(selectedCharacter.status.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("Species: \(selectedCharacter.species.rawValue)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("Origin: \(selectedCharacter.origin.name)")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    
                    Text("Episodes:")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    ScrollView {
                        LazyVStack(alignment: .leading) {
                            ForEach(detailsViewModel.detailEpisodes, id: \.hashValue) { episode in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .circular)
                                        .frame(width: 320, height: 70)
                                        .foregroundColor(Color(red: 44/255, green: 70/255, blue: 60/255))
                                    HStack {
                                        VStack {
                                            Text(episode.name)
                                            Text(episode.episode)
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            Text(episode.airDate)
                                        }
                                    }
                                }
                                .frame(width: 320, height: 70)
                            }
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                .padding()
                .background(Color(red: 39/255, green: 43/255, blue: 51/255))
            }
            .background(Color(red: 39/255, green: 43/255, blue: 51/255))
        }
        .onAppear {
            for episodeUrl in selectedCharacter.episode {
                detailsViewModel.fetchEpisodes(urlString: episodeUrl)
            }
        }
        .alert(isPresented: $detailsViewModel.showFetchError) {
            Alert(title: Text("რო იცოდე"),
                  message: Text("ვერ მოიქაჩა ინფორმაცია"),
                  dismissButton: .default(Text("კაი ჩემო ძმაო!")))
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(red: 39/255, green: 43/255, blue: 51/255))
    }
    
}

