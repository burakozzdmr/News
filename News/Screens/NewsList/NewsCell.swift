//
//  NewsCell.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    static let identifier = CellType.newsCell.rawValue
    
    // MARK: Properties
    
    private let newsImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.image = .init()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let newsTitleLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    private let newsAuthorLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        return stackView
    }()
    
    private let newsSubjectLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 13, weight: .bold)
        return label
    }()
    
    private let separatorView: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .separator
        view.clipsToBounds = true
        return view
    }()
    
    private let publishTimeLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
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
            bottomStackView
        )
        
        bottomStackView.addArrangedSubview(newsSubjectLabel)
        bottomStackView.addArrangedSubview(separatorView)
        bottomStackView.addArrangedSubview(publishTimeLabel)
    }
    
    func configureLayout() {
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        newsImageView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(128)
        }
        
        newsTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(16)
            $0.leading.trailing.equalTo(newsImageView.snp.trailing).offset(16)
        }
        
        newsAuthorLabel.snp.makeConstraints {
            $0.top.equalTo(newsTitleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(newsImageView.snp.trailing).offset(16)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.leading.equalTo(newsImageView.snp.trailing).offset(16)
            $0.bottom.equalTo(contentView)
        }
        
        separatorView.snp.makeConstraints { $0.width.height.equalTo(1) }
    }
}
