//
//  CharitiesView.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/20/23.
//

import UIKit

protocol CACharitiesListViewDelegate: AnyObject {
    func caCharitiesListView(
        _ charitiesListView: CACharitiesListView,
        didSelectCharity charity: CACharity
    )
}

final class CACharitiesListView: UIView {
    
    public weak var delegate: CACharitiesListViewDelegate?
    
    private let viewModel = CACharitiesListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        // Create UICollectionView, give it a custom UICollectionViewFlowLayout, and register the cells
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CACharityCollectionViewCell.self,
                                forCellWithReuseIdentifier: CACharityCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharities()
        setUpCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

extension CACharitiesListView: CACharitiesListViewViewModelDelegate {
    func didSelectCharity(_ charity: CACharity) {
        delegate?.caCharitiesListView(self, didSelectCharity: charity)
    }

    func didLoadInitialCharities() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData() // Initial fetch
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
    
    func didLoadMoreCharities(with newIndexPaths: [IndexPath]) {
        collectionView.performBatchUpdates { // tell the collection view to add more cells
            self.collectionView.insertItems(at: newIndexPaths)
        }
    }
}
