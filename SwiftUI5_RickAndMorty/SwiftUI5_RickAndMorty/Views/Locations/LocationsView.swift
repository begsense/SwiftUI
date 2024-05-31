//
//  LocationsView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 31.05.2024.
//

import SwiftUI

struct LocationsView: View {
    @StateObject var viewModel = MainViewModel()
    private let columns = [GridItem(), GridItem()]
    
    var body: some View {
        VStack {
            NavigationStack {
                HeaderView()
                
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5) {
                        ForEach(0..<viewModel.locations.count, id: \.self) { index in
                            NavigationLink(value: index) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .circular)
                                        .frame(width: 180, height: 70)
                                        .foregroundColor(Color(red: 44/255, green: 70/255, blue: 60/255))
                                    
                                    VStack {
                                        Text(viewModel.locations[index].name)
                                        Text(viewModel.locations[index].type)
                                        Text(viewModel.locations[index].dimension)
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
                    LocationsDetailsView(selectedLocation: viewModel.locations[index], detailsViewModel: LocationsDetailsViewModel())
                }
                .background(Color(red: 39/255, green: 43/255, blue: 51/255))
                .padding(.top, -40)
            }
        }
    }
}

#Preview {
    LocationsView()
}
