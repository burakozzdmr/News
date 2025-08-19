//
//  NetworkConstants.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

struct NetworkConstants {
    static let authorizationHeaderKey = "Authorization"
    static let authorizationHeaderValuePrefix = "Bearer "
    static let contentTypeHeaderKey = "Content-Type"
    static let contentTypeHeaderValue = "application/json"
    
    struct NewsConstants {
        static let baseURL = "https://newsapi.org/v2/"
        static let everythingPath = "everything"
        static let topHeadlinesPath = "top-headlines"
        static let apiKey = "d517db38ce974c6ab9deb72d063bf35c"
    }
}
