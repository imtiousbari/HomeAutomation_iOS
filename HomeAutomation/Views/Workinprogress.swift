//
//  Workinprogress.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 23/12/23.
//

import SwiftUI

struct Workinprogress: View {
    var body: some View {
        VStack{
            Spacer()
            Text("This feature is currently under\n development")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(Color.gray)
            Image("workinprogress")
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .padding(50)
        .background(Color.Bg)
//        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Workinprogress()
}
