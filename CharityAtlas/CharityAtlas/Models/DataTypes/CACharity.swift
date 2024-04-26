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
    let charity_navigator_url: String
    let mission: String
    let organization_url: String
    let encompass_score: String
    let encompass_star_rating: String
}

// Define the Swift struct representing the response from publicSearchFaceted
struct SearchResponse {
    let results: [CACharity]
}

extension CACharity {
    init?(json: ExampleQuery.Data.PublicSearchFaceted.Result) {
        guard
            let name = json.name,
            let cause = json.cause,
            let charity_navigator_url = json.charity_navigator_url,
            let mission = json.mission,
            let organization_url = json.organization_url,
            let encompass_score = json.encompass_score,
            let encompass_star_rating = json.encompass_star_rating
        else {
            return nil
        }
        self.name = name
        self.cause = cause
        self.charity_navigator_url = charity_navigator_url
        self.mission = mission
        self.organization_url = organization_url
        self.encompass_score = encompass_score
        self.encompass_star_rating = encompass_star_rating
    }
}
