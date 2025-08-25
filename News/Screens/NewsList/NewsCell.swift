//
//  NewsCell.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import UIKit
import SnapKit
import Kingfisher

class NewsCell: UITableViewCell {
    static let identifier = CellType.newsCell.rawValue
    
    // MARK: Properties
    
    private let newsImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init(systemName: "photo.artframe")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    private let newsTitleLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let newsAuthorLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private let newsSubjectLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let separatorView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .secondaryLabel
        view.clipsToBounds = true
        view.layer.cornerRadius = 2
        return view
    }()
    
    private let publishTimeLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Publics

extension NewsCell {
    func configure(for news: News) {
        newsTitleLabel.text = news.title
        newsAuthorLabel.text = news.author
        newsSubjectLabel.text = "Apple"
        publishTimeLabel.text = "23m ago"
        
        guard let urlString = news.urlToImage, let imageURL = URL(string: urlString) else { return }
        newsImageView.kf.setImage(with: imageURL)
    }
}

// MARK: - Privates

private extension NewsCell {
    func configureView() {
        addViews()
        configureLayout()
    }
    
    func addViews() {
        contentView.addSubviews(
            newsImageView,
            newsTitleLabel,
            newsAuthorLabel,
            newsSubjectLabel,
            separatorView,
            publishTimeLabel,
            moreButton
        )
    }
    
    func configureLayout() {
        newsImageView.snp.makeConstraints {
            $0.leading.equalTo(contentView.layoutMarginsGuide)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(128)
        }
        
        newsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(16)
            $0.leading.equalTo(newsImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(contentView.layoutMarginsGuide)
        }
        
        newsAuthorLabel.snp.makeConstraints {
            $0.top.equalTo(newsTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(newsImageView.snp.trailing).offset(16)
            $0.trailing.equalTo(contentView.layoutMarginsGuide)
        }
        
        newsSubjectLabel.snp.makeConstraints {
            $0.top.equalTo(newsAuthorLabel.snp.bottom).offset(48)
            $0.leading.equalTo(newsImageView.snp.trailing).offset(8)
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(newsAuthorLabel.snp.bottom).offset(48)
            $0.leading.equalTo(newsSubjectLabel.snp.trailing).offset(8)
            $0.width.height.equalTo(2)
        }
        
        publishTimeLabel.snp.makeConstraints {
            $0.top.equalTo(newsAuthorLabel.snp.bottom).offset(48)
            $0.leading.equalTo(separatorView.snp.trailing).offset(8)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(newsAuthorLabel.snp.bottom).offset(48)
            $0.trailing.equalTo(contentView.layoutMarginsGuide)
            $0.width.height.equalTo(32)
        }
    }
}
