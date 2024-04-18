//
//  CACharityEventDetailViewViewModel.swift
//  CharityAtlas
//
//  Created by Maria Kim on 11/28/23.
//

import Foundation

class CACharityEventDetailViewViewModel {
    var title = "Detail Title"
    var event: CACharityEvent
    
    init(event: CACharityEvent) {
        self.event = event
    }
}
