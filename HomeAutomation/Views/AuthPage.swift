//
//  AuthPage.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 15/2/24.
//

import SwiftUI

struct AuthPage: View, SecuredTextFieldParentProtocol {
    @State private var username: String = ""
    @State private var password = ""
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack {
                Image("LgBg")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 220)
                    .padding()
                    .padding(.top, 40)
                
                Text("Sign In")
                    .font(.system(size: 24, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "person.fill")
                            .foregroundColor(.white)
                            .padding(.leading)
                        TextField("", text: $username)
                            .padding(.vertical, 8)
                            .placeholder(when: username.isEmpty) {
                                Text("User name").foregroundColor(.white.opacity(0.6))
                            }
                    }
                    .padding(.top,2.5)
                    .padding(.bottom,2.5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white.opacity(1), lineWidth: 1)
                        
                    )
                    .padding(.bottom, 20)

//                    GeometryReader { geometry in
                        VStack {
                            Group {
                                VStack {
                                    SecuredTextFieldView(text: $password, parent: self)
//                                        .frame(maxWidth: geometry.size.width * 1)
                                }
                            }
//                            .frame(maxHeight: geometry.size.height * 0.33)
//                        }
                    }
//                    .padding()
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Perform login action
                }) {
                    Text("Sign In")
                        .foregroundColor(Color.Primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(8)
                }
//                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .background(Color.MainBG)
            .foregroundColor(.white)
            .accentColor(.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            
        }
        
    }
    private func performHideKeyboard() {
        
        guard let hideKeyboard = self.hideKeyboard else {
            return
        }
        
        hideKeyboard()
    }
    
}
//Placeholdeer color modify
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

#Preview {
    AuthPage()
}
