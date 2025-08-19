//
//  NetworkManager.swift
//  News
//
//  Created by Burak Özdemir on 18.08.2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func sendRequest<T>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) where T: Codable
}

class NetworkManager {
    private let session: URLSession
    
    init(session: URLSession = .init(configuration: .default)) {
        self.session = session
    }
}

extension NetworkManager: NetworkManagerProtocol {
    func sendRequest<T>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Codable {
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                return completion(.failure(.statusCodeError(httpResponse.statusCode)))
            }
            
            guard let data = data else {
                return completion(.failure(.emptyResponseError))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        .resume()
    }
}
