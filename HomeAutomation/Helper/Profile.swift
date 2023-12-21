//
//  Profile.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/12/23.
//

import SwiftUI

struct ProfileButton: View {
    @State private var frameSize: CGFloat = 40
    //    @State private var image: Image = Image(systemName: "person.circle.fill")
    @State private var image: Image = Image("pp")
    
    var body: some View {
        Button(action: {
            // Handle button tap action if needed
            print("Hello..")
        }) {
            image
                .resizable()
                .scaledToFill()
                .frame(width: frameSize, height: frameSize)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .background(Circle().foregroundColor(Color.white))
                .shadow(radius: 4)
        }
        .onTapGesture {
            // You can add an action here if you want to perform something on tap
        }
    }
}

#Preview {
    ProfileButton()
}
