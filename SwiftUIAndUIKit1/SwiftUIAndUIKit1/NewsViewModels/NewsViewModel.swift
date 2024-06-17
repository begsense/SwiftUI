//
//  NewsViewModel.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import Foundation
import NetworkServicePackage

class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var showFetchError: Bool = false
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2024-05-17&sortBy=publishedAt&apiKey=bc13a0bdf0324e7bb1495193aa4bea27"
        //Data თუ ვერ წამოვიდა თარიღია შესაცვლელი დღის შესაბამისად. ყოველდღიური აპია
        NetworkService().getData(urlString: urlString) { (result: Result<News, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let news):
                    self.articles = news.articles
                case .failure:
                    self.showFetchError = true
                }
            }
        }
    }
    
    func loadImage(from urlString: String?, completion: @escaping (Data?) -> Void) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
}
