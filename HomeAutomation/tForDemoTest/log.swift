//
//  log.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 20/2/24.
//


import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var username = "kminchelle"
    @State private var password = "0lelplR"
    @State private var isLoggedIn = false
    @State private var showError = false

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                viewModel.loginUser(username: username, password: password)
            }) {
                Text("Sign In").bold()
                    .foregroundColor(Color.primary)
                    .padding()
                    .frame(maxWidth: 330)
                    .background(Color.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            .alert(isPresented: $showError) {
                Alert(title: Text("Error"), message: Text(viewModel.error ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
            .onChange(of: viewModel.user) { newUser in
                if let user = newUser {
                    isLoggedIn = true
                    print("Logged in user: \(user)")
                    NavigationLink(
                        destination: BottomNav(),
                        isActive: $isLoggedIn) {
                            EmptyView()
                        }
                }
            }
            .onChange(of: viewModel.error) { newError in
                if newError != nil {
                    showError = true
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
