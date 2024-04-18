//
//  CACharityEventsViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 10/17/23.
//

import UIKit

class CACharityEventsViewController: UIViewController, CACharityEventsListViewDelegate {
    
    private let charityEventsListView = CACharityEventsListView( frame: .init(), viewModel: CACharityEventsListViewViewModel())

    // MARK: - Init
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Charity Events"
        setUpView()
    }
    
    private func setUpView() {
        charityEventsListView.delegate = self
        view.addSubview(charityEventsListView)
        NSLayoutConstraint.activate([
            charityEventsListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charityEventsListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charityEventsListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charityEventsListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - CACharityEventsListViewDelegate

    func caCharityEventsListViewView(_ charityEventsListView: CACharityEventsListView, didSelectCharityEvent event: CACharityEvent) {
        // Open detail controller for that charity event
        let viewModel = CACharityEventDetailViewViewModel(event: event)
        let detailVC = CACharityEventDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
