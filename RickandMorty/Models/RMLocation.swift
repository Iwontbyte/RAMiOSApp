//
//  RMLocation.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}



