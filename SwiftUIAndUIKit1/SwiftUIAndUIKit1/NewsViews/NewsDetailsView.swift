//
//  NewsDetailsView.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import SwiftUI

struct NewsDetailsView: View {
    let article: Article
    @StateObject var viewModel: NewsViewModel
    
    var body: some View {
        NewsDetailedPageUIController(article: article, viewModel: viewModel)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Article Details")
    }
}
