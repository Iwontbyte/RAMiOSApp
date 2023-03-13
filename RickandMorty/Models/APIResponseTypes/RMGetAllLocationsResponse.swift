//
//  RMGetAllLocationsResponse.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/10.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    
    let info: Info
    let results: [RMLocation]
    
    
}
