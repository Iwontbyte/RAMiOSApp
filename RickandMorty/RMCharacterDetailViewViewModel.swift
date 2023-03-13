//
//  RMCharacterDetailViewViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/13.
//

import Foundation

class RMCharacterDetailViewViewModel {
    
    private let character:RMCharacter
    
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
