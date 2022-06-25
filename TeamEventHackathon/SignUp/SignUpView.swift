//
//  SignUpView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Abdelsalam Elzohirey on 25/06/2022.
//

import SwiftUI


struct SignUpView: View {
    @State private var isShowingDetailView = false
    @State var emailAddress: String = ""
    @State var name: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            NavigationLink(destination: EventsListView(viewModel: TeamEventsViewModel(events: [
                Event(id: "1", title: "11", description: descriptionText),
                Event(id: "2", title: "22", description: descriptionText),
                Event(id: "3", title: "33", description: descriptionText),
                Event(id: "4", title: "44", description: descriptionText),
                Event(id: "5", title: "55", description: descriptionText),
                Event(id: "6", title: "66", description: descriptionText),
                Event(id: "7", title: "77", description: descriptionText),
                Event(id: "8", title: "88", description: descriptionText),
            ])), isActive: $isShowingDetailView) {
                EmptyView()
            }
            GeometryReader { geometry in
                VStack (alignment: .center){
                    Text("Create new Account")
                        .font(.title)
                        .font(.system(size: 14, weight: .bold, design: Font.Design.default))
                        .padding(.bottom, 50)
                    
                    Button(action: {
                        print("Add photo")
                    }) {
                        VStack(alignment: .center) {
                            Text("+")
                                .font(.system(size: 18))
                            Text("Add Photo")
                                .font(.system(size: 10))
                        }.padding()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                    }
                    .clipShape(Circle())
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .center, spacing: 12, content: {
                        TextField("Name", text: self.$name)
                            .frame(width: geometry.size.width - 45, height: 50)
                            .textContentType(.emailAddress)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.red)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                        
                        TextField("Email", text: self.$emailAddress)
                            .frame(width: geometry.size.width - 45, height: 50)
                            .textContentType(.emailAddress)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.red)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                        
                        TextField("Phone", text: self.$phone)
                            .frame(width: geometry.size.width - 45, height: 50)
                            .textContentType(.emailAddress)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.red)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                        
                        TextField("Password", text: self.$password)
                            .frame(width: geometry.size.width - 45, height: 50)
                            .textContentType(.emailAddress)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.red)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                    })
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    
                    Text("Terms of Service and Privacy Policy")
                        .foregroundColor(Color.blue)
                        .padding(.bottom, 40)
                        .font(.system(size: 12))
                    
                    Button(action: {
                        isShowingDetailView = true
                    }) {
                        HStack {
                            Text("Create Account")
                        }
                        .padding()
                        .frame(width: geometry.size.width - 40, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(5)
                    }.padding(.bottom, 40)
                    
                    
                    Spacer()
                    
                }
                
            }
        }
    }
}

