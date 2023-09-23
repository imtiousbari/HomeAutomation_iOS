//
//  GettingStarted.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 21/9/23.
//

import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.13, green: 0.14, blue: 0.15)
                    .ignoresSafeArea()

                VStack {
                    GeometryReader { geometry in
                        Image("shadow")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: 436)
                            .ignoresSafeArea(edges: .top)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)

                    VStack {
                        VStack {
                            Text("Easy living with your \nsmart home 💡")
                                .font(Font.custom("Catamaran", size: 26).weight(.bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()

                            Text("Get your smart devices in one place and manage \nall of these with a few taps.")
                                .font(Font.custom("Noto Sans", size: 14).weight(.medium))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.85, green: 0.87, blue: 0.9))
                                .padding()
                        }
                        .padding(.bottom, 80)

                        NavigationLink(destination: AppView()
                                        .navigationBarBackButtonHidden(true)) { // Hide the back button
                            Text("Get Started")
                                .font(
                                    Font.custom("Noto Sans", size: 14)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(20)
                                .frame(maxWidth: 350, alignment: .center)
                                .background(Color(red: 0.11, green: 0.52, blue: 0.95))
                                .cornerRadius(14)
                        }
                    }
                }
            }
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}


struct GettingStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedView()
    }
}
