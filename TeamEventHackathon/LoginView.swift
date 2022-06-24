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
                NavigationLink(destination: EventsListView(), isActive: $isShowingDetailView) { EmptyView() }

                Button("Login") {
                    isShowingDetailView = true
                }
            }
            .navigationTitle("Login")
        }
    }
}
