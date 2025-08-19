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
}

class NewsListViewModel {
    private(set) var newsList: [News] = []
    private let newsService: NewsServiceProtocol
    weak var viewModelDelegate: NewsListViewModelProtocol?
    weak var controllerDelegate: NewsListViewControllerProtocol?
    
    init(newsService: NewsService = .init()) {
        self.newsService = newsService
    }
}

extension NewsListViewModel: NewsListViewModelProtocol {
    func fetchNews() {
        newsService.fetchNews { newsListResult in
            switch newsListResult {
            case .success(let news):
                self.newsList = news.articles
                self.controllerDelegate?.didUpdateData()
            case .failure(let errorType):
                print(errorType.errorMessage)
            }
        }
    }
    
    func searchNews(searchText: String) {
        newsService.searchNews(searchText: searchText) { searchNewsListResult in
            switch searchNewsListResult {
            case .success(let searchNews):
                self.newsList = searchNews.articles
                self.controllerDelegate?.didUpdateData()
            case .failure(let errorType):
                print(errorType.errorMessage)
            }
        }
    }
}
