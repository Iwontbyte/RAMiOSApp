//
//  RMGetAllCharactersResponse.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/10.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    
    let info: Info
    let results: [RMCharacter]
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
}
