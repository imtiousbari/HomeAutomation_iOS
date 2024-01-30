//
//  ProfileView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 27/1/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ZStack {
                VStack{
//                    Text("Hello")
                    ProfileButton(frameSize: 80)
                    Text("User Name")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .padding()
                
                }
                .padding(.top,50)
                .zIndex(2)
                Color.Primary
                    .edgesIgnoringSafeArea(.all)
                
                Image("IsolationMode")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 50)
                    .foregroundColor(.white)
                    .padding()
                    .offset( x:50, y: 80)
               
                .foregroundColor(.white)
                //            .padding()
                //            .padding(.bottom,50)
            }
            
            .background(Color.white)
            .frame(width: 400, height: 250)
            //        .cornerRadius(20)
            .cornerRadius(20, corners: [/*.topLeft, .topRight,*/ .bottomLeft, .bottomRight])
            Spacer()
        }
        .foregroundColor(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProfileView()
}
