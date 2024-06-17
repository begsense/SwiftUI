//
//  SearchView.swift
//  SwiftUI6-MoviesApp
//
//  Created by M1 on 05.06.2024.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var selectedOption: MainViewModel.SearchOption = .title
    
    var body: some View {
        VStack {
            NavigationStack {
                searchBar
                
                switch viewModel.currentViewState {
                case .hello:
                    Spacer()
                    
                    VStack {
                        Text("Use the magic search!")
                            .font(.custom("Montserrat", size: 16))
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("I will do my best to search everything relevant, I promise!")
                            .font(.custom("Montserrat", size: 12))
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: 252)
                    
                    Spacer()
                case .results:
                    ScrollView {
                        ForEach(viewModel.filteredMovies) { movie in
                            NavigationLink(destination: MovieDetailsView(selectedMovie: movie)) {
                                MovieCellView(posterPath: movie.posterPath, title: movie.title, voteAverage: movie.voteAverage, starCount: Int(viewModel.starCount(movieIndex: movie.voteAverage)), voteCount: movie.voteCount, releaseDate: movie.releaseDate, language: movie.originalLanguage.rawValue)
                            }
                        }
                    }
                case .noResults:
                    Spacer()
                    
                    VStack {
                        Text("oh no isn’t this so embarrassing? ")
                            .font(.custom("Montserrat", size: 16))
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("I cannot find any movie with this name.")
                            .font(.custom("Montserrat", size: 12))
                    }
                    .frame(maxWidth: 252)
                    .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
            .foregroundColor(.primary)
            .alert(isPresented: $viewModel.showFetchError) {
                Alert(title: Text("Error"), message: Text("Failed to fetch data"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            TextField("try Godzilla", text: $viewModel.searchText)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .frame(width: 283, height: 43)
                .onChange(of: viewModel.searchText) {
                    viewModel.filterMovies()
                }
                .overlay(alignment: .trailing) {
                    Image("search")
                        .padding(.trailing, 14)
                }
            
            Menu {
                ForEach(MainViewModel.SearchOption.allCases) { option in
                    Button(action: {
                        viewModel.searchOption = option
                        selectedOption = option
                    }) {
                        
                        if selectedOption == option {
                            Image("leading")
                        }
                        Text(option.rawValue)
                        
                    }
                }
            } label: {
                Image("picker")
            }
        }
        .navigationTitle("Search")
    }
    
}

#Preview {
    SearchView()
}
