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
        HStack {
            VStack{
                Text("Event Name: \(viewModel.event.title)")
                Text(viewModel.event.id.description)
            }
            .frame(maxWidth: .infinity)
            

            Image(systemName: "heart.fill")
                .frame(width: 100, height: 100, alignment: .center)
            
        }
        .background(Color.yellow)


    }
}

