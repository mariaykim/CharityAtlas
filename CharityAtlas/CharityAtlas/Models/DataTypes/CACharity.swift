//
//  CACharity.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import SchemaAPI
import Foundation

struct CACharity: Codable {
    let name: String
    let cause: String
}

// Define the Swift struct representing the response from publicSearchFaceted
struct SearchResponse {
    let results: [CACharity]
}

extension CACharity {
    init?(json: ExampleQuery.Data.PublicSearchFaceted.Result) {
        guard
            let name = json.name,
            let cause = json.cause
        else {
            return nil
        }
        self.name = name
        self.cause = cause
    }
}
