//
//  RMService.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

final class RMService {
    
    enum RMServiceError: Error {
    case failToCreatRequest
    case failToGetData
    }
    
    static let shared = RMService()
    
    private init() {}
    
    public func execute<T: Codable>(_ request:RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let urlRequest = self.requeset(from: request) else {
            completion(.failure(RMServiceError.failToCreatRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _ ,error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        })
        
        task.resume()
    }
    
    private func requeset(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
