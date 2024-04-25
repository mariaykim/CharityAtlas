//
//  CACharityDetailViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import UIKit


final class CACharityDetailViewController: UIViewController {
    private let viewModel: CACharityDetailViewViewModel

    init(viewModel: CACharityDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }

}
