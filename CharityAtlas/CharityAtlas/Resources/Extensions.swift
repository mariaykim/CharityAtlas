//
//  Extensions.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


