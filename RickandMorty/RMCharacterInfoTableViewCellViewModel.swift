//
//  RMCharacterInfoTableViewCellViewModel.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/22.
//

import UIKit

class RMCharacterInfoTableViewCellViewModel {
    
    private let character:RMCharacter
    
    struct CellInfo {
        let title: String
        let value: String
        let color: UIColor
    }
    
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    
    var formatDate: String {
        let toDateFormatter = DateFormatter()
        let toStringDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        toStringDateFormatter.dateFormat = "yyyy-MM-dd"
        let date = toDateFormatter.date(from: character.created)
        guard let date = date else {
            return " "
        }
        let formatDay = toStringDateFormatter.string(from: date)
        return formatDay
    }
    
    
    public var cellInfo:[CellInfo] {
        return [CellInfo(title: "Name:", value: character.name,color: .systemBlue),
                CellInfo(title: "Status:", value: character.status.rawValue,color: .systemPurple),
                CellInfo(title: "Species:", value: character.species,color: .systemOrange),
                CellInfo(title: "Type:", value: character.type,color: .systemPink),
                CellInfo(title: "Gender:", value: character.gender.rawValue,color: .systemRed),
                CellInfo(title: "Origin:", value: character.origin.name,color: .systemMint),
                CellInfo(title: "Air on:", value: formatDate,color: .systemYellow)
        ]
    }
    
    
    
}
