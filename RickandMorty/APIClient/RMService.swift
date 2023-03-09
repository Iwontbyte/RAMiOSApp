//
//  RMService.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

final class RMService {
    
    static let shared = RMService()
    
    private init() {}
    
    public func execute(_ request:RMRequest, completion: @escaping () -> Void) {
        
    }
}
