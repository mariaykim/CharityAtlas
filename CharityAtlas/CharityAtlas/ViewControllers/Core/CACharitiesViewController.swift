//
//  CACharitiesViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 10/17/23.
//

import Apollo
import UIKit
import SchemaAPI

class CACharitiesViewController: UIViewController {
    
    let viewModel = CACharitiesListViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        testQuery()
    }
    
    func testQuery() {
        CAGraphQL().apolloClient.fetch(query: ExampleQuery(term: "animals")) { result in
            switch result {
              case .success(let graphQLResult):
                if let name = graphQLResult.data {
                  print(name) // Luke Skywalker
                } else if let errors = graphQLResult.errors {
                  // GraphQL errors
                  print(errors)
                }
              case .failure(let error):
                // Network or response format errors
                print(error)
              }
          }
    }

}
