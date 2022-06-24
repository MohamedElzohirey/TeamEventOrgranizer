//
//  EventView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Abdelsalam Elzohirey on 24/06/2022.
//

import SwiftUI

struct EventView: View {
    let event: Int
    var body: some View {
        HStack {
            VStack{
              Text("Event Name: \(event.description)")
                Text(event.description)
            }
            .frame(maxWidth: .infinity)
            

            Image(systemName: "heart.fill")
                .frame(width: 100, height: 100, alignment: .center)
            
        }
        .background(Color.yellow)


    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: 0)
    }
}
