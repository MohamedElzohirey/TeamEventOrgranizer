//
//  TeamEventDetailScreen.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import SwiftUI

struct TeamEventDetailScreen: View {
    
    private let viewModel: TeamEventDetailInterface
    private var event: Event {
        viewModel.event
    }
    
    init(viewModel: TeamEventDetailInterface) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
                Form {
                    Section {
                        Text("Hello, world!")
                    }
                }
            }
        .navigationTitle(event.title)
    }
}

struct TeamEventDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamEventDetailScreen(
            viewModel: TeamEventDetailViewModel(
                event: Event(
                    id: "flasdkjfjslkadjflasdkjf",
                    title: "Salat Ele gom3a"
                )
            )
        )
    }
}
