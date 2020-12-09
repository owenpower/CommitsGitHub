//
//  ServiceManager.swift
//  GitHubCommits
//
//  Created by OSWALDO GARCIA FABIAN on 12/8/20.
//

import Foundation

class GMServiceManager {
    
    public static let shared = GMServiceManager()
    
    private init() {}
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    enum ServiceError: Error {
        case apiError
        case invalidEndPoint
        case decodeError
        case invalidResponse
    }
    
    func request<T: Decodable>(_ urlString: String, completion: @escaping (Result<T, ServiceError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let dataParser = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(dataParser))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure( _):
                completion(.failure(.apiError))
            }
        }.resume()
    }
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
