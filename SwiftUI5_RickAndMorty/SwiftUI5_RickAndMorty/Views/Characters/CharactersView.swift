//
//  CharactersView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel = MainViewModel()
    private let columns = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            NavigationStack {
                HeaderView()
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5) {
                        ForEach(0..<viewModel.characters.count, id: \.self) { index in
                            NavigationLink(value: index) {
                                VStack {
                                    AsyncImage(url: URL(string: viewModel.characters[index].image)) { image in
                                        image.resizable()
                                            .frame(width: 100, height: 100)
                                            .scaledToFit()
                                            .cornerRadius(15)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Text(viewModel.characters[index].name)
                                        .font(.custom("AppleSDGothicNeo-Heavy", size: 11))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 30)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: Int.self) { index in
                    CharactersDetailsView(selectedCharacter: viewModel.characters[index], detailsViewModel: CharactersDetailsViewModel())
                }
                .background(Color(red: 39/255, green: 43/255, blue: 51/255))
                .padding(.top, -40)
            }
        }
    }
}

#Preview {
    CharactersView()
}
