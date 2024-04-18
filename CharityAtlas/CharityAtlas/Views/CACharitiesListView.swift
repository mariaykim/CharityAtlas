//
//  CharitiesView.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/20/23.
//

import UIKit

protocol CACharitiesListViewDelegate: AnyObject {
    func CACharitiesListView(
        _ charitiesListView: CACharitiesListView,
        didSelectCharity charity: CACharity
    )
}

final class CACharitiesListView: UIView {
    
    // MARK: - Init

    init(frame: CGRect, viewModel: CACharitiesListViewViewModel) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
//        addSubviews(collectionView, spinner)
//        addConstraints()
//        spinner.startAnimating()
        viewModel.delegate = self
//        viewModel.fetchCharacters()
//        setUpCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
