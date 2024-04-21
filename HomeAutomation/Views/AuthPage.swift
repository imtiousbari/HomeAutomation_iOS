//
//  AuthPage.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 15/2/24.
//

//import SwiftUI
//
//
//struct AuthPage: View, SecuredTextFieldParentProtocol {
//    @StateObject var viewModel = LoginViewModel()
//    @State private var username = "kminchelle"
//    @State private var password = "0lelplR"
//    @State var hideKeyboard: (() -> Void)?
//    @State private var showingAlert = false
//    @State private var isLoggedIn = false
//    @State private var showError = false
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image("LgBg")
//                    .resizable()
//                    .frame(maxWidth: .infinity, maxHeight: 220)
//                    .padding()
//                    .padding(.top, 40)
//                
//                Text("Sign In")
//                    .font(.system(size: 24, weight: .regular))
//                    .foregroundColor(.white)
//                    .padding(.bottom, 30)
//                
//                VStack(alignment: .leading) {
//                    HStack{
//                        Image(systemName: "person.fill")
//                            .foregroundColor(.white)
//                            .padding(.leading)
//                        TextField("", text: $username)
//                            .padding(.vertical, 8)
//                            .placeholder(when: username.isEmpty) {
//                                Text("User name").foregroundColor(.white.opacity(0.6))
//                            }
//                    }
//                    .padding(.top,2.5)
//                    .padding(.bottom,2.5)
//                    .background(Color.gray.opacity(0.2))
//                    .cornerRadius(8)
//                    .foregroundColor(.white)
//                    .padding(5)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.white.opacity(1), lineWidth: 1)
//                        
//                    )
//                    .padding(.bottom, 20)
//                    VStack {
//                        Group {
//                            VStack {
//                                SecuredTextFieldView(text: $password, parent: self)
//                            }
//                        }
//                    }
//                    Text("Forgot Password?")
//                        .frame(maxWidth: .infinity, alignment: .trailing).padding(.top,5).font(.system(size: 14, weight: .regular))
//                }
//                .padding(.horizontal)
//             
//                Button(action: {
//                    // Reset error state
//                    viewModel.error = nil
//                    // Attempt login
//                    viewModel.loginUser(username: username, password: password) { success in
//                        if success {
//                            isLoggedIn = true // Update isLoggedIn upon successful login
//                        } else {
//                            showError = true // Show error if login fails
//                        }
//                    }
//                }){
//                    Text("Sign In").bold()
//                        .foregroundColor(Color.Primary)
//                        .padding()
//                        .frame(maxWidth: 330)
//                        .background(Color.white)
//                        .cornerRadius(8)
//                }
//                NavigationLink(
//                    destination: BottomNav(),
//                    isActive: $isLoggedIn
//                ) {
//                    EmptyView()
//                }
//                .padding(.top, 20)
//                .alert(isPresented: Binding<Bool>(
//                    get: { viewModel.error != nil },
//                    set: { _ in viewModel.error = nil }
//                )) {
//                    Alert(title: Text("Alert!"), message: Text(viewModel.error ?? "Unknown error"), dismissButton: .default(Text("OK")))
//                }
//                //                NavigationLink(
//                //                    destination: BottomNav(),
//                //                    isActive: $isLoggedIn
//                //                ) {
//                //                    EmptyView()
//                //                }
//                .padding(.top, 20)
//                .alert(isPresented: Binding<Bool>(get: {
//                    viewModel.error != nil
//                }, set: { _ in
//                    // Reset error state when alert is dismissed
//                    viewModel.error = nil
//                })) {
//                    Alert(title: Text("Alert!"), message: Text(viewModel.error ?? "Unknown error"), dismissButton: .default(Text("OK")))
//                }
//                .navigationDestination(
//                    isPresented:$isLoggedIn) {
//                        BottomNav()
//                        Text("")
//                            .hidden()
//                    }
//                Spacer()
//            }
//            .navigationBarBackButtonHidden(true)
//            .navigationBarHidden(true)
//            
//            .padding()
//            .background(Color.MainBG)
//            .foregroundColor(.white)
//            .accentColor(.white)
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//    private func performHideKeyboard() {
//        
//        guard let hideKeyboard = self.hideKeyboard else {
//            return
//        }
//        
//        hideKeyboard()
//    }
//    
//}
////Placeholdeer color modify
//extension View {
//    func placeholder<Content: View>(
//        when shouldShow: Bool,
//        alignment: Alignment = .leading,
//        @ViewBuilder placeholder: () -> Content) -> some View {
//            
//            ZStack(alignment: alignment) {
//                placeholder().opacity(shouldShow ? 1 : 0)
//                self
//            }
//        }
//}
import SwiftUI

struct AuthPage: View, SecuredTextFieldParentProtocol {
    @StateObject var viewModel = LoginViewModel()
    @State private var username = "kminchelle"
    @State private var password = "0lelplR"
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    @State private var isLoggedIn = false
    @State private var showError = false
    
    var body: some View{
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
                    
                    VStack {
                        SecuredTextFieldView(text: $password, parent: self)
                    }
                    
                    Text("Forgot Password?")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 5)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal)
             
                Button(action: {
                    // Reset error state
                    viewModel.error = nil
                    // Attempt login
                    viewModel.loginUser(username: username, password: password) /*{ success in*/
//                        if success {
//                            isLoggedIn = true // Update isLoggedIn upon successful login
//                        } else {
//                            showError = true // Show error if login fails
//                        }
//                    }
                }) {
                    Text("Sign In").bold()
                        .foregroundColor(Color.Primary)
                        .padding()
                        .frame(maxWidth: 330)
                        .background(Color.white)
                        .cornerRadius(8)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .padding()
            .background(Color.MainBG)
            .foregroundColor(.white)
            .accentColor(.white)
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $showError) {
                Alert(title: Text("Alert!"), message: Text(viewModel.error ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                BottomNav()
            }
        }
    }
}

// Placeholder color modify
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


#Preview {
    AuthPage()
}
