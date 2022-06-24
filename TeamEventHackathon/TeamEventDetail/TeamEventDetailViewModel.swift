//
//  TeamEventDetailViewModel.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import Foundation
import SwiftUI

protocol CTAAction {
    
    var title: String { get }
    
    func buttonClicked()
    
}

class BaseButtonACtion: CTAAction {

    var title: String
    var context: TeamEventDetailInterface
    
    init(context: TeamEventDetailInterface) {
        self.context = context
        self.title = ""
    }
    
    func buttonClicked() {}
    
}

class JoinButtonAction: BaseButtonACtion {
    
    override init(context: TeamEventDetailInterface) {
        super.init(context: context)
        self.title = "Join"
    }
    
    override func buttonClicked() {
        print("here is the join")
        super.context.transition(to: CancelButtonAction(context: super.context))
    }
}

class CancelButtonAction: BaseButtonACtion {
    
    override init(context: TeamEventDetailInterface) {
        super.init(context: context)
        self.title = "Cancel"
    }
    
    override func buttonClicked() {
        print("here is the cancel")
        super.context.transition(to: JoinButtonAction(context: super.context))
    }
    
}

protocol TeamEventDetailInterface: AnyObject {
    
    var title: String { get }
    var description: String { get }
    var imageHeight: CGFloat { get }
    var ctaTitle: String { get }
    var isCTALoading: Bool { get set }
    
    func ctaClicked()
    func transition(to state: CTAAction)
}

class TeamEventDetailViewModel: Identifiable, TeamEventDetailInterface {
    var id: String {
        event.id
    }
    
    let event: Event
    var title: String {
        event.title
    }
    var description: String {
        event.description
    }
    let imageHeight: CGFloat = 200
    @State var ctaTitle: String = "Join"
    @State var isCTALoading: Bool = false
    
    lazy var ctaButtonState: CTAAction = JoinButtonAction(context: self)
    
    init(event: Event) {
        self.event = event
    }
    
    func ctaClicked() {
        print("here is the current stat \(ctaButtonState)")
        self.isCTALoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isCTALoading = false
            self.ctaButtonState.buttonClicked()
        }
    }
    
    func transition(to state: CTAAction) {
        self.ctaButtonState = state
        self.ctaTitle = state.title
    }
}
