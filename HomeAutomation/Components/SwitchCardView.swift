//
//  SwitchCardView.swift
//  HomeAutomation
//
//  Created by Imtious Bari on 24/12/23.
//

import SwiftUI

struct SwitchView: View {
    @State private var isSwitchOn = false

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 250, height: 150)
                .foregroundColor(isSwitchOn ? Color.Primary : .white)
                .cornerRadius(15)
                .overlay(
                    VStack {
                        HStack{
                            Image(systemName: isSwitchOn ? "lightbulb.max.fill" : "lightbulb")
                                .font(.system(size: isSwitchOn ? 25 : 30))
                                .foregroundColor(isSwitchOn ? .white : .black)
                                .padding(.leading,-15)
                            Spacer()
                            Button(action: {
                                self.isSwitchOn.toggle()
                            }) {
                                Image(systemName: "power.circle")
                                    .font(.system(size: 30))
                                    .foregroundColor(isSwitchOn ? .green : .black)
                                    .padding(.trailing,-15)

                            }
                        }
                        .padding()
                        Spacer()
                        HStack{
                            Text("Bedroom Light 01:")
                                .foregroundColor(isSwitchOn ? .white : .black)
                                .font(.system(size: 20))
                            Text(isSwitchOn ? "ON" : "OFF")
                                .foregroundColor(isSwitchOn ? Color.CusYellow : .green)
                                .font(.system(size: 20))
                        }
                        
                    }
                        .padding()
                )
        }
//        .padding(10000)
//        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)

    }
}

#Preview {
    SwitchView()
}
