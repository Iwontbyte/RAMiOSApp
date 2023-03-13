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
    

}
