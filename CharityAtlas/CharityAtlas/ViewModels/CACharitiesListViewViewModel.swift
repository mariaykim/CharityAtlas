//
//  CACharitiesListViewViewModel.swift
//  CharityAtlas
//
//  Created by Maria Kim on 12/6/23.
//

import Apollo
import SchemaAPI
import UIKit

protocol CACharitiesListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharities()
    func didLoadMoreCharities(with newIndexPaths: [IndexPath])
    func didSelectCharity(_ charity: CACharity)
}

final class CACharitiesListViewViewModel: NSObject {
    
    public weak var delegate: CACharitiesListViewViewModelDelegate?
    
    public var shouldShowLoadMoreIndicator: Bool {
//        return apiInfo?.next != nil
        return true
    }
    
    private var isLoadingMoreCharities = false
    
    private var charities: [CACharity?] = [] {
        didSet {
            for charity in charities {
                guard let charityName = charity?.name,
                      let charityCause = charity?.cause
                else { return }
                let viewModel = CACharityCollectionViewCellViewModel(
                    charityName: charityName,
                    charityCause: charityCause
                )
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
            }
        }
    }
    
    private var cellViewModels: [CACharityCollectionViewCellViewModel] = []
    
    private var apiInfo = "" // TODO: refactor
    
    func fetchCharities() {
        CAGraphQL().apolloClient.fetch(query: ExampleQuery(term: "dogs")) { result in
            switch result {
            case .success(let graphQLResult):
                if let jsonResponse = graphQLResult.data?.publicSearchFaceted.results {
                    // Assuming you have a JSON response from your GraphQL query stored in a variable called jsonResponse
                        
                        // Map the JSON array to an array of SearchResult objects
                        let results = jsonResponse.map { CACharity(json: $0) }
                        
                        // Now you have a SearchResponse object containing SearchResult objects
                        print(results)
                    self.charities = results
                    DispatchQueue.main.async {
                        self.delegate?.didLoadInitialCharities()
                    }
                }
            case .failure(let error):
                // Network or response format errors
                print(error)
              }
          }
    }
    
}


// MARK: - CollectionView
extension CACharitiesListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CACharityCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? CACharityCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        
        return CGSize(width: collectionView.frame.width,
                      height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let charity = charities[indexPath.row]
//        delegate?.didSelectCharity(charity)
    }
}

