//
//  CACharityEventDetailViewController.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import UIKit

final class CACharityEventDetailViewController: UIViewController {
    
    private let viewModel: CACharityEventDetailViewViewModel
    
    init(viewModel: CACharityEventDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
