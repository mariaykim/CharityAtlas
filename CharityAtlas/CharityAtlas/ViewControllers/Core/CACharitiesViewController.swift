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
    var data = [ExampleQuery.Data.PublicSearchFaceted.Result]()
    private let charitiesListView = CACharitiesListView()

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
                    self.data = name.publicSearchFaceted.results
                    print("this is the name: \(name.publicSearchFaceted.results[0].mission ?? "-11")") // Luke Skywalker
                } else if let errors = graphQLResult.errors {
                  // GraphQL errors
                  print("this is the error: \(errors)")
                }
              case .failure(let error):
                // Network or response format errors
                print(error)
              }
          }
    }
    
    private func setupViews() {
        view.addSubview(charitiesListView)
        NSLayoutConstraint.activate([
            charitiesListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charitiesListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            charitiesListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charitiesListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
