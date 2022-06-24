//
//  EventsListView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Abdelsalam Elzohirey on 24/06/2022.
//

import SwiftUI

struct EventsListView: View {
    let viewModel: TeamEventsInterface

    @State private var isShowingDetailView = false
    @State private var index = 0

    var body: some View {
        NavigationLink(destination: TeamEventDetailScreen(viewModel: viewModel.events[0]), isActive: $isShowingDetailView) { EmptyView() }
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {

                ForEach(viewModel.events, id: \.self) { event in
                    EventView(viewModel: event)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            isShowingDetailView = true
                        }

                    Spacer()
                }
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.red)
            

        }
    }
}


protocol TeamEventsInterface {
    
    var events: [TeamEventDetailViewModel] { get }
}

final class TeamEventsViewModel: TeamEventsInterface {
    var events: [TeamEventDetailViewModel]
    
    init(events: [TeamEventDetailViewModel]) {
        self.events = events
    }
    
}

