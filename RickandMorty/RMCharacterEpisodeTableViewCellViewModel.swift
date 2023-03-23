//
//  RMCharacterEpisodeTableViewCellViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/22.
//

import Foundation

class RMCharacterEpisodeTableViewCellViewModel {
    
    
    private let character:RMCharacter
    
    public var episode: [String] {
        return character.episode
    }
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    
    
    
}
