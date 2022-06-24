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

final class TeamEventDetailViewModel: TeamEventDetailInterface {
    var event: Event
    
    init(event: Event) {
        self.event = event
    }
    
}
