//
//  EndpointRouter.swift
//  News
//
//  Created by Burak Özdemir on 19.08.2025.
//

import Foundation

enum EndpointType {
    case everything(searchText: String, page: Int, pageSize: Int)
    case topHeadlines(searchText: String, page: Int, pageSize: Int)
}

protocol EndpointRouterProtocol {
    static func makeURLRequest(for endpoint: EndpointType, with httpMethod: HTTPMethod) -> Result<URLRequest, NetworkError>
}

class EndpointRouter { }

extension EndpointRouter: EndpointRouterProtocol {
    static func makeURLRequest(for endpoint: EndpointType, with httpMethod: HTTPMethod) -> Result<URLRequest, NetworkError> {
        switch endpoint {
        case .everything(let searchText, let page, let pageSize):
            guard var urlComponents = URLComponents(
                string: NetworkConstants.NewsConstants.baseURL
                + NetworkConstants.NewsConstants.everythingPath) else { return .failure(.invalidURL) }
            
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: searchText),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "pageSize", value: "\(pageSize)"),
                URLQueryItem(name: "apiKey", value: NetworkConstants.NewsConstants.apiKey)
            ]
            
            guard let requestURL = urlComponents.url else { return .failure(.requestFailedError) }
            
            var request: URLRequest = .init(url: requestURL)
            request.httpMethod = httpMethod.rawValue
            return .success(request)
            
        case .topHeadlines(let searchText, let page, let pageSize):
            guard var urlComponents = URLComponents(
                string: NetworkConstants.NewsConstants.baseURL
                + NetworkConstants.NewsConstants.topHeadlinesPath) else { return .failure(.invalidURL) }
            
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: searchText),
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "pageSize", value: "\(pageSize)"),
                URLQueryItem(name: "apiKey", value: NetworkConstants.NewsConstants.apiKey)
            ]
            
            guard let requestURL = urlComponents.url else { return .failure(.requestFailedError) }
            
            var request: URLRequest = .init(url: requestURL)
            request.httpMethod = httpMethod.rawValue
            return .success(request)
        }
    }
}
