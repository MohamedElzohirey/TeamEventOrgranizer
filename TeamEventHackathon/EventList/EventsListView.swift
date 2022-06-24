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
    @State private var isShowingNewView = false
    @State private var index = 0
    @State private var selectedEvent: TeamEventDetailScreen!
    
    var body: some View {
        NavigationLink(
            destination: selectedEvent,
            isActive: $isShowingDetailView) { EmptyView() }
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(viewModel.events, id: \.self) { event in
                    EventView(viewModel: TeamEventDetailViewModel(event: event))
                        .tag(event.id)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            isShowingDetailView = true
                            selectedEvent = TeamEventDetailScreen(viewModel: TeamEventDetailViewModel(event: event))
                        }
                    
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                
                
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isShowingNewView = true
                    }, label: {
                        Text("+")
                            .font(.system(.largeTitle))
                            .frame(width: 77, height: 70)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                    })
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                }
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.red)
        }
        
        
    }
}


protocol TeamEventsInterface {
    
    var events: [Event] { get }
}

final class TeamEventsViewModel: TeamEventsInterface {
    var events: [Event]
    
    init(events: [Event]) {
        self.events = events
    }
    
}

