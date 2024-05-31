//
//  LocationsDetailsView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct LocationsDetailsView: View {
    @State var selectedLocation: LocationResult
    @StateObject var detailsViewModel: LocationsDetailsViewModel
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
                }
            }
        }
        .onAppear {
            for residentsUrl in selectedLocation.residents {
                detailsViewModel.fetchEpisodes(urlString: residentsUrl)
            }
        }
        .alert(isPresented: $detailsViewModel.showFetchError) {
            Alert(title: Text("რო იცოდე"),
                  message: Text("ვერ მოიქაჩა ინფორმაცია"),
                  dismissButton: .default(Text("კაი ჩემო ძმაო!")))
        }
        .background(Color(red: 39/255, green: 43/255, blue: 51/255))
        .padding(.top, -50)
    }
}


