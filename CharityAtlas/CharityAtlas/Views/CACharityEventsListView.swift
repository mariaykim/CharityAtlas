//
//  CACharityEventsListView.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import UIKit

protocol CACharityEventsListViewDelegate {
    func caCharityEventsListViewView(_ charityEventsListView: CACharityEventsListView, didSelectCharityEvent event: CACharityEvent)
}

final class CACharityEventsListView: UIView {
    
    // MARK: - Init

    init(frame: CGRect, viewModel: CACharityEventsListViewViewModel) {
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
