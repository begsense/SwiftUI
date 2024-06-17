//
//  News.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import Foundation

struct News: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let content: String?

    private enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, content
    }
}

struct Source: Decodable {
    let id: String?
    let name: String
}
