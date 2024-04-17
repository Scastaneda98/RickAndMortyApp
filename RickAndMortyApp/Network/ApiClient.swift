//
//  ApiClient.swift
//  RickAndMortyApp
//
//  Created by Santiago Castaneda on 16/04/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case networkError(Error)
    case invalidData
    case decodingError(Error)
}

class ApiClient {
    static let shared = ApiClient()
    
    private let baseURL = "https://rickandmortyapi.com/api/"
    
    func fetchData<T: Decodable>(endpoint: String, method: HTTPMethod, parameters: [String: String] = [:], completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if !parameters.isEmpty {
            urlComponents?.queryItems = requestParameters(parameters: parameters)
        }
        
        guard let finalURL = urlComponents?.url else {
            completion(.failure(.invalidURL))
            return
        }
                
        var request = URLRequest(url: finalURL)
        request.httpMethod = method.rawValue
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard response is HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }
    
    private func requestParameters(parameters: [String: String]) -> [URLQueryItem] {
        var queryParameters: [URLQueryItem] = []
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: value)
            queryParameters.append(queryItem)
        }
        return queryParameters
    }
}
