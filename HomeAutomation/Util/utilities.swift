////
////  SecureTextView.swift
////  HomeAutomation
////
////  Created by Imtious Bari on 17/2/24.
////
import Foundation
import SwiftUI
////navigation title color
////extension View {
////    func navigationBarTitleColor(_ color: UIColor?) -> some View {
////        self.modifier(NavigationBarTitleColorModifier(titleColor: color))
////    }
////}
////
////struct NavigationBarTitleColorModifier: ViewModifier {
////    var titleColor: UIColor?
////
////    func body(content: Content) -> some View {
////        content.onAppear {
////            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor ?? .black]
////            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor ?? .black]
////        }
////    }
////}
////custombackbutton
//struct NavBackButton: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var body: some View {
//        Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//        }) {
//            HStack {
//                Image(systemName: "chevron.left")
//                    
//                    .foregroundColor(Color.Primary) // Set back button color here
////                Text("Back")
////                    .foregroundColor(.white) // Set back button color here
//            }
//        }
//    }
//}
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}
