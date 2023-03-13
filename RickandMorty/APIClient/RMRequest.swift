//
//  RMRequest.swift
//  RickandMorty
//
//  Created by guoxun on 2023/3/9.
//

import Foundation

final class RMRequest {
    
    
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endPoint: RMEndpoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let arguementString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += arguementString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    
    public init(endPoint: RMEndpoint,
                 pathComponents: [String] = [],
                 queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}


extension RMRequest {
    
    static let listCharactersRequests = RMRequest(endPoint: .character)
    
    static let listLocationsRequests = RMRequest(endPoint: .location)
    
    static let listEpisodeRequests = RMRequest(endPoint: .episode)
}
