//
//  SearchView.swift
//  SwiftUI5_RickAndMorty
//
//  Created by M1 on 01.06.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                
                Picker("Search", selection: $searchViewModel.selectedSegment) {
                    ForEach(SearchViewModel.Segment.allCases) { segment in
                        Text(segment.rawValue).tag(segment)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TextField("Search...", text: $searchViewModel.searchText)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250)
                
                ScrollView {
                    LazyVStack {
                        if searchViewModel.selectedSegment == .character {
                            ForEach(searchViewModel.filteredCharacters, id: \.id) { character in
                                Text(character.name)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        } else if searchViewModel.selectedSegment == .episode {
                            ForEach(searchViewModel.filteredEpisodes, id: \.id) { episode in
                                Text(episode.name)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                        else {
                            ForEach(searchViewModel.filteredLocations, id: \.id) { location in
                                Text(location.name)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.top, -40)
            .background(Color(red: 39/255, green: 43/255, blue: 51/255))
        }
    }
}
