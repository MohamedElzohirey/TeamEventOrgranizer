//
//  TeamEventDetailScreen.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import SwiftUI

struct TeamEventDetailScreen: View {
    
    private let viewModel: TeamEventDetailInterface
    
    init(viewModel: TeamEventDetailInterface) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Image("test avatar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: viewModel.imageHeight, height: viewModel.imageHeight, alignment: .center)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                Text(viewModel.description)
                    .font(.subheadline)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .leading
            )
            VStack(alignment: .center, spacing: 12) {
                ZStack {
                    Button(action: {
                        viewModel.ctaClicked()
                    }) {
                        Text(viewModel.isCTALoading ? "" : viewModel.ctaTitle)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.all, 12)
                            .foregroundColor(.white)
                            .background(Color.blue)
                        
                    }
                    .cornerRadius(25)
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .opacity(viewModel.isCTALoading ? 1 : 0)
                }
                Button(action: {
                    
                }) {
                    Text("View participant")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                .cornerRadius(25)
            }
        }
        .padding()
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .top
        )
    }
}

struct TeamEventDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamEventDetailScreen(
            viewModel: TeamEventDetailViewModel(
                event: Event(
                    id: "1902929392kw",
                    title: "Hackathon 2022",
                    description: descriptionText
                )
            )
        )
    }
}

let descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque placerat mi vel eros venenatis, a convallis urna faucibus. Curabitur tristique sem ligula, rhoncus tempor nisi dapibus vitae. Aenean porta pharetra diam, vel sodales enim fringilla nec. Mauris in tortor in augue euismod feugiat. Integer auctor bibendum leo vitae mattis. Duis in consequat nulla. Praesent lobortis leo tortor, vel tempor arcu laoreet et. Donec sed sagittis dui. Curabitur et lorem nec justo mattis mollis at quis nibh. Donec sed mauris elit. Aliquam consectetur at tellus non egestas "
