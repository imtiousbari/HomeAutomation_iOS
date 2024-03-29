//
//  Profile.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/12/23.
//

import SwiftUI

struct ProfileButton: View {

    @State private var image: Image = Image("pp")
    var frameSize: CGFloat
    
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
        }
    }
}




#Preview {
    ProfileButton(frameSize: 40)
}
