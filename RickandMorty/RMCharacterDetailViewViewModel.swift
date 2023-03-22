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
    
    public var name: String {
        character.name
    }
    
    public var species: String {
        character.species
    }
    
    public var type: String {
        character.type
    }
    
    public var status: String {
        "status: \(character.status)"
    }
    
    public var gender: String {
        character.gender.rawValue
    }
    
    public var image: String {
        character.image
    }
    
}
