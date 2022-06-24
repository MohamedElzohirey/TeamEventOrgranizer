//
//  LoginView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import SwiftUI


struct LoginView: View {
    @State private var isShowingDetailView = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: EventsListView(viewModel: TeamEventsViewModel(events: [
                    TeamEventDetailViewModel(event: Event(id: "1", title: "11")),
                    TeamEventDetailViewModel(event: Event(id: "2", title: "22")),
                    TeamEventDetailViewModel(event: Event(id: "3", title: "33")),
                    TeamEventDetailViewModel(event: Event(id: "4", title: "44")),
                    TeamEventDetailViewModel(event: Event(id: "5", title: "55")),
                    TeamEventDetailViewModel(event: Event(id: "6", title: "66")),
                    TeamEventDetailViewModel(event: Event(id: "7", title: "77")),
                    TeamEventDetailViewModel(event: Event(id: "9", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "10", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "11", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "12", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "13", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "14", title: "88")),
                    TeamEventDetailViewModel(event: Event(id: "15", title: "88")),
                ])), isActive: $isShowingDetailView) { EmptyView() }

                Button("Login") {
                    isShowingDetailView = true
                }
            }
            .navigationTitle("Login")
        }
    }
}
