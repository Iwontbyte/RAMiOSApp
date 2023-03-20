//
//  RMImageLoader.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/20.
//

import Foundation

final class RMImageLoader {
    
    static let shared = RMImageLoader()
    
    private init() {}
    
    private var imageDataCahe = NSCache<NSString,NSData>()
    
    func downLoadImage(_ url:URL,completion: @escaping (Result<Data,Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCahe.object(forKey: key) {
            completion(.success(data as Data))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _ ,error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        })
        task.resume()
    }
    
}
