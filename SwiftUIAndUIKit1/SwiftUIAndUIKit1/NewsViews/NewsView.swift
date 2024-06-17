//
//  NewsView.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import SwiftUI

struct NewsView: View {
    @StateObject var viewModel = NewsViewModel()
    @State private var selectedArticle: Article? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.articles.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    TableView(articles: $viewModel.articles, selectedArticle: $selectedArticle)
                }
            }
            .background(LinearGradient(colors: [Color(red: 18/255, green: 35/255, blue: 43/255), Color(red: 31/255, green: 52/255, blue: 65/255), Color(red: 41/255, green: 78/255, blue: 92/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .navigationBarTitle("News")
            .alert(isPresented: $viewModel.showFetchError) {
                Alert(title: Text("Error"), message: Text("Failed to fetch data"), dismissButton: .default(Text("OK")))
            }
            .navigationDestination(isPresented: Binding(
                get: { selectedArticle != nil },
                set: { newValue in
                    if !newValue {
                        selectedArticle = nil
                    }
                }
            )) {
                if let article = selectedArticle {
                    NewsDetailsView(article: article, viewModel: viewModel)
                } else {
                    EmptyView()
                }
            }
        }
    }
}


#Preview {
    NewsView(viewModel: NewsViewModel())
}
