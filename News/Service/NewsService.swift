//
//  NewsService.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

protocol NewsServiceProtocol {
    func fetchNews(query: String, page: Int, pageSize: Int, completion: @escaping (Result<NewsModel, NetworkError>) -> Void)
    func searchNews(searchText: String, page: Int, pageSize: Int, completion: @escaping (Result<NewsModel, NetworkError>) -> Void)
}

class NewsService {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManager = .init()) {
        self.networkManager = networkManager
    }
}

extension NewsService: NewsServiceProtocol {
    func fetchNews(query: String, page: Int, pageSize: Int, completion: @escaping (Result<NewsModel, NetworkError>) -> Void) {
        let request = EndpointRouter.makeURLRequest(for: .everything(searchText: "Bitcoin", page: page, pageSize: pageSize), with: .GET)
        
        switch request {
        case .success(let successRequest):
            print(successRequest.url?.absoluteString ?? "")
            networkManager.sendRequest(
                request: successRequest,
                completion: completion
            )
        case .failure(let errorType):
            completion(.failure(errorType))
        }
    }
    
    func searchNews(searchText: String, page: Int, pageSize: Int, completion: @escaping (Result<NewsModel, NetworkError>) -> Void) {
        let request = EndpointRouter.makeURLRequest(for: .everything(searchText: searchText, page: page, pageSize: pageSize), with: .GET)
        
        switch request {
        case .success(let successRequest):
            networkManager.sendRequest(
                request: successRequest,
                completion: completion
            )
            
        case .failure(let errorType):
            completion(.failure(errorType))
        }
    }
}
