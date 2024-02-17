//
//  SecureTextView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 17/2/24.
//

//import SwiftUI
//
//struct SecureTextView: View, SecuredTextFieldParentProtocol {
//    
//    /// This is getting assigned to the method in SecuredTextFieldView to
//    /// execute hide keyboard.
//    @State var hideKeyboard: (() -> Void)?
//    
//    /// The secured tex the usert inputed in SecuredTextFieldView
//    @State private var password = ""
//    
//    /// State of alert apearance.
//    @State private var showingAlert = false
//    
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                Group {
//                    VStack {
//                        SecuredTextFieldView(text: $password, parent: self)
////                            .frame(maxWidth: geometry.size.width * 1)
//                    }
//                }
////                .frame(maxHeight: geometry.size.height * 0.33)
//            }
//        }
//        .padding()
//    }
//    
//    /// Execute the clouser and perform hide keyboard in SecuredTextFieldView.
//    private func performHideKeyboard() {
//        
//        guard let hideKeyboard = self.hideKeyboard else {
//            return
//        }
//        
//        hideKeyboard()
//    }
//}
//
//#Preview {
//    SecureTextView()
//}
