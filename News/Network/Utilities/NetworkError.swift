//
//  NetworkError.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case urlSessionFailed
    case requestFailedError
    case statusCodeError(Int)
    case emptyResponseError
    case decodingFailed
    case generalError(Error)
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "invalid URL"
        case .urlSessionFailed:
            return "url session failed"
            case .requestFailedError:
            return "request failed"
        case .statusCodeError(let code):
            return "status code error: \(code)"
        case .emptyResponseError:
            return "empty response"
        case .decodingFailed:
            return "decoding failed"
        case .generalError(let error):
            return error.localizedDescription
        }
    }
}
