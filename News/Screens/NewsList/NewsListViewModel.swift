//
//  NewsListViewModel.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

protocol NewsListViewModelProtocol: AnyObject {
    func fetchNews()
    func searchNews(searchText: String)
    func loadMore()
}

class NewsListViewModel {
    private let newsService: NewsServiceProtocol
    
    weak var viewModelDelegate: NewsListViewModelProtocol?
    weak var controllerDelegate: NewsListViewControllerProtocol?
    
    private(set) var newsList: [News] = []
    private var page: Int = 1
    private var pageSize: Int = 20
    private var isLoading: Bool = false
    private var query: String = "Bitcoin"
    
    init(newsService: NewsService = .init()) {
        self.newsService = newsService
        
        viewModelDelegate = self
        fetchNews()
    }
}

extension NewsListViewModel: NewsListViewModelProtocol {
    func fetchNews() {
        newsService.fetchNews(query: query, page: 1, pageSize: pageSize) { [weak self] newsResult in
            guard let self = self else { return }
            
            switch newsResult {
            case .success(let newsList):
                DispatchQueue.main.async {
                    self.newsList = newsList.articles
                    self.controllerDelegate?.didUpdateData()
                }
            case .failure(let errorType):
                print(errorType.errorMessage)
            }
        }
    }
    
    func searchNews(searchText: String) {
        newsService.searchNews(searchText: searchText, page: 1, pageSize: pageSize) { [weak self] searchResult in
            guard let self = self else { return }
            
            switch searchResult {
            case .success(let searchNews):
                DispatchQueue.main.async {
                    self.newsList = searchNews.articles
                    self.controllerDelegate?.didUpdateData()
                }
            case .failure(let errorType):
                print(errorType.errorMessage)
            }
        }
    }
    
    func loadMore() {
        guard isLoading == false else { return }
        
        isLoading = true
        
        newsService.fetchNews(query: query, page: page, pageSize: pageSize) { [weak self] newsResult in
            guard let self = self else { return }
            switch newsResult {
            case .success(let news):
                DispatchQueue.main.async {
                    self.newsList.append(contentsOf: news.articles)
                    self.page += 1
                    self.isLoading = false
                    
                    self.controllerDelegate?.didUpdateData()
                }
            case .failure(let errorType):
                print(errorType.errorMessage)
            }
        }
    }
}
