//
//  CARequest.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import Foundation

final class CARequest {
    // Base url
    // Endpoint
    // Path components
    // Query parameters
    
    private struct Constants {
        static let baseUrl = "https://data.charitynavigator.org"
    }
    
    private let endpoint: CAEndpoint
    private let pathComponents: [String]
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            // name=value&name=value
            let arguementString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\($0.value)"
            }).joined(separator: "&")
            
            string += arguementString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    public init(
        endpoint: CAEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}

extension CARequest {
    static let listCharitiesRequests = CARequest(endpoint: .charity)
//    static let listCharityEventsRequests = CARequest(endpoint: .charityEvents)
}
