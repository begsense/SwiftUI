//
//  NewsDetailedPage.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import UIKit

class NewsDetailedPage: UIViewController {
    //MARK: - Properties
    var article: Article?
    var viewModel: NewsViewModel?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let articleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        loadData()
    }
    
    //MARK: - Functions
    private func setupViews() {
        view.backgroundColor = UIColor(red: 18/255, green: 35/255, blue: 43/255, alpha: 0.8)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(articleDescriptionLabel)
        
        view.isAccessibilityElement = true
        posterImageView.accessibilityLabel = "Article Image"
        titleLabel.accessibilityLabel = "Article Header"
        authorLabel.accessibilityLabel = "Article Header"
        articleDescriptionLabel.accessibilityLabel = "Article Description"
        
        titleLabel.textColor = UIColor(white: 0.8, alpha: 0.8)
        authorLabel.textColor = UIColor(white: 0.8, alpha: 0.8)
        articleDescriptionLabel.textColor = UIColor(white: 0.8, alpha: 0.8)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 36),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            articleDescriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            articleDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            articleDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            articleDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func loadData() {
        guard let article = article else { return }
        titleLabel.text = article.title
        authorLabel.text = "Author: \(article.author ?? "Unknown")"
        articleDescriptionLabel.text = article.description
        
        viewModel?.loadImage(from: article.urlToImage) { [weak self] data in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self?.posterImageView.image = image
                }
                self?.posterImageView.isAccessibilityElement = true
                self?.posterImageView.accessibilityLabel = "Article image"
                self?.posterImageView.accessibilityValue = article.title
            }
        }
    }
}
