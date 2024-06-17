//
//  ArticleTableViewCell.swift
//  SwiftUIAndUIKit1
//
//  Created by M1 on 16.06.2024.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    // MARK: - Properties
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 8
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    private func setupUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(articleImageView)
        stackView.addArrangedSubview(titleLabel)
        
        backgroundColor = UIColor(red: 18/255, green: 35/255, blue: 43/255, alpha: 1)
        contentView.backgroundColor = UIColor(red: 41/255, green: 70/255, blue: 93/255, alpha: 0.5)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(red: 125/255, green: 187/255, blue: 205/255, alpha: 0.2).cgColor
        contentView.layer.masksToBounds = true
        titleLabel.textColor = UIColor(white: 0.8, alpha: 0.8)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        stackView.isAccessibilityElement = true
        articleImageView.accessibilityLabel = "Article Image"
        titleLabel.accessibilityLabel = "Article Header"
    }
    
    func configure(with article: Article, viewModel: NewsViewModel) {
        titleLabel.text = article.title
        viewModel.loadImage(from: article.urlToImage) { [weak self] imageData in
            DispatchQueue.main.async {
                self?.articleImageView.image = imageData.flatMap { UIImage(data: $0) } ?? UIImage(named: "noimage")
                self?.articleImageView.isAccessibilityElement = true
                self?.articleImageView.accessibilityLabel = "Article image"
                self?.articleImageView.accessibilityValue = article.title
            }
        }
    }
}
