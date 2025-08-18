//
//  NewsListViewController.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import UIKit
import SnapKit

class NewsListViewController: UIViewController {

    // MARK: Properties
    
    private lazy var searchController: UISearchController = {
        let searchController: UISearchController = .init(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search something..."
        return searchController
    }()
    
    private lazy var newsListTableView: UITableView = {
        let tableView: UITableView = .init()
        tableView.rowHeight = 180
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: CellType.newsCell.rawValue)
        return tableView
    }()
    
    private let viewModel: NewsListViewModel
    
    // MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    // MARK: Inits
    
    init(viewModel: NewsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Privates

private extension NewsListViewController {
    func configureView() {
        addViews()
        configureLayout()
        configureNavigationBar()
        
        view.backgroundColor = .systemBackground
    }
    
    func addViews() {
        view.addSubview(newsListTableView)
    }
    
    func configureLayout() {
        newsListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureNavigationBar() {
        navigationItem.searchController = searchController
    }
}

// MARK: - UITableViewDataSource

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.newsCell.rawValue, for: indexPath) as! NewsCell
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UISearchBarDelegate

extension NewsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
