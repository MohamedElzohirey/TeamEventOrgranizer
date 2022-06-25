//
//  EventView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Abdelsalam Elzohirey on 24/06/2022.
//

import SwiftUI

struct EventView: View {
    let viewModel: TeamEventDetailViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 0, content: {
            VStack{
                Text("Event Name:")
                    .font(.headline).bold()
                    
                Text("Event Name: \(viewModel.event.title)")
                Text("Time: " + "Friday 14.03.2022 18:30")
                    .foregroundColor(.blue)
            }
            .frame(maxWidth: .infinity)
            

            Image("event")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
        })

    }
}

