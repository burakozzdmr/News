//
//  NewsDetailViewController.swift
//  News
//
//  Created by Burak Özdemir on 19.08.2025.
//

import UIKit
import SnapKit
import Kingfisher

class NewsDetailViewController: UIViewController {

    // MARK: Properties
    
    private let detailScrollView: UIScrollView = {
        let scrollView: UIScrollView = .init()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private let scrollStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let detailImageView: UIImageView = {
        let imageView: UIImageView = .init()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private let detailDescriptionLabel: UILabel = {
        let label: UILabel = .init()
        label.text = ""
        label.textColor = .label
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    private let viewModel: NewsDetailViewModel
    
    // MARK: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK: Inits
    
    init(viewModel: NewsDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Privates

private extension NewsDetailViewController {
    func configureView() {
        addViews()
        configureLayout()
        setupUIComponents()
        
        view.backgroundColor = .systemBackground
    }
    
    func addViews() {
        view.addSubview(detailScrollView)
        detailScrollView.addSubview(scrollStackView)
        
        scrollStackView.addArrangedSubview(detailImageView)
        scrollStackView.addArrangedSubview(detailDescriptionLabel)
    }
    
    func configureLayout() {
        detailScrollView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(view.layoutMarginsGuide)
        }
        
        scrollStackView.snp.makeConstraints {
            $0.edges.equalTo(detailScrollView)
            $0.width.equalTo(detailScrollView.snp.width)
        }
        
        detailImageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(240)
        }
    }
    
    func setupUIComponents() {
        navigationItem.title = viewModel.news.title
        detailDescriptionLabel.text = viewModel.news.content
        
        guard let urlString = viewModel.news.urlToImage, let imageURL = URL(string: urlString) else { return }
        detailImageView.kf.setImage(with: imageURL)
    }
}
