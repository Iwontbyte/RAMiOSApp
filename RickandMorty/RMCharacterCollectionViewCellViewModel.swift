//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import Foundation


class RMCharacterCollectionViewCellViewModel {
    
    
    public  let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterImageurl: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageurl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageurl = characterImageurl
    }
    
    public var  characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data,Error>) -> Void) {
        guard let url = characterImageurl else {
            completion(.failure(URLError(.badURL)))
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
