//
//  CACharityCollectionViewCellViewModel.swift
//  CharityAtlas
//
//  Created by Maria Kim on 4/24/24.
//

import Foundation

final class CACharityCollectionViewCellViewModel: Hashable, Equatable {
    public let charityName: String
    private let charityCause: String

    // MARK: - Init
    
    init(
        charityName: String,
        charityCause: String
    ) {
        self.charityName = charityName
        self.charityCause = charityCause
    }

    public var charityCauseText: String {
        return "Cause: \(charityCause)"
    }
    
    // MARK: - Hashable
    
    static func == (lhs: CACharityCollectionViewCellViewModel, rhs: CACharityCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(charityName)
        hasher.combine(charityCause)
    }
}
