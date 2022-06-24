//
//  TeamEventDetailViewModel.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import Foundation

protocol TeamEventDetailInterface {
    
    var event: Event { get }
}

struct TeamEventDetailViewModel: TeamEventDetailInterface, Hashable {
    static func == (lhs: TeamEventDetailViewModel, rhs: TeamEventDetailViewModel) -> Bool {
        return lhs.event == rhs.event
    }
    
    
    var event: Event
    
    init(event: Event) {
        self.event = event
    }
    
}
