//
//  AuthPage.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 15/2/24.
//

import SwiftUI

struct AuthPage: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordHidden: Bool = true
    @State private var isShowingAlert: Bool = false
    
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
                    ZStack {
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
                    }
                    .padding(5)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white.opacity(1), lineWidth: 1)
                        
                    )
                    .padding(.bottom, 20)
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.white)
                            .padding(.leading, 8)
                        
                        SecureField("Password", text: $password)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 8)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .placeholder(when: username.isEmpty) {
                                Text("Password").foregroundColor(.white.opacity(0.6))
                            }
                        
                        Button(action: {
                            isPasswordHidden.toggle()
                        }) {
                            Image(systemName: isPasswordHidden ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.blue)
                                .padding(.trailing, 8)
                        }
                    }
                    .padding(.bottom, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white.opacity(0.7), lineWidth: 1)
                    )
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Perform login action
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
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
