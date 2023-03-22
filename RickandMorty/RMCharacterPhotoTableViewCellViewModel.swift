//
//  RMCharacterPhotoTableViewCellViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/22.
//

import Foundation


class RMCharacterPhotoTableViewCellViewModel {
    
    public let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl

    }
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        RMImageLoader.shared.downLoadImage(url, completion: completion)
    }
}
