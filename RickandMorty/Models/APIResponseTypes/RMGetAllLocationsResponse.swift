//
//  RMGetAllLocationsResponse.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/10.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMLocation]
    
    
}
