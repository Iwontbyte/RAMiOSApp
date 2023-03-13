//
//  RMGetAllEpisodesResponse.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/10.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    
    let info: Info
    let results: [RMEpisode]
    
}
