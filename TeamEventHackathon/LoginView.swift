//
//  LoginView.swift
//  TeamEventHackathon
//
//  Created by Mohamed Emad Elsayed Hassan on 24.06.22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isSecure = true
    @State private var isShowingDetailView = false
    @State private var isShowingSignUpView = false
    var body: some View {
        NavigationView {
            
            
            
            VStack(alignment: .center, spacing: 0){
                NavigationLink(destination: EventsListView(viewModel: TeamEventsViewModel(events: [
                    Event(id: "1", title: "Credit team meeting - May 2022", description: descriptionText),
                    Event(id: "2", title: "Loans team meeting - May 2022", description: descriptionText),
                    Event(id: "3", title: "Bank meeting - May 2022", description: descriptionText),
                    Event(id: "4", title: "XYZ meeting - May 2022", description: descriptionText),
                    Event(id: "5", title: "Shopping team meeting - May 2022", description: descriptionText),
                    Event(id: "6", title: "Play team meeting - May 2022", description: descriptionText),
                    Event(id: "7", title: "Creditteam meeting - May 2022", description: descriptionText),
                    Event(id: "8", title: "FeWo team meeting - May 2022", description: descriptionText),
                ])), isActive: $isShowingDetailView) {
                    EmptyView()
                }
                NavigationLink(destination: SignUpView(), isActive: $isShowingSignUpView) {
                    EmptyView()
                }
                HStack(alignment: .center, spacing: 0){
                    ZStack{
                        //Image("title")
                        Image("v")
                            .resizable()
                            .frame(width: 200, height: 120, alignment: .center)
                    }
                }
                .padding(.top,4)
                .padding(.bottom,18)
                
                EntryFieldView(imageName: "user", placeholder: "Username", validationText: viewModel.usernamePrompt, field: $viewModel.username, strokeColorHex: "#22735c")
                    .padding()
                
                SecureEntryFieldView(imageName: "key", placeholder: "Password", validationText: viewModel.passwordPrompt, field: $viewModel.password, strokeColorHex: "#F0F0F0")
                    .padding()
                
                EntryFieldView(imageName: "email", placeholder: "Email address", validationText: viewModel.emailPrompt, field: $viewModel.email, strokeColorHex: "#F0F0F0")
                    .padding()
                
      
                .padding(.top, 25)
                .frame(height: 20)
                
                Spacer()
                
                HStack{
                    
                    
                    Button(action: {
                        isShowingDetailView = true
                    }) {
                        HStack {
                            Spacer()
                            Text("LOGIN")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 100,height: 52)
                    .contentShape(Rectangle())
                    .opacity(viewModel.canSubmit ? 1 : 0.6)
                    .disabled(!viewModel.canSubmit)
                }
                .background(Color.init(hex: "#1629d9"))
                .cornerRadius(10)
                .padding([.leading,.trailing],36)
                
                HStack(alignment: .center, spacing: 0){
                    Text("Don’t have an account?")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(Color.init(hex: "#22735c"))
                    Button(" Sign up") {
                        isShowingSignUpView = true
                    }
                    .foregroundColor(Color.init(hex: "#22735c"))
                    .font(.system(size: 15, weight: .bold, design: .default))
                }
                .padding([.leading,.trailing],36)
                .padding(.top, 30)
                .frame(height: 20)
                
                
                Spacer()
            }
        }
    }
}

struct EntryFieldView: View {
    var imageName: String
    var placeholder: String
    var validationText: String
    @Binding var field: String
    var strokeColorHex:String
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .center, spacing: 11) {
                Image(imageName)
                    .renderingMode(.original)
                    .padding(.leading,15)
                TextField(placeholder, text: $field)
            }
            .frame(height: 52)
            .autocapitalization(.none)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.init(hex: strokeColorHex), lineWidth: 1))
            .padding([.leading,.trailing],36)
            
            Text(validationText)
                .foregroundColor(Color.red)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .padding([.leading,.trailing],36)
                .padding(.bottom,4)
        }
    }
}

struct SecureEntryFieldView: View {
    var imageName: String
    var placeholder: String
    var validationText: String
    @Binding var field: String
    @State private var isSecure:Bool = true
    var strokeColorHex:String
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .center, spacing: 11) {
                Image(imageName)
                    .renderingMode(.original)
                    .padding(.leading,15)
                
                if isSecure {
                    SecureField(placeholder, text: $field)
                    
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image("eye")
                            .renderingMode(.original)
                            .padding(.trailing,15)
                    }
                    
                } else {
                    TextField(placeholder, text: $field)
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image("eye")
                            .renderingMode(.original)
                            .padding(.trailing,15)
                    }
                }
            }
            .frame(height: 52)
            .autocapitalization(.none)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.init(hex: strokeColorHex), lineWidth: 1))
            .padding([.leading,.trailing],36)
            
            Text(validationText)
                .foregroundColor(Color.red)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .padding([.leading,.trailing],36)
                .padding(.bottom,4)
        }
    }
}




import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email = "mohamed.elzohirey@gmail.com"
    @Published var password = "abcdefG1"
    @Published var username = "mohamed"
    
    @Published var isEmailCriteriaValid = false
    @Published var isPasswordCriteriaValid = false
    @Published var isUsernameCriteriaValid = false
    @Published var canSubmit = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$")
    let usernamePredicate = NSPredicate(format: "SELF MATCHES %@ ", "[a-za-z0-9!@#$%^&*()._-]{1,16}")
    
    init() {
        
        $username
            .map { username in
                return self.usernamePredicate.evaluate(with: username)
            }
            .assign(to: \.isUsernameCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        $email
            .map { email in
                return self.emailPredicate.evaluate(with: email)
            }
            .assign(to: \.isEmailCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        
        Publishers.CombineLatest3($isUsernameCriteriaValid, $isPasswordCriteriaValid, $isEmailCriteriaValid)
            .map { isUsernameCriteriaValid, isPasswordCriteriaValid, isEmailCriteriaValid in
                return (isUsernameCriteriaValid && isPasswordCriteriaValid && isEmailCriteriaValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    
    var usernamePrompt: String {
        isUsernameCriteriaValid ?
        ""
        :
        "Should not have spaces and no upper case alphabet."
    }
    
    var emailPrompt: String {
        isEmailCriteriaValid ?
        ""
        :
        "Enter a valid email address"
    }
    
    var passwordPrompt: String {
        isPasswordCriteriaValid ?
        ""
        :
        "Should have 8 charecters, 1 number, 1 upper case alphabet, 1 lowercase alphabet."
    }
    
    
    
    func login() {
        username = ""
        password = ""
        email = ""
    }
}
