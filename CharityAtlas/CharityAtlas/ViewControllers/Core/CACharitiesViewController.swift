//
//  CACharitiesViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 10/17/23.
//

import Apollo
import UIKit
import SchemaAPI

final class CACharitiesViewController: UIViewController, CACharitiesListViewDelegate {
    
    let viewModel = CACharitiesListViewViewModel()

    private let charitiesListView = CACharitiesListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
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
    
    // MARK: - CACharitiesListViewDelegate

    func caCharitiesListView(_ charitiesListView: CACharitiesListView, didSelectCharity charity: CACharity) {
        // Open detail controller for that character
        let viewModel = CACharityDetailViewViewModel(charity: charity)
        let detailVC = CACharityDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
