//
//  EventsListView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Abdelsalam Elzohirey on 24/06/2022.
//

import SwiftUI

struct EventsListView: View {
    var events = 1...1000
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {

                ForEach(events, id: \.self) { event in
                    EventView(event: event)
                        .frame(maxWidth: .infinity)

                }
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(Color.red)

        }
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        EventsListView()
    }
}
