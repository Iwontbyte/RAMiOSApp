//
//  RMCharacterStatus.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    
    var text: String {
        switch self {
        case .alive, .dead:
            return self.rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
