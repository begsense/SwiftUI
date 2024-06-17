//
//  TableView.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import Foundation
import SwiftUI

struct TableView: UIViewRepresentable {
    @Binding var articles: [Article]
    @Binding var selectedArticle: Article?
    @StateObject var viewModel = NewsViewModel()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: TableView
        
        init(parent: TableView) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.articles.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTableViewCell
            let article = parent.articles[indexPath.row]
            cell.configure(with: article, viewModel: parent.viewModel)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            parent.selectedArticle = parent.articles[indexPath.row] // Set selected article
        }
    }
}
