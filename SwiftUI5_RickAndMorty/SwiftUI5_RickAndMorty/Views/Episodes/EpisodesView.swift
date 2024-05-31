//
//  EpisodesView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 01.06.2024.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel = MainViewModel()
    private let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            NavigationStack {
                HeaderView()
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5) {
                        ForEach(0..<viewModel.episodes.count, id: \.self) { index in
                            NavigationLink(value: index) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .circular)
                                        .frame(width: 180, height: 70)
                                        .foregroundColor(Color(red: 44/255, green: 70/255, blue: 60/255))
                                    VStack {
                                        Text(viewModel.episodes[index].name)
                                        Text(viewModel.episodes[index].airDate)
                                        Text(viewModel.episodes[index].episode)
                                    }
                                    .font(.custom("AppleSDGothicNeo-Heavy", size: 15))
                                    .foregroundColor(.white)
                                    .frame(width: 180)
                                }
                                .frame(width: 320, height: 70)
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) { index in
                    EpisodesDetailsView(selectedEpisode: viewModel.episodes[index], detailsViewModel: EpisodesDetailsViewModel())
                }
                .background(Color(red: 39/255, green: 43/255, blue: 51/255))
                .padding(.top, -40)
            }
        }
    }
}
