//
//  RMEpisode.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    
}
