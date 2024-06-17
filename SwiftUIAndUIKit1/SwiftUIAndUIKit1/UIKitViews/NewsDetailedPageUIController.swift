//
//  NewsDetailedPageUIController.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 17.06.2024.
//

import SwiftUI

struct NewsDetailedPageUIController: UIViewControllerRepresentable {
    var article: Article
    @ObservedObject var viewModel: NewsViewModel
    
    func makeUIViewController(context: Context) -> NewsDetailedPage {
        let viewController = NewsDetailedPage()
        viewController.article = article
        viewController.viewModel = viewModel
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: NewsDetailedPage, context: Context) {
        // update როცა არ მჭირდება ესე დატოვება მოსულა?
    }
}
